//
// Created by clion1 on 09.09.17.
//

#include "factorial.hh"

uint64_t factorial(uint64_t n) {
    if (n > 0U)
        return factorial(n-1U) * n;
    return 1;
}
