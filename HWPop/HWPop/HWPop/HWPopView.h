//
//  HWPopView.h
//  HWPop
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 Apple. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HWPopView : UIViewController
@property (nonatomic, copy, nullable) void (^didDisplayed)(HWPopView *);
@property (nonatomic, copy, nullable) void (^didDismissed)(HWPopView *);

- (void)show;
- (void)showInLowWindowLevel;

- (void)dismiss;
- (void)dismiss:(void(^)(void))completion;

- (void)didShowAnimation;

@end

NS_ASSUME_NONNULL_END
