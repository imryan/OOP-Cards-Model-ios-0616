//
//  FISCard.h
//  OOP-Cards-Model
//
//  Created by Ryan Cohen on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISCard : NSObject

@property (readonly) NSString *suit;
@property (readonly) NSString *rank;
@property (readonly) NSString *cardLabel;
@property (readonly) NSUInteger cardValue;

- (instancetype)initWithSuit:(NSString *)suit rank:(NSString *)rank;

+ (NSArray *)validSuits;
+ (NSArray *)validRanks;

@end
