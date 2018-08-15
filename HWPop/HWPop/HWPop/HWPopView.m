//
//  HWPopView.m
//  HWPop
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HWPopView.h"

@interface HWPopView ()

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, weak) UIWindow *previousWindow;

@end
static const NSTimeInterval animationDuration = 0.05f;
@implementation HWPopView

- (void)show
{
    [self level:UIWindowLevelStatusBar+1];
    [self actionAnimation];
}

- (void)showInLowWindowLevel
{
    [self level:UIWindowLevelNormal +1];
    [self actionAnimation];
}

- (void)level:(CGFloat)level
{
    self.view.userInteractionEnabled = NO;
    self.previousWindow = [UIApplication sharedApplication].keyWindow;
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.windowLevel = level;
    window.rootViewController = self;
    window.backgroundColor = [UIColor clearColor];
    window.alpha = 0.f;
    [window makeKeyAndVisible];
    self.window = window;
}

- (void)actionAnimation
{
    [UIView animateWithDuration:animationDuration animations:^{
        self.window.alpha = 1.f;
    } completion:^(BOOL finished) {
        self.view.userInteractionEnabled = YES;
        if (self.didDisplayed) {
            self.didDisplayed(self);
        }
        [self didShowAnimation];
    }];
}

// just add log
- (void)didShowAnimation
{
    // TODO
}

- (void)dismiss
{
    self.view.userInteractionEnabled = NO;
    [UIView animateWithDuration:animationDuration/2 animations:^{
        self.window.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self.window resignKeyWindow];
        [self.previousWindow makeKeyAndVisible];
        self.window = nil;
        
        if (self.didDismissed) {
            self.didDismissed(self);
        }
    }];
}

- (void)dismiss:(void (^)(void))completion
{
    self.view.userInteractionEnabled = NO;
    [UIView animateWithDuration:animationDuration/2 animations:^{
        self.window.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self.window resignKeyWindow];
        [self.previousWindow makeKeyAndVisible];
        self.window = nil;
        
        if (self.didDismissed) {
            self.didDismissed(self);
        }
        if (completion) {
            completion();
        }
    }];
}

@end
