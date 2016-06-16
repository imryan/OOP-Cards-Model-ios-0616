//
//  FISCard.m
//  OOP-Cards-Model
//
//  Created by Ryan Cohen on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCard.h"

@interface FISCard ()

@property (readwrite) NSString *suit;
@property (readwrite) NSString *rank;
@property (readwrite) NSString *cardLabel;
@property (readwrite) NSUInteger cardValue;

@end

@implementation FISCard

- (instancetype)init {
    self = [self initWithSuit:@"!" rank:@"N"];
    
    if (self) {
        // Trust me, it is
    }
    
    return self;
}

- (instancetype)initWithSuit:(NSString *)suit rank:(NSString *)rank {
    self = [super init];
    
    if (self) {
        _suit = suit;
        _rank = rank;
        
        _cardLabel = [NSString stringWithFormat:@"%@%@", _suit, _rank];
        _cardValue = [[FISCard validRanks] indexOfObject:_rank];
        
        if (_cardValue >= 10) {
            _cardValue = 10;
        } else {
            _cardValue++;
        }
    }
    
    return self;
}

+ (NSArray *)validSuits {
    return @[ @"♠", @"♥", @"♣", @"♦" ];
}

+ (NSArray *)validRanks {
    return @[ @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

- (NSString *)description {
    return self.cardLabel;
}

@end
