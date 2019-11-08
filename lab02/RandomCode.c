#include "stdio.h"
#include "stdlib.h"

int multiplyBy8(int v)
{
	// TODO: multiply the number by 8
	v = v << 3;
	return v;
}

int setBit6to1(int v)
{
	// TODO: set bit 6 to 1
	v = v | 64;
	return v;
}

int setBit3to0(int v)
{
	// TODO: set bit 3 to 0
	v = v & ~(1<<3);
	return v;
}

int flipBit5(int v)
{
	// TODO: flip bit 5 (if it is 0, make it 1.  If 0, make 1)
	v = v ^ (1 << 5);
	return v;
}

int ifBit7is0(int v)
{
	// TODO: check to see if bit 7 is a 0 - return 1 if true, 0 if false
	v = (((unsigned)v >> 7) & 1) ^ 1;
	return v;
}

int ifBit3is1(int v)
{
	// check to see if bit 3 is a 1 - return 1 if true, 0 if false
	v = (v >> 3) & 1;
	return v;
}

int unsignedBits0through5(int v)
{
	// return the unsigned value in bits 0 through 5
	v = v & 0x3F;
	return v;
}

int unsignedBits6through9(int v)
{
	// return the unsigned value in bits 6 through 9
	v = v >> 6 & 0xF;
	return v;
}

int signedBits0through5(int v)
{
	// return the signed value in bits 0 through 5
	v = (v & 0b111111);
	if (v > 31) {
		v = v - 64;
	}
	return v;
}

int signedBits6through9(int v)
{
	// return the signed value in bits 6 through 9
	v = (v & 0b1111000000)>>6;
	if (v > 7) {
		v = v - 16;
	}
	return v;
}

int setBits4through9(int v, int setValue)
{
	// set bits 4 through 9 in v to become setValue
	setValue = (setValue & 0b111111) << 4;
	v = v & ~(0b111111 << 4);
	v = v | setValue;
	return v;
}
