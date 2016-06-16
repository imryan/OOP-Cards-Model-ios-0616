//
//  FISCardDeck.h
//  OOP-Cards-Model
//
//  Created by Ryan Cohen on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISCardDeck : NSObject

@property (nonatomic, strong) NSMutableArray *remainingCards;
@property (nonatomic, strong) NSMutableArray *dealtCards;

- (FISCard *)drawNextCard;

- (void)resetDeck;
- (void)gatherDealtCards;
- (void)shuffleRemainingCards;

@end
