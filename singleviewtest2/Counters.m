//
//  Counters.m
//  singleviewtest2
//
//  Created by Ustun Ozgur on 4/5/15.
//  Copyright (c) 2015 Ustun Ozgur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Counters.h"

@implementation Counters


- (BOOL)validCounterValues:(int)value1 and:(int)value2 {
    return value1 >= 0 && value2 >= 0;
}

- (void)setCounterValues:(int)value1 and:(int)value2 {
    self.counter1 = @(value1);
    self.counter2 = @(value2);
}

- (void)increment {
    
    int nextCounter1Value = [self.counter1 intValue] + 1;
    int nextCounter2Value = [self.counter2 intValue] - 1;
    
    [self validateAndSetCounterValues:nextCounter1Value and:nextCounter2Value];
    
}

- (void)decrement {
    int nextCounter1Value = [self.counter1 intValue] - 1;
    int nextCounter2Value = [self.counter2 intValue] + 1;
    
    [self validateAndSetCounterValues:nextCounter1Value and:nextCounter2Value];
    
}

- (BOOL)canIncrement {
    return [self.counter2 intValue ] > 0;
}

- (BOOL)canDecrement {
    return [self.counter1 intValue ] > 0;
}


- (instancetype)init {
    self = [super init];
    self.counter1 = @(0);
    self.counter2 = @(10);
    return self;
    
}

- (void)validateAndSetCounterValues:(int)value1 and:(int)value2 {
    if ([self validCounterValues:value1 and:value2]) {
        [self setCounterValues:value1 and:value2];
    }
    
}




@end