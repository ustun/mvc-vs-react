#import <Foundation/Foundation.h>
#import "ChildComponent.h"

@implementation ChildComponent


-(void)setProps:(NSDictionary *)props {
    
    for(id key in props) {
        id value = [props objectForKey:key];
        NSString *firstLetterCapitalized = [NSString stringWithFormat:@"%@%@",[[key substringToIndex:1] uppercaseString],[key substringFromIndex:1] ];
        NSString *setterName = [NSString stringWithFormat:@"set%@:", firstLetterCapitalized];
        
        SEL s = NSSelectorFromString(setterName);
        [self performSelector:s withObject:value];
    }
    
}

- (void)render {
    
}

@end