#include "..\stdint.h"
#include "slave.h"


/* internal slave memory data */
// 在你提供的程式碼中，coils_array 是一個全局的 uint8_t 類型陣列，用於存儲 Modbus 線圈的值。
// 在 Modbus 協議中，線圈是一種可以讀取和寫入的二進制數據，通常用於表示開關狀態。每個線圈都有一個唯一的地址，並且可以存儲一個二進制值（0 或 1）。
// 在你的程式碼中，coils_array 陣列的大小由 MAX_COILS 常數定義，這個常數定義了線圈的最大數量。
// 這個陣列可能被用於存儲從 Modbus 設備中讀取的線圈狀態，或者被用於模擬一個 Modbus 設備的內部狀態。例如，當一個 Modbus 主設備發送一個讀取線圈的命令時，你的程式碼可能會從 coils_array 陣列中讀取相應的值，並將其發送回主設備。同樣，當主設備發送一個寫入線圈的命令時，你的程式碼可能會將數據寫入 coils_array 陣列的相應位置。
uint8_t idata coils_array[MAX_COILS]; 

// 在你提供的程式碼中，inputs_array 是一個全局的 uint8_t 類型陣列，用於存儲 Modbus 輸入狀態的值。
// 在 Modbus 協議中，輸入狀態是一種只能讀取但不能寫入的二進制數據，通常用於表示設備的輸入端口狀態。每個輸入狀態都有一個唯一的地址，並且可以存儲一個二進制值（0 或 1）。
// 在你的程式碼中，inputs_array 陣列的大小由 MAX_INPUTS 常數定義，這個常數定義了輸入狀態的最大數量。
// 這個陣列可能被用於存儲從 Modbus 設備中讀取的輸入狀態，或者被用於模擬一個 Modbus 設備的內部狀態。例如，當一個 Modbus 主設備發送一個讀取輸入狀態的命令時，你的程式碼可能會從 inputs_array 陣列中讀取相應的值，並將其發送回主設備。
uint8_t idata inputs_array[MAX_INPUTS];

// 在你提供的程式碼中，holding_registers_array 是一個全局的 uint16_t 類型陣列，用於存儲 Modbus 保持寄存器的值。
// 在 Modbus 協議中，保持寄存器是一種可以讀取和寫入的寄存器，通常用於存儲從設備中讀取的數據，或者存儲需要寫入設備的數據。每個保持寄存器都有一個唯一的地址，並且可以存儲一個 16 位的數值。
// 在你的程式碼中，holding_registers_array 陣列的大小由 MAX_HOLDING_REGISTERS 常數定義，這個常數定義了保持寄存器的最大數量。
// 這個陣列可能被用於存儲從 Modbus 設備中讀取的數據，或者被用於模擬一個 Modbus 設備的內部狀態。例如，當一個 Modbus 主設備發送一個讀取保持寄存器的命令時，你的程式碼可能會從 holding_registers_array 陣列中讀取相應的值，並將其發送回主設備。同樣，當主設備發送一個寫入保持寄存器的命令時，你的程式碼可能會將數據寫入 holding_registers_array 陣列的相應位置
uint16_t idata holding_registers_array[MAX_HOLDING_REGISTERS];

// 在你提供的程式碼中，inputs_registers_array 是一個全局的 uint16_t 類型陣列，用於存儲 Modbus 輸入寄存器的值。
// 在 Modbus 協議中，輸入寄存器是一種只能讀取但不能寫入的寄存器，通常用於存儲從設備中讀取的數據。每個輸入寄存器都有一個唯一的地址，並且可以存儲一個 16 位的數值。
// 在你的程式碼中，inputs_registers_array 陣列的大小由 MAX_INPUTS_REGISTERS 常數定義，這個常數定義了輸入寄存器的最大數量。
// 這個陣列可能被用於存儲從 Modbus 設備中讀取的數據，或者被用於模擬一個 Modbus 設備的內部狀態。例如，當一個 Modbus 主設備發送一個讀取輸入寄存器的命令時，你的程式碼可能會從 inputs_registers_array 陣列中讀取相應的值，並將其發送回主設備。
uint16_t idata inputs_registers_array[MAX_INPUTS_REGISTERS];


/* functions codes */
/* coils read-write operations */
/// @brief GetCoilValue 是一個函數，它接受一個 uint16_t 類型的參數 adr，該參數表示要讀取的 Modbus 線圈的地址。
///        該函數的主要功能是從 coils_array 陣列中讀取指定地址的線圈值。線圈值是一種可以讀取和寫入的二進制數據，通常用於表示開關狀態。
///        首先，函數檢查地址 adr 是否在有效範圍內（即 0 到 MAX_COILS * 8 - 1）。如果地址不在有效範圍內，則函數返回 0。
///        然後，函數計算 adr 對應的 coils_array 陣列索引 i 和位偏移 d。這是通過將 adr 除以 8 和取模 8 來實現的，因為每個 uint8_t 可以存儲 8 個線圈值。
///        最後，函數使用位運算符 & 和位移運算符 << 從 coils_array[i] 中讀取位 d 的值，並將其返回。
///        所以，GetCoilValue 函數的主要功能是讀取指定地址的 Modbus 線圈值。
/// @param adr 
/// @return 
uint8_t GetCoilValue(uint16_t adr)
{
    uint8_t res = 0, i = 0, d = 0;

    if (adr < 0 || adr >= MAX_COILS * 8)
    {
        return 0;
    }
    i = adr / 8;
    d = adr % 8;
    res = (coils_array[i] & (1 << d));
    return res > 0;
}


/// @brief SetCoilValue 是一個函數，它接受兩個參數：一個 uint16_t 類型的 adr，表示要寫入的 Modbus 線圈的地址，和一個 uint8_t 類型的 value，表示要寫入的值。
///        該函數的主要功能是將值寫入 coils_array 陣列的指定地址。線圈值是一種可以讀取和寫入的二進制數據，通常用於表示開關狀態。
///        首先，函數檢查地址 adr 是否在有效範圍內（即 0 到 MAX_COILS * 8 - 1）。如果地址不在有效範圍內，則函數直接返回，不進行任何操作。
///        然後，函數計算 adr 對應的 coils_array 陣列索引 i 和位偏移 d。這是通過將 adr 除以 8 和取模 8 來實現的，因為每個 uint8_t 可以存儲 8 個線圈值。
///        最後，函數使用位運算符 &、| 和位移運算符 << 將值 value 寫入 coils_array[i] 的位 d。
///        所以，SetCoilValue 函數的主要功能是寫入指定地址的 Modbus 線圈值。但是，你提供的程式碼片段在寫入值之前被截斷了，所以我無法提供完整的寫入操作的詳細說明。
/// @param adr 
/// @param value 
void SetCoilValue(uint16_t adr, uint8_t value)
{
    uint8_t res = 0, i = 0, d = 0;

    if (adr < 0 || adr >= MAX_COILS * 8)
    {
        return;
    }
    i = adr / 8;
    d = adr % 8;
    res = (coils_array[i] & (1 << d));
    if (res > 0)
    {
        res = 1; // coil on
    }
    else
    {
        res = 0; // coil off
    }
    if (res == 1 && value == 1)
    {
        return; // already ON
    }
    if (res == 0 && value == 0)
    {
        return; // already OFF
    }
    if (res == 0 && value == 1) // is off turn on
    {
        coils_array[i] = (coils_array[i] | (1 << d)); // active coil
    }
    if (res == 1 && value == 0) // is on turn off
    {
        coils_array[i] = (coils_array[i] & (~(1 << d))); // desactive coil
    }
    return;
}


/* holding registers read-write operations */
/// @brief GetHoldingRegisterValue 是一個函數，其功能是讀取 Modbus 保持寄存器的值。 
///       以下是該函數的步驟：
///       1. 檢查輸入的地址 adr 是否有效。如果地址小於 0 或者大於或等於 MAX_HOLDING_REGISTERS（這是一個定義了保持寄存器數量上限的常數），則返回 0，表示無效的寄存器地址。 
/// @brief 
/// @param adr 
/// @return 
uint16_t GetHoldingRegisterValue(uint16_t adr)
{
    if (adr < 0 || adr >= MAX_HOLDING_REGISTERS)
    {
        return 0; // invalid register address
    }
    else
    {
        return holding_registers_array[adr];
    }
}


/// @brief GetHoldingRegisterValue 是一個函數，它接受一個 uint16_t 類型的參數 adr，該參數表示要讀取的 Modbus 保持寄存器的地址。
///        該函數的主要功能是從 holding_registers_array 陣列中讀取指定地址的保持寄存器值。保持寄存器是 Modbus 協議中的一種數據類型，可以讀取和寫入，通常用於存儲設備的運行參數或狀態。
///        首先，函數檢查地址 adr 是否在有效範圍內（即 0 到 MAX_HOLDING_REGISTERS - 1）。如果地址不在有效範圍內，則函數返回 0。
///        然後，如果地址有效，函數從 holding_registers_array[adr] 讀取並返回保持寄存器的值。
///        所以，GetHoldingRegisterValue 函數的主要功能是讀取指定地址的 Modbus 保持寄存器值。
/// @param adr 
/// @param value 
void SetHoldingRegisterValue(uint16_t adr, uint16_t value)
{
    if (adr < 0 || adr >= MAX_HOLDING_REGISTERS || value < 0 || value > 65535)
    {
        return; // invalid register address
    }
    else
    {
        holding_registers_array[adr] = value;
    }
}


/* inputs read-only operations */
/// @brief GetInputValue 是一個函數，它接受一個 uint16_t 類型的參數 adr，該參數表示要讀取的 Modbus 輸入狀態的地址。
///        該函數的主要功能是從 inputs_array 陣列中讀取指定地址的輸入狀態值。輸入狀態是 Modbus 協議中的一種數據類型，只能讀取不能寫入，通常用於表示設備的輸入端口狀態。
///        首先，函數檢查地址 adr 是否在有效範圍內（即 0 到 MAX_INPUTS * 8 - 1）。如果地址不在有效範圍內，則函數返回 0。
///        然後，如果地址有效，函數計算 adr 對應的 inputs_array 陣列索引 i 和位偏移 d。這是通過將 adr 除以 8 和取模 8 來實現的，因為每個 uint8_t 可以存儲 8 個輸入狀態值。
///        最後，函數使用位運算符 & 和位移運算符 << 從 inputs_array[i] 中讀取位 d 的值，並將其返回。
///        所以，GetInputValue 函數的主要功能是讀取指定地址的 Modbus 輸入狀態值。但是，你提供的程式碼片段在讀取值之前被截斷了，所以我無法提供完整的讀取操作的詳細說明。
/// @param adr 
/// @return 
uint8_t GetInputValue(uint16_t adr)
{
    uint8_t res = 0, i = 0, d = 0;

    if (adr < 0 || adr >= MAX_INPUTS * 8)
    {
        return 0;
    }
    i = adr / 8;
    d = adr % 8;
    res = (inputs_array[i] & (1 << d));
    return res > 0;
}


/// @brief GetInputRegisterValue 是一個函數，其功能是讀取 Modbus 輸入寄存器的值。
///        以下是該函數的步驟：
///        1. 檢查輸入的地址 adr 是否有效。如果地址小於 0 或者大於或等於 MAX_INPUTS_REGISTERS（這是一個定義了輸入寄存器數量上限的常數），則返回 0，表示無效的寄存器地址。
///        2. 如果地址有效，則從 inputs_registers_array 陣列中讀取並返回該地址的值。
///        這個函數的結果是返回 Modbus 輸入寄存器的值。請注意，提供的程式碼片段並沒有顯示 inputs_registers_array 陣列的定義和初始化，所以我們無法確定該陣列的具體內容。
/// @param adr 
/// @return 
uint16_t GetInputRegisterValue(uint16_t adr)
{
    if (adr < 0 || adr >= MAX_INPUTS_REGISTERS)
    {
        return 0; // invalid register address
    }
    else
    {
        return inputs_registers_array[adr];
    }
}
