#include <stdio.h>
#include "..\stdint.h"

#include "REG_MPC82G516.h"

#include "main.h"
#include "modbus.h"
#include "slave.h"
#include "..\Delay.H"


#define MMOD 1009

int level = 0;
int cant = 1;
int led_count = 0;
int sec_count = 0;

int last_data_count = 0;
int last_hash       = 0;

// _7seg 是一個陣列，用於存儲七段顯示器的數字編碼。七段顯示器是一種常見的數字顯示器，由七個燈段組成，每個燈段可以獨立控制。通過控制這七個燈段的亮滅，可以顯示 0 到 9 的數字。
// 在這個陣列中，每個元素都是一個 8 位的數字，代表一個七段顯示器的數字編碼。例如，0x7E 是數字 0 的編碼，0x42 是數字 1 的編碼，依此類推。
// 所以，_7seg 陣列的主要功能是提供七段顯示器的數字編碼，用於在七段顯示器上顯示數字。
uint8_t idata _7seg[10] = {0x7E,0x42,0xEC,0xE6,0xD2,0xB6,0x9E,0x62,0xFE,0xF2};

sbit LED1 = P1^3;
sbit EN_D = P3^7;
sbit ONE  = P2^0;
uint8_t BUSY = 0;


/// @brief Serial_PWM_Init 是一個初始化函數，用於設置和啟動串行通信和 PWM（Pulse Width Modulation，脈寬調製）。
///        以下是該函數的主要步驟和功能：
///        1. RS485En = 0;：禁用 RS485 通信。RS485 是一種常用的差分信號串行通信協議。
///        2. TMOD = 0x21;：設置定時器模式。在這裡，定時器 0 設置為模式 1（16 位定時器/計數器），定時器 1 設置為模式 2（8 位自動重載定時器/計數器）。
///        3. TH1 和 TL1 設置定時器 1 的初始值，用於設置串行通信的波特率為 2400。
///        4. TH0 和 TL0 設置定時器 0 的初始值，用於設置 PWM 的周期為 2 ms。
///        5. SetHoldingRegisterValue(1, 1); 和 level = 5;：設置 Modbus 保持寄存器的值，並將亮度等級設置為 5。
///        6. ET0 = 1; 和 TR0 = 1;：啟用並啟動定時器 0 的中斷。
///        7. SCON = 0x50;：設置串行通信模式為模式 1（10 位 UART，包括 1 個起始位、8 個數據位和 1 個停止位）。
///        8. ES = 1;、PS = 1; 和 PT1 = 1;：啟用串行通信中斷，設置串行通信中斷為高優先級，並設置定時器 1 為高優先級。
///        9. TR1 = 1;：啟動定時器 1。
///        所以，Serial_PWM_Init 函數的主要功能是初始化和啟動串行通信和 PWM。
/// @param  
void Serial_PWM_Init(void)
{ 
    RS485En = 0;

    TMOD = 0x21;    // 

    TH1 = TIMER_HIGHT_1;
    TL1 = TIMER_LOW_1;  //2400 BAUDS

    TH0 = TIMER_HIGHT_0;  // 2 ms
    TL0 = TIMER_LOW_0;

    SetHoldingRegisterValue(1, 1);  // level 5 full bright
    level = 5;
   
    ET0 = 1;
    TR0 = 1;

    SCON = 0x50;    //mode 1 8 bits 1 start, 8 data, 1 stop 
    
    ES = 1;
    PS = 1;
    PT1 = 1;

    TR1 = 1; 
}


/// @brief make_hash 是一個函數，它不接受任何參數，但在函數內部使用了全局變量 data_count 和 ascii_frame。
///        該函數的主要功能是對 ascii_frame 陣列中的數據進行哈希處理，並返回一個哈希值。
///        首先，函數初始化一個名為 h 的變量為 0，該變量用於存儲計算出的哈希值。
///        然後，函數使用一個 for 迴圈遍歷 ascii_frame 陣列中的每個元素。對於每個元素，函數將其值乘以其索引加 1，然後將結果加到 h 上。
///        最後，函數將 h 乘以 19，然後對 MMOD 取模，並將結果返回。
///        所以，make_hash 函數的主要功能是對 ascii_frame 陣列中的數據進行哈希處理，並返回一個哈希值。這種哈希函數通常用於數據結構（如哈希表）中，以快速查找或存儲數據。 
/// @param  
/// @return 
int make_hash(void) 
{
    int i, h = 0;

    for ( i = 0; i < data_count; i++ ) 
    {
        h += (char)ascii_frame[i] * ( i + 1 );
    }
    return ( 19 * h ) % MMOD;
}


/// @brief PWM 是一個中斷服務程序，它被設置為在定時器 0 的中斷時被調用。該函數的主要功能是控制一個名為 EN_D 的數位輸出（可能是一個 LED 或其他類型的數位設備）的 PWM（Pulse Width Modulation，脈寬調製）信號。
///        以下是該函數的主要步驟和功能：
///        1. int off = GetCoilValue(0);：讀取 Modbus 線圈值。
///        2. TH0 = TIMER_HIGHT_0; 和 TL0 = TIMER_LOW_0;：設置定時器 0 的值，以控制 PWM 信號的頻率。
///        3. if ( cant <= 0 )：如果 cant（可能是控制 PWM 信號占空比的變量）小於或等於 0，則關閉 EN_D。
///        4. else { EN_D = !(DISPLAY_ON ^ off); }：否則，將 EN_D 設置為 DISPLAY_ON 和 off 的異或結果的否定。
///        5. if ( cant >= level ) { cant = level - 5; }：如果 cant 大於或等於 level（可能是 PWM 信號的最大占空比），則將 cant 設置為 level - 5。
///        6. cant++;：增加 cant 的值。
///        7. led_count++; 和 if (led_count == 500) { ... }：增加 led_count 的值，並在 led_count 達到 500 時（即每秒），切換 LED1 的狀態，並重置 led_count。
///        所以，PWM 函數的主要功能是控制 EN_D 的 PWM 信號。該函數在定時器 0 的中斷時被調用，並根據 cant 和 level 的值調整 PWM 信號的占空比，以控制 EN_D 的亮度或功率。
/// @param  
/// @return 
void PWM(void) interrupt 1
{
    int curr = 0;
    int off = GetCoilValue(0);
    
    TH0 = TIMER_HIGHT_0;  
    TL0 = TIMER_LOW_0;
    
    if ( cant <= 0 )
    {
        EN_D = DISPLAY_OFF;
    }
    else
    {         
        EN_D = !(DISPLAY_ON ^ off);
    }           
    
    if ( cant >= level )
    {     
        cant = level - 5;
    }
    
    cant++;

    led_count++;
    if (led_count == 500)   // 1 second
    {
        led_count = 0;
        LED1 = ~LED1;         
        
      /*  curr = make_hash();
    
        if ( last_hash == curr )
        {
            clear_frame();
            last_hash = curr = 0;        
        }
        last_hash = curr;        */        
    }

    TF0 = 0;   
    TR0 = 1;
}


/// @brief SerialPortInt 是一個中斷服務程序，它被設置為在串行通信中斷時被調用。該函數的主要功能是處理串行通信的傳輸和接收。
///        以下是該函數的主要步驟和功能：
///        1. if ( RS485En == 0 && BUSY == 1 )：如果 RS485 通信被禁用且 BUSY 標誌為 1，則進入接收模式。
///        2. rx = SBUF;：讀取接收到的數據並存儲在 rx 變量中。
///        3. RI = 0;：清除接收中斷標誌，以準備接收下一個字節的數據。
///        4. if (rx == 0) { return; }：如果接收到的數據為 0，則丟棄該數據並返回。
///        5. if ( data_count == 0 )：如果 data_count 為 0，則表示正在接收一個新的數據框。
///        6. if ( rx == ':' )：如果接收到的數據為 ':'，則表示這是一個新的數據框的開始。
///        7. ascii_frame[data_count++] = rx;：將接收到的數據存儲在 ascii_frame 陣列中，並將 data_count 遞增 1。
///        8. else { ascii_frame[data_count++] = rx; }：如果 data_count 不為 0，則表示正在接收一個已經開始的數據框，將接收到的數據存儲在 ascii_frame 陣列中，並將 data_count 遞增 1。
///        9. if ( data_count >= 9 )：如果 data_count 大於或等於 9，則表示已經接收到一個完整的數據框。這裡的程式碼被截斷了，所以我無法提供完整的功能說明。但是，通常在這種情況下，函數會處理接收到的數據框（例如，解析命令、更新狀態等）。
///        所以，這段程式碼的主要功能是處理串行通信的接收。當接收到一個字節的數據時，它會將數據存儲在 ascii_frame 陣列中，並根據數據的內容來處理數據框的開始和結束。
/// @param  
void SerialPortInt(void) interrupt 4
{
    uint8_t rx = 0;

    if( TI == 1 )           // 如果傳輸中斷標誌 TI 為 1，表示已經完成了一個字節的傳輸。
    {       
        TI = 0;         // 清除傳輸中斷標誌，以準備傳輸下一個字節的數據。
        if ( RS485En == 0 )         // 如果 RS485 通信被禁用，則返回，不進行傳輸。
        {            
            return;
        }
            
        if ( send_count < data_count )          // 如果已經傳輸的字節數 send_count 小於要傳輸的總字節數 data_count，則繼續傳輸。
        {                       
            TB8 = 0;                    
            SBUF = ascii_frame[send_count];       //從 ascii_frame 陣列中讀取下一個要傳輸的字節，並將其放入串行緩衝暫存器 SBUF 中
            send_count++;
        }
        else
        {                      
            RS485En = 0;    //rx            // 如果已經傳輸完所有的字節，則禁用 RS485 通信，並清除數據框。
            clear_frame();
        }

    }
    else if( RI == 1 )
    {
        // 如果 RS485 通信被禁用且 BUSY 標誌為 1，則進入接收模式。
        if ( RS485En == 0 && BUSY == 1 )	// rx and not busy
        {           
            rx = SBUF;             
            RI = 0;
            if (rx == 0)
            {
                return; // discard bad characters
            }

            if ( data_count == 0 )
            {             
                if ( rx == ':' )    // new frame
                {                                  
                    ascii_frame[data_count++] = rx;    
                }            
            }
            else  
            {
                ascii_frame[data_count++] = rx;     

                if ( data_count >= 9 )
                {                    
                    if ( (ascii_frame[data_count-1] == LF) && (ascii_frame[data_count-2] == CR) )
                    {                            
                        BUSY = 0;   // device busy = true

                        execute_modbus_command();
                    
                        BUSY = 1;   // device busy = false
                    }
                }                      

                if ( data_count == ASCII_FRAME_SIZE )   // bad frame size
                {                
                    clear_frame();             
                }                                                       
            }
        }
        else
        {
            RI = 0;
        }
    }
}


/* holding registers read-write operations */
/// @brief update_display 是一個函數，其主要功能是更新顯示器的顯示內容。它首先從 Modbus 持有寄存器中讀取兩個值：x（數字）和 L（亮度）。
///        以下是該函數的主要步驟和功能：
///        1. int x = (int)GetHoldingRegisterValue(0);：從 Modbus 持有寄存器中讀取數字。
///        2. int L = (int)GetHoldingRegisterValue(1);：從 Modbus 持有寄存器中讀取亮度。
///        3. if ( x >= 0 && x <= 9 )：如果數字在 0 到 9 之間，則在七段顯示器上顯示該數字，並關閉 1 號顯示器。
///        4. else if ( x < 20 )：如果數字小於 20，則在七段顯示器上顯示該數字的個位數，並開啟 1 號顯示器。
///        5. if ( L >= 0 && L <= 5 )：如果亮度在 0 到 5 之間，則將 level 設置為該亮度。
///        所以，update_display 函數的主要功能是根據 Modbus 持有寄存器中的數字和亮度值來更新顯示器的顯示內容。
/// @param  
void update_display(void)
{    
    int x = (int)GetHoldingRegisterValue(0); // number             
    int L = (int)GetHoldingRegisterValue(1); // bright

    if ( x >= 0 && x <= 9 )
    {       
        P2 = _7seg[x]; 
        ONE = 0;    //off 1
    }      
    else
    {
        if ( x < 20 )
        {            
            x = x % 10;
            P2 = _7seg[x]; 
            ONE = 1;                    
        }   
    }
  
    if ( L >= 0 && L <= 5 )
    {
        level = L;
    }
}


void main(void)
{        
    Serial_PWM_Init(); 
    
    SetCoilValue(0,1);        
    SetHoldingRegisterValue(0,1);      

    EN_D = DISPLAY_OFF;
    LED1 = 1;
    RS485En = 0;
    BUSY = 1;

    clear_frame();

    EA = 1;    
   
    while (1)
    {                     
        update_display();
        delay_ms(1000);
    }    
}


//void delay_ms(unsigned int d)
//{
//    int k = 0;
//    int s = 0;
//
//    for ( k = 0; k < d; k++ )
//    {     
//        s++;
//    }
//}