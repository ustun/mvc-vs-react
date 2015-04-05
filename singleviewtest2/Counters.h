@interface Counters : NSObject

@property (strong) NSNumber *counter1;
@property (strong) NSNumber *counter2;

- (void)increment;
- (void)decrement;
- (BOOL)canIncrement;
- (BOOL)canDecrement;
- (Counters *)init;
@end
