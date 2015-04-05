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

- (void)propogateValuesToChildren {
    
    [self.counterView1 setInputText:[self.input text] setCounter:self.counters.counter1];
    [self.counterView2 setInputText:[self.input text] setCounter:self.counters.counter2];
    
}

- (void)renderChildren {
    
    [self.counterView1 render];
    [self.counterView2 render];
}

- (void)renderSelf {
    self.incrementButton.enabled = [self.counters canIncrement];
    self.decrementButton.enabled = [self.counters canDecrement];
}

- (void) render {
    
    [self propogateValuesToChildren];
    [self renderChildren];
    [self renderSelf];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCounters];
    [self render];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
