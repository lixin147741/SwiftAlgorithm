//
//  main.c
//  Range Sum Query
//
//  Created by 李鑫 on 17/1/9.
//  Copyright © 2017年 Kee. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

struct NumArray {
    int *num;
};

/** Initialize your data structure here. */
struct NumArray* NumArrayCreate(int* nums, int numsSize) {
    
    struct NumArray *array;
    int i;
    
    array = (struct NumArray*)calloc(1, sizeof(struct NumArray));
    array->num = (int *)calloc(numsSize, sizeof(int));
    for(i = 0; i < numsSize; i++){
        array->num[i] = nums[i];
    }
    return array;
    
}

int sumRange(struct NumArray* numArray, int i, int j) {
    int a = 0;
    while (i<=j) {
         a += numArray->num[i++];
    }
    return  a;
}

/** Deallocates memory previously allocated for the data structure. */
void NumArrayFree(struct NumArray* numArray) {
    free(numArray->num);
    free(numArray);
}

int main() {
    int a[6];
    a[0] = -2;
    a[1] = 0;
    a[2] = 3;
    a[3] = -5;
    a[4] = 2;
    a[5] = -1;
    struct NumArray* numArray = NumArrayCreate(a, 6);
    int c = sumRange(numArray, 0, 2);
    printf("%d", c);
    NumArrayFree(numArray);
}
