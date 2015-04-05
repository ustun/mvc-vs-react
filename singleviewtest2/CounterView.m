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






@end
