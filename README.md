# Algorithms_Objective-C

算法导论里的算法实现（Objective-C版）

1.  插入排序，书里面遇到的第一个排序（为什么不是冒泡排序）

   将未排序的数据插入到已排序的队列中

    	- (NSArray *)insertionSort:(NSMutableArray *)willSortArray {
	    	NSInteger willSortArrayLength = willSortArray.count;
    		for (NSInteger indexOfWillSortArray = 2; indexOfWillSortArray < willSortArrayLength; ++indexOfWillSortArray) {
        		NSInteger valueOnIndex = [willSortArray[indexOfWillSortArray] integerValue];
        		NSInteger indexOfSorted = indexOfWillSortArray - 1;
        		while (indexOfSorted >= 0
               		&& [willSortArray[indexOfSorted] integerValue] > valueOnIndex) {
            		NSLog(@"sorting indexOfSorting begin at: %ld, value is: %ld", indexOfSorted, [willSortArray[indexOfSorted] integerValue]);
            		willSortArray[indexOfSorted + 1] = willSortArray[indexOfSorted];
            		--indexOfSorted;
        		}
        		willSortArray[indexOfSorted + 1] = @(valueOnIndex);
    		}
        	return willSortArray;
	    }

2.  归并排序

    	- (NSArray *)mergeSort:(NSMutableArray *)willSortArray beginIndex:(NSInteger)begin endIndex:(NSInteger)end {
            if (begin < end) {
                NSInteger middle = (begin + end) / 2;
            	[self mergeSort:willSortArray beginIndex:begin endIndex:middle];
            	[self mergeSort:willSortArray beginIndex:middle + 1 endIndex:end];
            	[self merge:willSortArray beginIndex:begin middleIndex:middle endIndex:end];
        	}
        	return willSortArray;
    	}

    	- (NSArray *)merge:(NSMutableArray *)willSortArray beginIndex:(NSInteger)begin middleIndex:(NSInteger)middle endIndex:(NSInteger)end {
            NSMutableArray *leftArray = [NSMutableArray array];
            NSMutableArray *rightArray = [NSMutableArray array];
            for (NSInteger index = begin; index <= middle; ++index) {
            	[leftArray addObject:willSortArray[index]];
            }
            for (NSInteger index = middle + 1; index <= end; ++index) {
                [rightArray addObject:willSortArray[index]];
            }
            NSInteger leftIndex = 0;
            NSInteger rightIndex = 0;
            for (NSInteger index = begin; index <= end; ++index) {
                if (leftIndex < leftArray.count && rightIndex < rightArray.count) {
                    NSInteger left = [leftArray[leftIndex] integerValue];
                    NSInteger right = [rightArray[rightIndex] integerValue];
                    if (left < right) {
                        willSortArray[index] = @(left);
                        ++leftIndex;
                    }
                    else {
                        willSortArray[index] = @(right);
                        ++rightIndex;
                    }
                }
                else {
                    if (leftIndex >= leftArray.count && rightIndex < rightArray.count) {
                        willSortArray[index] = rightArray[rightIndex];
                        ++rightIndex;
                    }
                    else if (leftIndex < leftArray.count && rightIndex >= rightArray.count) {
                        willSortArray[index] = leftArray[leftIndex];
                        ++leftIndex;
                    }
                }
            }
            return willSortArray;
    	}

3.   查找最大子数（结果来说是对的，但中间过程怎么感觉怪怪的,晚上回去再看看）

            - (NSArray *)findMaximumSubarray:(NSArray *)array low:(NSInteger)low high:(NSInteger)high {
              if (high == low) {
                return @[@(low), @(high), array[low]];
              }
              else {
                NSInteger mid = (low + high) / 2;
                NSArray *left = [self findMaximumSubarray:array low:low high:mid];
                NSArray *right = [self findMaximumSubarray:array low:mid + 1 high:high];
                NSArray *cross = [self findMaxCrossSubarray:array low:low mid:mid high:high];
                NSInteger leftSum = [left[2] integerValue];
                NSInteger rightSum = [right[2] integerValue];
                NSInteger crossSum = [cross[2] integerValue];
                if (leftSum >= rightSum && leftSum >= crossSum) {
                  return left;
                }
                else if (rightSum >= leftSum && rightSum >= crossSum) {
                  return right;
                }
                else {
                  return cross;
                }
              }
            }

            - (NSArray *)findMaxCrossSubarray:(NSArray *)array low:(NSInteger)low mid:(NSInteger)mid high:(NSInteger)high {
              NSInteger leftIndex = 0;
              NSInteger leftSum = 0;
              NSInteger sum = 0;
              for (NSInteger index = mid; index >= low ; --index) {
                sum += [array[index] integerValue];
                if (index == mid) {
                  leftSum = sum;
                  leftIndex = index;
                }
                else if (sum > leftSum) {
                  leftSum = sum;
                  leftIndex = index;
                }
              }
              NSInteger rightIndex = 0;
              NSInteger rightSum = 0;
              sum = 0;
              for (NSInteger index = mid + 1; index < high; ++index) {
                sum += [array[index] integerValue];
                if (index == mid + 1) {
                  rightSum = sum;
                  rightIndex = index;
                }
                else if (sum > rightSum) {
                  rightSum = sum;
                  rightIndex = index;
                }
              }
              return @[@(leftIndex), @(rightIndex), @(leftSum + rightSum)];
            }
