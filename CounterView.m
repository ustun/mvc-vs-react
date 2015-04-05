//
//  CounterView.m
//  singleviewtest2
//
//  Created by Ustun Ozgur on 4/5/15.
//  Copyright (c) 2015 Ustun Ozgur. All rights reserved.
//

#import "CounterView.h"

@interface CounterView()

@property (weak, nonatomic) IBOutlet UITextView *label;


@end

@implementation CounterView


- (void) render {
    NSString *labelTemplate = @"%@, you clicked me %d times, need to click %d more times" ;
    
    self.label.text = [NSString stringWithFormat:labelTemplate, self.inputText,
                               [self.counter intValue], 10 - [self.counter intValue]];
    
}

- (void)setInputText:(NSString*)text setCounter:(NSNumber*)counter {
    
    self.inputText = text;
    self.counter = counter;
}




@end
