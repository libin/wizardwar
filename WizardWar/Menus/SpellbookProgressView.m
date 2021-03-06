//
//  SpellbookProgressView.m
//  WizardWar
//
//  Created by Sean Hess on 8/20/13.
//  Copyright (c) 2013 Orbital Labs. All rights reserved.
//

#import "SpellbookProgressView.h"
#import "UIColor+Hex.h"
#import "AppStyle.h"
#import "SpellbookService.h"

@interface SpellbookProgressView ()
@property (nonatomic, strong) DDProgressView * progressView;
@property (nonatomic) CGFloat progressPadding;
@end

@implementation SpellbookProgressView

- (void)setRecord:(SpellRecord *)record {
    _record = record;
    
    SpellbookLevel level = record.level;
    BOOL hidden = (level == SpellbookLevelNone && !record.isUnlocked);
    
    self.label.hidden = hidden;
    self.label.text = [[SpellbookService.shared levelString:level] uppercaseString];
    
    self.progressView.hidden = hidden;
    self.progressView.progress = record.progress;
        
    if (level >= SpellbookLevelMaster || record.progress == 0.0) {
        self.progressView.frame = self.centerFrame;
        self.label.frame = self.centerFrame;
    } else {
        self.progressView.frame = self.bottomHalfFrame;
        self.label.frame = self.topHalfFrame;
    }
    
    if (record.level < SpellbookLevelAdept) {
        UIColor * color = [UIColor colorFromRGB:0x8F8F8F];
        self.progressColor = color;
        self.label.textColor = color;
        
        if (record.progress == 0.0) {
            self.progressView.innerColor = [UIColor clearColor];
        }
    }
    else if (record.level < SpellbookLevelMaster) {
        self.progressColor = [AppStyle blueNavColor];
        self.label.textColor = [AppStyle blueNavColor];
    }
    else {
        self.progressColor = [AppStyle greenOnlineColor];
        self.label.textColor = [UIColor whiteColor];
    }
}


@end
