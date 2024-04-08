

#include "..\stdint.h"

#include "REG_MPC82G516.h"

#include "modbus.h"
#include "main.h"
#include "..\ascii.h"
#include "slave.h"


/* ASCII FRAME */
// ascii_frame 是一個全局變數，它是一個 uint8_t 類型的陣列，用於存儲 Modbus ASCII 模式下的幀數據。在 Modbus ASCII 模式下，每個字節的數據都會被轉換為兩個 ASCII 字符，因此一個完整的 Modbus ASCII 幀可能包含多達 255 個字符。
// 在 execute_modbus_command 函數中，ascii_frame 陣列被用來存儲接收到的 Modbus 命令。然後，該函數會讀取 ascii_frame 陣列中的數據，並根據 Modbus 協定的規定進行處理。例如，它會檢查 LRC（Longitudinal Redundancy Check）以確保數據的完整性，並讀取 Modbus 地址以確定命令是否應該被當前的設備執行。
// 如果接收到的命令無效（例如，LRC 不匹配或 Modbus 地址不匹配），execute_modbus_command 函數會調用 clear_frame 函數來清除 ascii_frame 陣列中的數據。
uint8_t idata ascii_frame[ASCII_FRAME_SIZE]; // max size = 255

// data_count 是一個全局變數，它用於追蹤 ascii_frame 陣列中當前的數據數量。當新的 Modbus 命令被接收並存儲在 ascii_frame 陣列中時，data_count 會增加。當 execute_modbus_command 函數讀取 ascii_frame 陣列中的數據並處理 Modbus 命令時，data_count 會被用來確定需要讀取的數據數量。
// 例如，在 execute_modbus_command 函數中，首先會檢查 data_count 是否小於 9。如果是，則調用 clear_frame 函數清除 ascii_frame 陣列，並返回。這是因為有效的 Modbus 命令至少需要 9 個字符。
// 然後，data_count 會減去 2（跳過換行符和回車符），並從 ascii_frame 陣列中讀取 LRC。之後，data_count 再次減去 2（跳過 LRC），並調用 lrc_calc 函數計算 LRC。
// 因此，data_count 是一個重要的變數，它用於追蹤和管理 ascii_frame 陣列中的數據。
uint8_t idata data_count = 0;

// send_count 是一個全局變數，它用於追蹤當前已經發送的 Modbus 命令的數量。每當一個 Modbus 命令被發送，send_count 就會增加。
// 這個變數可能被用於多種情況，例如：
// 在發送多個 Modbus 命令的情況下，send_count 可以用來確定所有的命令是否都已經被發送。
// 在需要限制 Modbus 命令發送速度的情況下，send_count 可以用來確定是否已經達到了發送限制。
// 在需要追蹤 Modbus 命令的執行情況的情況下，send_count 可以用來確定哪些命令已經被執行，哪些命令還沒有被執行。
// 請注意，提供的程式碼片段並沒有顯示 send_count 是如何被使用的，所以以上的解釋只是可能的使用情況。
uint8_t idata send_count = 0;

// 在 Modbus 協議中，broadcast 是一個特殊的概念。當一個 Modbus 命令的地址設置為 0 時，該命令被認為是一個廣播命令，所有的 Modbus 設備都應該執行該命令，而不僅僅是特定地址的設備。
//在你的程式碼中，broadcast 是一個 bit 類型的全局變數。當 execute_modbus_command 函數讀取到一個 Modbus 命令的地址為 0 時，它會將 broadcast 變數設置為 1。否則，broadcast 變數將被設置為 0。
//這個變數可能被用於決定是否需要執行某個 Modbus 命令。例如，如果 broadcast 變數為 1，則所有的 Modbus 命令都應該被執行，無論它們的地址是否與當前設備的地址匹配。如果 broadcast 變數為 0，則只有地址與當前設備地址匹配的 Modbus 命令才應該被執行。
bit broadcast = 0;


/// @brief execute_modbus_command 函數的功能是執行 Modbus 命令。這個函數在接收到 Modbus 命令並需要處理該命令時會被調用。
///        以下是該函數的步驟：
///        1. 檢查 data_count 是否小於 9。如果是，則調用 clear_frame 函數清除 ascii_frame 陣列，並返回。這是因為有效的 Modbus 命令至少需要 9 個字符。
///        2. 減去 2 從 data_count（跳過換行符和回車符），並從 ascii_frame 陣列中讀取 LRC。
///        3. 調用 lrc_calc 函數計算 LRC，並檢查計算出的 LRC 是否與讀取的 LRC 相等。如果不相等，則調用 clear_frame 函數清除 ascii_frame 陣列，並返回。
///        4. 讀取 ascii_frame 陣列中的 Modbus 地址，並檢查是否為 0。如果是，則將 broadcast 變數設定為 1。否則，將 broadcast 變數設定為 0，並檢查 Modbus 地址是否與 DIR 變數相等。如果不相等，則調用 clear_frame 函數清除 ascii_frame 陣列，並返回。
///        該函數的結果是 Modbus 命令被執行，或者在命令無效時 ascii_frame 陣列被清除。
/// @param  
void execute_modbus_command(void)   
{
    uint8_t is_me = 0, fun = 0, lrc = 0;         

    if ( data_count < 9 )
    {     
        clear_frame();  // bad frame discard , minimun 9 characters for valid  
        return;
    }
    data_count -= 2; //skip cr lf       
    lrc = AsciiToByte(ascii_frame[data_count-2], ascii_frame[data_count-1]);
    data_count -= 2; //skip lrc   
    fun = lrc_calc(); 
    if ( fun != lrc )
    {     
        clear_frame();  // bad LRC, frame discard    
        return;
    }
     
    /*   frame ok  */
    is_me = AsciiToByte(ascii_frame[1], ascii_frame[2]); 
    if ( is_me == 0 )
    {
        broadcast = 1;    
    }
    else
    {
        broadcast = 0;
        if ( DIR != is_me )
        {
            clear_frame();
            return;   
        }
    }

    fun = AsciiToByte(ascii_frame[3], ascii_frame[4]);    
    switch ( fun )
    {
        case 1:
        {                 
            ResponseReadCoilsStatus_01();            
            break;        
        }
        case 2:
        {
            ResponseReadInputStatus_02();
            break;
        }
        case 3:
        {        
            ResponseReadHoldingRegisters_03();
            break;
        }
        case 4:
        {
            ResponseReadInputRegisters_04();
            break;
        }
        case 5:
        {           
            ResponseForceSingleCoil_05();            
            break;
        }
        case 6:
        {
            ResponsePresetSingleRegister_06();            
            break;
        }
        case 15:
        {                     
            ResponseForceMultipleCoils_15();
            break;            
        }        
        case 16:
        {              
            ResponsePresetMultipleRegisters_16();
            break;            
        }        
        default: 
        {
            break;
        }
    }
}


/// @brief gen_lrc 函數的功能是生成當前 ASCII 幀的縱向冗餘檢查（LRC）。LRC 是 Modbus 協定中用於錯誤檢查的一種校驗和。
///        以下是該函數的步驟：
///        1. 調用 lrc_calc 函數來計算當前 ASCII 幀的 LRC。lrc_calc 函數的具體實現在提供的程式碼中沒有顯示，但它可能通過對幀中的所有字節進行異或運算來計算 LRC。
///        2. 使用 ByteToAscii 函數將計算出的 LRC 轉換為 ASCII，並將結果存儲在 ascii 陣列中。
///        3. 在當前 data_count 位置將 ASCII 編碼的 LRC 添加到 ascii_frame 陣列中，並將 data_count 增加 2，因為 LRC 的每個字節在 ASCII 中佔用兩個字節。
///        4. 然後在 ascii_frame 陣列中添加 ASCII 換行符（CR）和換行符（LF），並再次將 data_count 增加 2。
///        該函數的結果是將 ASCII 編碼的 LRC 和 CR、LF 字符添加到 ascii_frame 中，準備傳輸。
/// @param  
void gen_lrc(void)
{
    ByteToAscii(lrc_calc());
    ascii_frame[data_count++] = ascii[0];
    ascii_frame[data_count++] = ascii[1];
    
    ascii_frame[data_count++] = CR;
    ascii_frame[data_count++] = LF;    
}


/// @brief clear_frame 函數的功能是清除 ascii_frame 陣列中的所有數據，並將 data_count 和 send_count 變數重置為 0。這個函數在準備新的 ASCII 幀以傳輸時可能會被調用。
///        以下是該函數的步驟：
///        1. 將 data_count 和 send_count 變數重置為 0。
///        2. 使用 for 迴圈遍歷 ascii_frame 陣列的每個元素。在每次迴圈中，將當前元素的值設定為 0。
///        該函數的結果是 ascii_frame 陣列被清空，並且 data_count 和 send_count 變數被重置，為傳輸新的 ASCII 幀做好準備。
/// @param  
void clear_frame(void)
{    
    uint8_t i = 0;

    data_count = 0;
    send_count = 0;
    for ( i = 0; i < ASCII_FRAME_SIZE; i++ )
    {
        ascii_frame[i] = 0;
    }
}


/// @brief tx_assci_frame 函數的功能是傳輸 ascii_frame 陣列中的數據。這個函數在需要將 ASCII 幀發送到 Modbus 網路時會被調用。
///        以下是該函數的步驟：
///        1. 檢查 broadcast 變數是否為 1。如果是，則將 RS485En 設定為 0（設定為接收模式），將 broadcast 變數重置為 0，調用 clear_frame 函數清除 ascii_frame 陣列，然後返回。
///        2. 如果 broadcast 變數不為 1，則將 RS485En 設定為 1（設定為傳輸模式）。
///        3. 將 send_count 變數設定為 1。
///        4. 將 TI 和 TB8 變數設定為 0。
///        5. 將 ascii_frame 陣列的第一個元素設定為 SBUF 變數的值，以開始傳輸。
///        該函數的結果是 ascii_frame 陣列中的數據被傳輸到 Modbus 網路。
/// @param  
void tx_assci_frame(void)
{
    if ( broadcast == 1 )
    {
        RS485En = 0;    //rx
        broadcast = 0;
        clear_frame();
        return ;    
    }
   
    RS485En = 1; // set for tx   
    send_count = 1;
    TI = 0;
    TB8 = 0;        
    SBUF = ascii_frame[0];
}


/// @brief lrc_calc 函數的功能是計算 Longitudinal Redundancy Check (LRC)。LRC 是一種錯誤檢查方法，常用於 Modbus ASCII 協定中來確保數據的完整性。
///        以下是該函數的步驟：
///        1. 初始化 result 和 i 變數為 0。
///        2. 使用 for 迴圈遍歷 ascii_frame 陣列的每個元素。在每次迴圈中，將當前元素的值加到 result 變數上。
///        3. 在迴圈結束後，將 result 變數的值與 0xFF 進行 AND 運算，然後將結果與 0xFF 進行 XOR 運算。
///        4. 返回 result 變數的值。
///        該函數的結果是計算出的 LRC 值。這個值可以用來檢查 Modbus ASCII 幀的數據是否完整。
/// @param  
/// @return 
uint8_t lrc_calc(void) 
{
    uint8_t result = 0, i = 0;            

    for ( i = 1; i < data_count; i+=2 )
    {
        result += AsciiToByte(ascii_frame[i], ascii_frame[i+1]);
    }
    result = ~result;
    return ( result + 1 );
}


/* function codes */

/// @brief ResponseReadCoilsStatus_01 函數的功能是讀取並回應 Modbus 協定中的線圈狀態。這是 Modbus 功能碼 0x01 的實現。
///        首先，它從 ASCII 編碼的請求幀中提取起始地址和線圈數量，並將它們轉換為數字。
///        然後，它遍歷每個要查詢的線圈。對於每一組最多 8 個線圈，它調用 GetCoilValue 函數來獲取每個線圈的狀態，並將這些狀態編碼為一個 byte（每個線圈的狀態對應一個位）。如果線圈是活動的（即 GetCoilValue 返回 1），則相應的位被設置為 1。
///        接著，它將每個線圈狀態 byte 轉換為 ASCII 編碼，並將它們添加到回應幀中。
///        最後，它將回應幀的數據數量更新為新的數據數量，並將其轉換為 ASCII 編碼。
///        這個函數的結果是一個 ASCII 編碼的 Modbus 回應幀，該幀包含了請求的線圈的狀態。 
/// @param  
void ResponseReadCoilsStatus_01(void) // 0x01, OK
{
    uint16_t start = 0, cant = 0;
    uint16_t i = 0, limit = 0;
    uint8_t coils = 0, k = 0, new_data_count = 0;

    data_count = 7;  // data count byte reserved        
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 5];
    }    
    start = AsciiToTwoByte();
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 9];
    }    
    cant = AsciiToTwoByte();    
    limit = start + cant;

    /* querying coils status */
    for ( i = start; i < limit; i += 8 )
    {
        k = 0;
        coils = 0;    
        while ( k < 8 && i + k < limit)            
        {        
            uint8_t val = GetCoilValue(i + k);    // status of coil i+k
            if ( val == 1 ) //coil active
            {
                coils |= (1 << k);            
            }                
            k++;
        }            
        ByteToAscii(coils);
        ascii_frame[data_count++] = ascii[0];
        ascii_frame[data_count++] = ascii[1];        
        new_data_count++;     // add one byte to response frame
    }
    
    ByteToAscii(new_data_count);
    ascii_frame[5] = ascii[0];
    ascii_frame[6] = ascii[1];

    gen_lrc();
    
    tx_assci_frame();
    return;
}


/// @brief ResponseReadInputStatus_02 函數的功能是讀取並回應 Modbus 協定中的輸入狀態。這是 Modbus 功能碼 0x02 的實現。
///        首先，它從 ASCII 編碼的請求幀中提取起始地址和輸入數量，並將它們轉換為數字。
///        然後，它遍歷每個要查詢的輸入。對於每一組最多 8 個輸入，它調用 GetInputValue 函數來獲取每個輸入的狀態，並將這些狀態編碼為一個 byte（每個輸入的狀態對應一個位）。如果輸入是活動的（即 GetInputValue 返回 1），則相應的位被設置為 1。
///        接著，它將每個輸入狀態 byte 轉換為 ASCII 編碼，並將它們添加到回應幀中。
///        最後，它將回應幀的數據數量更新為新的數據數量，並將其轉換為 ASCII 編碼。
///        這個函數的結果是一個 ASCII 編碼的 Modbus 回應幀，該幀包含了請求的輸入的狀態。 
/// @param  
void ResponseReadInputStatus_02(void) // 0x02, OK!!!
{
    uint16_t start = 0, cant = 0;
    uint16_t i = 0, limit = 0;
    uint8_t inputs = 0, k = 0, new_data_count = 0;

    data_count = 7;  // data count byte reserved        
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 5];
    }    
    start = AsciiToTwoByte();
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 9];
    }
    
    cant = AsciiToTwoByte();    
    limit = start + cant;

    /* querying inputs status */
    for ( i = start; i < limit; i += 8 )
    {
        k = 0;
        inputs = 0;    
        while ( k < 8 && i + k < limit)            
        {        
            uint8_t val = GetInputValue(i + k);    // status of input i+k

            if ( val == 1 ) //input active
            {
                inputs |= (1 << k);            
            }                
            k++;
        }            
        ByteToAscii(inputs);
        ascii_frame[data_count++] = ascii[0];
        ascii_frame[data_count++] = ascii[1];
        
        new_data_count++;     // add one byte to response frame
    }
    
    ByteToAscii(new_data_count);
    ascii_frame[5] = ascii[0];
    ascii_frame[6] = ascii[1];

    gen_lrc();
    
    tx_assci_frame();
    return;
}


/// @brief ResponseReadHoldingRegisters_03 函數的功能是讀取並回應 Modbus 協定中的保持寄存器的值。這是 Modbus 功能碼 0x03 的實現。
///        首先，它從 ASCII 編碼的請求幀中提取起始地址和寄存器數量，並將它們轉換為數字。
///        然後，它遍歷每個要查詢的寄存器。對於每個寄存器，它調用 GetRegisterValue 函數來獲取寄存器的值，並將這些值編碼為兩個 byte（每個寄存器的值對應兩個位）。如果寄存器是活動的（即 GetRegisterValue 返回非零值），則相應的位被設置為該值。
///        接著，它將每個寄存器值的 byte 轉換為 ASCII 編碼，並將它們添加到回應幀中。
///        最後，它將回應幀的數據數量更新為新的數據數量，並將其轉換為 ASCII 編碼。
///        這個函數的結果是一個 ASCII 編碼的 Modbus 回應幀，該幀包含了請求的保持寄存器的值。
///        請注意，這段程式碼被切斷了，所以我們無法看到完整的 ResponseReadHoldingRegisters_03 函數。但是，我們可以假設在 while 迴圈結束後，ascii_frame 數組將包含回應幀的 ASCII 編碼。
/// @param  
void ResponseReadHoldingRegisters_03(void)  // 0x03, OK!!!
{
    uint16_t start = 0, cant = 0;
    uint16_t i = 0, limit = 0, status = 0;
    uint8_t new_data_count = 0;

    data_count = 7;  // data count byte reserved        
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 5];
    }    
    start = AsciiToTwoByte();
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 9];
    }    
    cant = AsciiToTwoByte();    
    limit = start + cant;

    /* querying holding registers status */
    for ( i = start; i < limit; i++ )
    {
        status = GetHoldingRegisterValue(i);       
        TwoByteToAscii(status);
         
        ascii_frame[data_count++] = ascii[3];
        ascii_frame[data_count++] = ascii[2];
        ascii_frame[data_count++] = ascii[1];
        ascii_frame[data_count++] = ascii[0];                          
    
        new_data_count+=2;     // add two bytes to response frame
    }
    
    ByteToAscii(new_data_count);
    ascii_frame[5] = ascii[0];
    ascii_frame[6] = ascii[1];

    gen_lrc();
    
    tx_assci_frame();
    return;
}


/// @brief ResponseReadInputRegisters_04 函數的功能是讀取並回應 Modbus 協定中的輸入寄存器的值。這是 Modbus 功能碼 0x04 的實現。
///        以下是該函數的步驟：
///        1. 初始化變數，包括起始地址（start）、寄存器數量（cant）、迴圈計數器（i）、迴圈限制（limit）、寄存器狀態（status）和新的數據數量（new_data_count）。
///        2. 將 data_count 設為 7，預留數據數量 byte 的空間。
///        3. 從 ASCII 編碼的請求幀（ascii_frame）中提取起始地址和寄存器數量，並將它們從 ASCII 轉換為二進制。
///        4. 計算迴圈的限制，即起始地址和寄存器數量的總和。
///        5. 進入迴圈，查詢從起始地址到限制範圍內的每個輸入寄存器的狀態。
///        6. 對於每個寄存器，使用 GetInputRegisterValue 函數獲取寄存器值，將值轉換為 ASCII，並將其添加到回應幀（ascii_frame）。
///        7. 每個寄存器增加新的數據數量 2，因為每個寄存器值在回應幀中佔用兩個 byte。
///        8. 迴圈結束後，將回應幀中的數據數量更新為新的數據數量，並將其轉換為 ASCII。
///        9. 使用 gen_lrc 函數為回應幀生成縱向冗餘檢查（LRC）。
///        最後，使用 tx_assci_frame 函數傳輸 ASCII 編碼的回應幀。
///        該函數的結果是一個 ASCII 編碼的 Modbus 回應幀，該幀包含了請求的輸入寄存器的值。
/// @param  
void ResponseReadInputRegisters_04(void)  // 0x04,  OK!!!!
{
    uint16_t start = 0, cant = 0;
    uint16_t i = 0, limit = 0, status = 0;
    uint8_t new_data_count = 0;
    
    data_count = 7;  // data count byte reserved       
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 5];
    }    
    start = AsciiToTwoByte();
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 9];
    }
    
    cant = AsciiToTwoByte();    
    limit = start + cant;
   
    /* querying input registers status */
    for ( i = start; i < limit; i++ )
    {
        status = GetInputRegisterValue(i);
        
        TwoByteToAscii(status);
        ascii_frame[data_count++] = ascii[3];
        ascii_frame[data_count++] = ascii[2];
        ascii_frame[data_count++] = ascii[1];
        ascii_frame[data_count++] = ascii[0];
      
        new_data_count+=2;     // add two bytes to response frame
    }
    
    ByteToAscii(new_data_count);
    ascii_frame[5] = ascii[0];
    ascii_frame[6] = ascii[1];

    gen_lrc();
    
    tx_assci_frame();
    return;
}


/// @brief ResponseForceSingleCoil_05 函數的功能是處理 Modbus 功能碼 05 的請求，該功能碼用於設定單個線圈的值。
///        以下是該函數的步驟：
///        1. 初始化 coilID 和 value 變數為 0。
///        2. 使用 for 迴圈從 ascii_frame 陣列中讀取線圈 ID。線圈 ID 在 ASCII 幀中的位置是 5 到 8。
///        3. 調用 AsciiToTwoByte 函數將讀取的 ASCII 編碼的線圈 ID 轉換為二進制，並將結果存儲在 coilID 變數中。
///        4. 使用另一個 for 迴圈從 ascii_frame 陣列中讀取線圈值。線圈值在 ASCII 幀中的位置是 9 到 12。
///        5. 再次調用 AsciiToTwoByte 函數將讀取的 ASCII 編碼的線圈值轉換為二進制，並將結果存儲在 value 變數中。
///        6. 檢查 value 變數的值是否為 0 或 65280（在 Modbus 協定中，這兩個值分別代表線圈的關閉和打開狀態）。
///        該函數的結果是根據 Modbus 請求設定單個線圈的值。請注意，提供的程式碼片段在檢查 value 變數的值後就結束了，所以我們無法看到實際設定線圈值的部分。
/// @param  
void ResponseForceSingleCoil_05(void) // 0x05, OK!!!!
{
    uint16_t coilID = 0;
    uint16_t value =  0;    
    uint16_t i = 0;            

    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 5];
    }   
    coilID = AsciiToTwoByte();     //coil index 
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 9]; 
    }    
    value = AsciiToTwoByte();       //coil value       
    if ( value == 0 || value == 65280 )     // 0 or 1, 0000h or FF00h
    {    
        SetCoilValue(coilID, value > 0);
    }
    else
    {
        clear_frame();
        return ;    
    }
    
    gen_lrc();

    tx_assci_frame();
    return;
}


/// @brief ResponsePresetSingleRegister_06 函數的功能是處理 Modbus 功能碼 06 的請求，該功能碼用於設定單個寄存器的值。
///        以下是該函數的步驟：
///        1. 初始化 registerID 和 value 變數為 0。
///        2. 使用 for 迴圈從 ascii_frame 陣列中讀取寄存器 ID。寄存器 ID 在 ASCII 幀中的位置是 5 到 8。
///        3. 調用 AsciiToTwoByte 函數將讀取的 ASCII 編碼的寄存器 ID 轉換為二進制，並將結果存儲在 registerID 變數中。
///        4. 使用另一個 for 迴圈從 ascii_frame 陣列中讀取寄存器值。寄存器值在 ASCII 幀中的位置是 9 到 12。
///        該函數的結果是根據 Modbus 請求設定單個寄存器的值。請注意，提供的程式碼片段在讀取寄存器值後就結束了，所以我們無法看到實際設定寄存器值的部分。
/// @param  
void ResponsePresetSingleRegister_06(void)  //0x06, OK!!!!
{
    uint16_t registerID = 0;
    uint16_t value =  0;    
    uint16_t i = 0;           

    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 5];
    }   
    registerID = AsciiToTwoByte();     //register index 
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 9];
    }    
    value = AsciiToTwoByte();          //register value          
    SetHoldingRegisterValue(registerID, value);
    
    gen_lrc();

    tx_assci_frame();
    return;
}


/// @brief ResponseForceMultipleCoils_15 函數的功能是處理 Modbus 功能碼 15 的請求，該功能碼用於設定多個線圈的值。
///        以下是該函數的步驟：
///        1. 初始化變數，包括線圈的起始位置 start、線圈的數量 cant、用於迴圈的變數 i、線圈的限制位置 limit、線圈的值 coils、臨時變數 k、新的數據數量 new_data_count、臨時地址 tempAdr、索引 index、偏移量 offset、參數陣列 parameters 和字節數量 byte_count。
///        2. 使用 for 迴圈從 ascii_frame 陣列中讀取線圈的起始位置，並使用 AsciiToTwoByte 函數將其轉換為二進制。
///        3. 使用另一個 for 迴圈從 ascii_frame 陣列中讀取線圈的數量，並使用 AsciiToTwoByte 函數將其轉換為二進制。
///        4. 計算線圈的限制位置，並讀取新的數據數量。
///        5. 使用 for 迴圈讀取新的線圈值，並將其存儲在 parameters 陣列中。
///        6. 使用另一個 for 迴圈設定線圈的狀態。在每次迴圈中，計算線圈的臨時地址、索引和偏移量，然後讀取線圈的值，並使用 SetCoilValue 函數設定線圈的狀態。
///        該函數的結果是根據 Modbus 請求設定多個線圈的值。
/// @param  
void ResponseForceMultipleCoils_15(void) // 0x0F, OK
{
    uint16_t start = 0, cant = 0;
    uint16_t i = 0, limit = 0;
    uint8_t coils = 0, k = 0, new_data_count = 0, tempAdr = 0;
    uint8_t index = 0, offset = 0;       
    uint16_t idata parameters[20];
    uint8_t idata byte_count;    

    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 5];
    }   
    start = AsciiToTwoByte();    
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 9];
    }    
    cant = AsciiToTwoByte();        
    limit = start + cant;
    
    new_data_count = AsciiToByte(ascii_frame[13], ascii_frame[14] );
    data_count = 15;
    
    /* read new coils values */
    byte_count = 0;    
    for ( i = 0; i < new_data_count; i++ )
    {
        coils = AsciiToByte(ascii_frame[data_count], ascii_frame[data_count+1]);
        data_count += 2;        
        parameters[byte_count++] = coils;      
    }

    /* force coils status */
    for ( i = start; i < limit; i++ )
    {        
        tempAdr = i - start;        
        index = tempAdr / 8;
        offset = tempAdr % 8;        
        k = ( parameters[index] & ( 1 << offset ) );    
        SetCoilValue(i, k > 0);    // force status of coil i with k                    
    }
    /* response frame */
    data_count = 13;

    gen_lrc();
    
    tx_assci_frame();
    return;
}


/// @brief ResponsePresetMultipleRegisters_16 函數的功能是處理 Modbus 功能碼 16 的請求，該功能碼用於設定多個保持寄存器的值。
///        以下是該函數的步驟：
///        1. 初始化變數，包括寄存器的起始位置 start、寄存器的數量 cant、用於迴圈的變數 i、寄存器的限制位置 limit、寄存器的值 reg_value、臨時變數 j、字節數量 byte_count。
///        2. 使用 for 迴圈從 ascii_frame 陣列中讀取寄存器的起始位置，並使用 AsciiToTwoByte 函數將其轉換為二進制。
///        3. 使用另一個 for 迴圈從 ascii_frame 陣列中讀取寄存器的數量，並使用 AsciiToTwoByte 函數將其轉換為二進制。
///        4. 計算寄存器的限制位置，並讀取新的數據數量。
///        該函數的結果是根據 Modbus 請求設定多個保持寄存器的值。請注意，提供的程式碼片段在讀取新的數據數量後就結束了，所以我們無法看到實際設定保持寄存器值的部分。
/// @param  
void ResponsePresetMultipleRegisters_16(void)   // 0x10, OK!!!
{
    uint16_t start = 0, cant = 0;
    uint16_t i = 0, limit = 0, reg_value = 0;
    signed char j = 0;
    uint8_t idata byte_count;          

    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 5];
    }   
    start = AsciiToTwoByte();        
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = ascii_frame[i + 9];
    }    
    cant = AsciiToTwoByte();        
    limit = start + cant;
        
    byte_count = AsciiToByte(ascii_frame[13], ascii_frame[14] );
    data_count = 15;
      
    /* read and set new holding registers values */
    byte_count /= 2;
    for ( i = 0; i < byte_count; i++ )
    {       
        for ( j = 0; j < 4; j++ )
        {     
            ascii[j] = ascii_frame[data_count++];        
        }        
        reg_value = AsciiToTwoByte();        
        holding_registers_array[start++] = reg_value;           
    }

    data_count = 13;

    gen_lrc();
    
    tx_assci_frame();
    return;
}
