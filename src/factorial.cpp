/*
 * factorial.cpp
 *
 *  Created on: Sep 9, 2017
 *      Author: eclipse1
 */

#include "factorial.h"

uint64_t factorial(uint64_t n) {
	if (n)
		return n * factorial(n-1);
	return 1;
}
