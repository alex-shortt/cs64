#include "DecodeCode.h"

int getBitsAt(int value, int beg, int end) {
								int target = value >> beg;
								int diff = end - beg + 1;
								int mask = (1 << diff) - 1;
								return target & mask;
}

int getSignedBitsAt(int value, int beg, int end) {
								int result = getBitsAt(value, beg, end);

								int diff = beg - end + 1;
								int maxVal = (1 << (diff - 2)) - 1;
								if(result >= maxVal) {
																int mask = (maxVal << 1) - 1;
																result = (result - maxVal + 1);
																result *= -1;
								}

								return result;
}

mipsinstruction decode(int value)
{
								mipsinstruction instr;

								instr.funct = getBitsAt(value, 0, 5);
								instr.immediate = getSignedBitsAt(value, 0, 15);
								instr.rd = getBitsAt(value, 11, 15);
								instr.rt = getBitsAt(value, 16, 20);
								instr.rs = getBitsAt(value, 21, 25);
								instr.opcode = getBitsAt(value, 26, 31);

								return instr;
}
