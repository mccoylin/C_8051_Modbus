
#include "stdint.h"

#include "ascii.h"


uint8_t ascii[4];
uint8_t hexa[4];


/* functions code */

/// @brief ByteToAscii 函數的功能是將一個 byte 值轉換為兩個 ASCII 字元。
///        這通常是通過將 byte 值分成兩個 nibbles（每個 nibble 是 4 位），然後將每個 nibble 轉換為其對應的 ASCII 字元。
/// @param val 需要轉換的 byte 值
///        ascii[] 放進轉換後的 ASCII 字元
void ByteToAscii(uint8_t val)
{
    uint8_t a = val / 16;
    uint8_t b = val % 16;   
    
    if ( a <= 9 )        
    {
        ascii[0] = a + '0';
    }
    else
    {
        ascii[0]= (a - 10) + 'A';    
    }
    
    if ( b <= 9 )        
    {
        ascii[1] = b + '0';
    }
    else
    {
        ascii[1]= (b - 10) + 'A';    
    }
    return ;
}


/// @brief NibbleToAscii 函數的功能是將一個 nibble（4位二進制數）轉換為一個 ASCII 字元。
///        這通常是通過檢查 nibble 的值，並將其轉換為對應的 ASCII 字元。
/// @param val 需要轉換的 nibble 值
/// @return 轉換後的 ASCII 字元
uint8_t NibbleToAscii(uint8_t val)
{     
    if ( val <= 9 )        
    {
        return val + '0';
    }
    else
    {
        return (val - 10) + 'A';    
    }        
}


/// @brief AsciiToByte 函數的功能是將兩個 ASCII 字元（由參數 a 和 b 表示）轉換為一個 byte 值。 
/// @param a 第一個 ASCII 字元
/// @param b 第二個 ASCII 字元
/// @return 計算得到的 byte 值。 
uint8_t AsciiToByte(uint8_t a, uint8_t b)
{
    if ( a >= 65 )        
    {
        a = a - 'A' + 10;
    }
    else
    {
        a = a - '0';    
    }
    
    if ( b >= 65 )        
    {
        b = b - 'A' + 10;
    }
    else
    {
        b = b - '0';    
    }
        
    return (16 * a) + b;
}


/// @brief TwoByteToAscii 函數的功能是將一個 16 位的數（由參數 val 表示）轉換為四個 ASCII 字元。
/// @param val 傳入的 16 位數
///        hexa[] 傳入的 16 位數轉換為 4 個 4 位數
void TwoByteToAscii(uint16_t val)
{
    int i = 0;

    for ( i = 0; i < 4; i++ )
    {
        hexa[i] = 0;
    }
    
    i = 0;
    while ( val > 0)
    {
        hexa[i] = val % 16;
        val /= 16;    
        i++; 
    }        
    
    for ( i = 0; i < 4; i++ )
    {
        ascii[i] = NibbleToAscii(hexa[i]);
    }
    
    return ;
}


/// @brief AsciiToTwoByte 函數的功能是將四個 ASCII 字元（存儲在全局變量 ascii 的前四個元素中）轉換為一個 16 位的數。
/// @param  
/// @return 計算得到的 16 位的數。 
uint16_t AsciiToTwoByte(void)
{
    uint16_t a = AsciiToByte(ascii[0], ascii[1]);
    uint16_t b = AsciiToByte(ascii[2], ascii[3]);

    uint16_t result = ( a * 256 ) + b;

    return result;
}
