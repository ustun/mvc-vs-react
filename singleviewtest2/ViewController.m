#import "ViewController.h"
#import "Counters.h"
#import "CounterView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CounterView *counterView1;
@property (weak, nonatomic) IBOutlet CounterView *counterView2;
@property (weak, nonatomic) IBOutlet UITextField *input;
@property (weak, nonatomic) IBOutlet UILabel *nameOutput;
@property (weak, nonatomic) IBOutlet UIButton *incrementButton;
@property (weak, nonatomic) IBOutlet UIButton *decrementButton;
@property (weak, nonatomic) IBOutlet UILabel *counterValues;

// Model (or state variables)
@property (strong) Counters *counters;
@property (strong) NSString *name;

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


- (IBAction)handleEditingChanged:(id)sender {
    self.name = [(UITextField*)sender text];
    [self render];
}

- (void)setPropsOnChildren {
    
    [self.counterView1 setProps:@{@"inputText": self.name,
                                  @"counter": self.counters.counter1}];
    
    [self.counterView2 setProps:@{@"inputText": self.name,
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
    self.input.text = self.name;
    self.nameOutput.text = [NSString stringWithFormat:@"Your name is: %@", self.name];
    
    self.counterValues.text = [NSString stringWithFormat:@"Counter 1 value: %d and Counter 2 value: %d",
                               self.counters.counter1.intValue,
                               self.counters.counter2.intValue];
}

- (void) render {
    [self renderChildren];
    [self renderSelf];
}

- (void)initCounters {
    self.counters = [[Counters alloc] init];
}

- (void)setInitialState {
    
    [self initCounters];
    self.name = @"Ustun Ozgur";
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInitialState];
    [self render];
}


@end
