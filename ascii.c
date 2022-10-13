
#include "stdint.h"

#include "ascii.h"


uint8_t ascii[4];
uint8_t hexa[4];


/* functions code */
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

uint16_t AsciiToTwoByte(void)
{
    uint16_t a = AsciiToByte(ascii[0], ascii[1]);
    uint16_t b = AsciiToByte(ascii[2], ascii[3]);

    uint16_t result = ( a * 256 ) + b;

    return result;
}
