#include "..\stdint.h"
#include "slave.h"


/* internal slave memory data */
uint8_t idata coils_array[MAX_COILS]; 
uint8_t idata inputs_array[MAX_INPUTS];
uint16_t idata holding_registers_array[MAX_HOLDING_REGISTERS];
uint16_t idata inputs_registers_array[MAX_INPUTS_REGISTERS];


/* functions codes */
/* coils read-write operations */
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
