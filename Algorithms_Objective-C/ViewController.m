//
//  ViewController.m
//  Algorithms_Objective-C
//
//  Created by 庄晓伟 on 15/7/27.
//  Copyright (c) 2015年 庄晓伟. All rights reserved.
//

#import "ViewController.h"
#import "Algorithms.h"

@interface ViewController ()

@property (nonatomic, strong) Algorithms *algorithms;

@property (nonatomic, copy) NSMutableArray *willSortedArray;
@property (nonatomic, copy) NSArray *sortedArray;

@property (nonatomic, copy) NSMutableArray *numbers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.willSortedArray addObjectsFromArray:@[@45, @34, @2, @90, @12, @56, @1, @8, @67, @89, @(77)]];
    NSLog(@"WillSortedArray: %@", [self.willSortedArray componentsJoinedByString:@","]);
//    self.sortedArray = [self.algorithms insertionSort:self.willSortedArray];
//    self.sortedArray = [self.algorithms mergeSort:self.willSortedArray beginIndex:0 endIndex:self.willSortedArray.count - 1];
    [self.numbers addObjectsFromArray:@[@1, @9, @-10, @12, @-4, @4, @20, @-18]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    NSLog(@"InsertionSort: %@", [self.sortedArray componentsJoinedByString:@","]);
//    NSLog(@"MergeSort: %@", [self.sortedArray componentsJoinedByString:@","]);
    NSLog(@"Find Max: %@", [[self.algorithms findMaximumSubarray:self.numbers low:0 high:self.numbers.count - 1] componentsJoinedByString:@","]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Algorithms *)algorithms {
    if (_algorithms == nil) {
        _algorithms = [Algorithms new];
    }
    return _algorithms;
}

- (NSMutableArray *)willSortedArray {
    if (_willSortedArray == nil) {
        _willSortedArray = [NSMutableArray array];
    }
    return _willSortedArray;
}

- (NSMutableArray *)numbers {
    if (_numbers == nil) {
        _numbers = [NSMutableArray array];
    }
    return _numbers;
}

@end
