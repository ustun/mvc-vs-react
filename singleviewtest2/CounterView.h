//
//  CounterView.h
//  singleviewtest2
//
//  Created by Ustun Ozgur on 4/5/15.
//  Copyright (c) 2015 Ustun Ozgur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChildComponent.h"

@interface CounterView : ChildComponent

@property (strong) NSNumber *counter;
@property (strong) NSString *inputText;


@end
