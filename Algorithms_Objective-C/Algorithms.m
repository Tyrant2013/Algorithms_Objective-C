//
//  Algorithms.m
//  Algorithms_Objective-C
//
//  Created by 庄晓伟 on 15/7/27.
//  Copyright (c) 2015年 庄晓伟. All rights reserved.
//

#import "Algorithms.h"

@implementation Algorithms

- (NSArray *)insertionSort:(NSMutableArray *)willSortArray {
    NSLog(@"#####################  InsertionSort Begin  #####################");
    NSInteger willSortArrayLength = willSortArray.count;
    for (NSInteger indexOfWillSortArray = 2; indexOfWillSortArray < willSortArrayLength; ++indexOfWillSortArray) {
        NSInteger valueOnIndex = [willSortArray[indexOfWillSortArray] integerValue];
        NSInteger indexOfSorted = indexOfWillSortArray - 1;
        NSLog(@"indexOfWillSortArray begin at: %ld, key value is: %ld", indexOfWillSortArray, valueOnIndex);
        while (indexOfSorted >= 0
               && [willSortArray[indexOfSorted] integerValue] > valueOnIndex) {
            NSLog(@"sorting indexOfSorting begin at: %ld, value is: %ld", indexOfSorted, [willSortArray[indexOfSorted] integerValue]);
            willSortArray[indexOfSorted + 1] = willSortArray[indexOfSorted];
            --indexOfSorted;
        }
        willSortArray[indexOfSorted + 1] = @(valueOnIndex);
        NSLog(@"sorted array: %@", [willSortArray componentsJoinedByString:@","]);
    }
    NSLog(@"#####################  InsertionSort End    #####################");
    return willSortArray;
}

@end
