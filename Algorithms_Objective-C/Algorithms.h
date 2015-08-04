//
//  Algorithms.h
//  Algorithms_Objective-C
//
//  Created by 庄晓伟 on 15/7/27.
//  Copyright (c) 2015年 庄晓伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Algorithms : NSObject

#pragma mark - 增量方法
/// 插入排序
- (NSArray *)insertionSort:(NSArray *)willSortArray;
/// 归并排序
- (NSArray *)mergeSort:(NSMutableArray *)willSortArray beginIndex:(NSInteger)begin endIndex:(NSInteger)end;


/// 查找最大子数组
- (NSArray *)findMaximumSubarray:(NSArray *)array low:(NSInteger)low high:(NSInteger)high;
@end
