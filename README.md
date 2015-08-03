# Algorithms_Objective-C
 
算法导论里的算法实现（Objective-C版）
 
1.  插入排序，书里面遇到的第一个排序（为什么不是冒泡排序）

...将未排序的数据插入到已排序的队列中

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
 
2.   归并排序（还有一点错误，果然算法没那么简单啊）
   还有错误，修改完后再写在README.md里   
试试Markdown语法，看看有没有错，边学习，边改动
