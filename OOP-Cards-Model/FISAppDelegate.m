//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISCard.h"
#import "FISCardDeck.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISCard *card = [FISCard new];
    NSLog(@"Card: %@", card.description);
    
    FISCardDeck *deck = [FISCardDeck new];
    NSLog(@"%@", deck.description);
    
    return YES;
}

@end
