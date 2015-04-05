#import "ViewController.h"
#import "Counters.h"
#import "CounterView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CounterView *counterView1;
@property (weak, nonatomic) IBOutlet CounterView *counterView2;
@property (weak, nonatomic) IBOutlet UITextField *input;
@property (weak, nonatomic) IBOutlet UIButton *incrementButton;
@property (weak, nonatomic) IBOutlet UIButton *decrementButton;
@property (strong) Counters *counters;

@end

@implementation ViewController


- (IBAction)handleIncrementClick:(id)sender {
    [self.counters increment];
    [self render];
}

- (IBAction)handleDecrementClick:(id)sender {
    [self.counters decrement];
    [self render];
}

- (void)initCounters {
    self.counters = [[Counters alloc] init];
}

- (void)setPropsOnChildren {
    
    [self.counterView1 setProps:@{@"inputText": self.input.text,
                                  @"counter": self.counters.counter1}];
    
    [self.counterView2 setProps:@{@"inputText": self.input.text,
                                  @"Counter": self.counters.counter2}];
    
}

- (void)renderChildren {
    [self setPropsOnChildren];
    [self.counterView1 render];
    [self.counterView2 render];
}

- (void)renderSelf {
    self.incrementButton.enabled = [self.counters canIncrement];
    self.decrementButton.enabled = [self.counters canDecrement];
}

- (void) render {
    [self renderChildren];
    [self renderSelf];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCounters];
    [self render];
}


@end
