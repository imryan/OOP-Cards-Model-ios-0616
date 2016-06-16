//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Ryan Cohen on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"

@implementation FISCardDeck

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _remainingCards = [NSMutableArray new];
        _dealtCards = [NSMutableArray new];
        
        [self generateDeck];
    }
    
    return self;
}

- (FISCard *)drawNextCard {
    if (self.remainingCards == 0) {
        NSLog(@"Can't draw another card. Deck is empty!");
        return nil;
    }
    
    FISCard *card = [self.remainingCards firstObject];
    
    if (!card) {
        return nil;
    }
    
    [self.remainingCards removeObject:card];
    [self.dealtCards addObject:card];
    
    return card;
}

- (void)resetDeck {
    [self gatherDealtCards];
    [self shuffleRemainingCards];
}

- (void)gatherDealtCards {
    [self.remainingCards addObjectsFromArray:self.dealtCards];
    [self.dealtCards removeAllObjects];
}

- (void)shuffleRemainingCards {
    NSMutableArray *shuffledCards = [self.remainingCards mutableCopy];
    [self.remainingCards removeAllObjects];
    
    while (shuffledCards.count != 0) {
        FISCard *card = [self getRandomCardFromArray:shuffledCards];
        [self.remainingCards addObject:card];
        [shuffledCards removeObject:card];
    }
}

- (BOOL)cardIsGenuine:(FISCard *)card {
    BOOL genuine = YES;
    
    for (FISCard *aCard in self.remainingCards) {
        if ([card.cardLabel isEqualToString:aCard.cardLabel]) {
            genuine = NO;
        }
    }
    
    return genuine;
}

- (FISCard *)getRandomCardFromArray:(NSArray *)array {
    NSUInteger randomIndex = arc4random_uniform((uint32_t)array.count);
    return array[randomIndex];
}

- (FISCard *)generateRandomCard {
    NSUInteger suit = arc4random_uniform((uint32_t)[FISCard validSuits].count);
    NSUInteger rank = arc4random_uniform((uint32_t)[FISCard validRanks].count);
    
    NSString *suitString = [[FISCard validSuits] objectAtIndex:suit];
    NSString *rankString = [[FISCard validRanks] objectAtIndex:rank];
    
    return [[FISCard alloc] initWithSuit:suitString rank:rankString];
}

- (void)generateDeck {
    for (NSUInteger i = 0; i < 52; i++) {
        FISCard *card = [self generateRandomCard];

        while (![self cardIsGenuine:card]) {
            card = [self generateRandomCard];
        }
        
        if ([self cardIsGenuine:card]) {
            [self.remainingCards addObject:card];
        }
    }
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendString:[NSString stringWithFormat:@"Count: %lu\nCards:\n", self.remainingCards.count]];
    
    for (FISCard *card in self.remainingCards) {
        [description appendString:[NSString stringWithFormat:@"%@ ", card.description]];
    }
    
    return description;
}

@end
