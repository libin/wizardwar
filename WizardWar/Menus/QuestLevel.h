//
//  QuestLevel.h
//  WizardWar
//
//  Created by Sean Hess on 8/23/13.
//  Copyright (c) 2013 Orbital Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AIService.h"

@interface QuestLevel : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic) int16_t gamesTotal;
@property (nonatomic) int16_t gamesWins;
@property (nonatomic) int16_t level;
@property (nonatomic) int16_t wizardLevel;
@property (nonatomic) BOOL passed;

@property (nonatomic, readonly) NSInteger masteryWins;
@property (nonatomic, readonly) NSInteger gamesLosses;
@property (nonatomic, readonly) CGFloat progress;
@property (nonatomic, readonly) BOOL isMastered;
@property (nonatomic, readonly) BOOL hasAttempted;

// OPPONENT
@property (nonatomic, readonly) id<AIService> ai;
// specify a type
@property (nonatomic, strong) Class AIType;
// or all of these
@property (nonatomic, strong) NSArray * tactics;
@property (nonatomic) NSUInteger colorRGB;

//@property (nonatomic, strong) NSString * woot;

@end
