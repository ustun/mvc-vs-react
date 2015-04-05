#import "ViewController.h"
#import "Counters.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *counterLabel1;
@property (weak, nonatomic) IBOutlet UITextField *input;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel2;
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


- (void) render {
    NSString *labelTemplate = @"%@, you clicked me %d times, need to click %d more times" ;
    
    self.counterLabel1.text = [NSString stringWithFormat:labelTemplate, [self.input text],
                               [self.counters.counter1 intValue], 10 - [self.counters.counter1 intValue]];
    self.counterLabel2.text = [NSString stringWithFormat:labelTemplate, [self.input text],
                               [self.counters.counter2 intValue], 10 - [self.counters.counter2 intValue]];
    
    if ([self.counters canIncrement]) {
        self.incrementButton.enabled = YES;
        
    } else {
        self.incrementButton.enabled = NO;
    }
    
    if ([self.counters canDecrement]) {
        self.decrementButton.enabled = YES;
    } else {
        self.decrementButton.enabled = NO;
    }
    
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
