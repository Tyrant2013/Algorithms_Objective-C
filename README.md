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

