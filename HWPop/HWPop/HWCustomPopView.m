//
//  HWCustomPopView.m
//  HWPop
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HWCustomPopView.h"
#import "UIImage+window.h"

@interface HWCustomPopView ()
@property (nonatomic, weak) IBOutlet UIImageView *blurImgView;
@property (nonatomic, weak) IBOutlet UIView *containerView;
@end

static const NSTimeInterval duration = 0.35f;
@implementation HWCustomPopView

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self conifureBaseConstraint];
    
    [self initUI];
    
}

- (void)initUI
{
    self.blurImgView.image = [UIImage windowsBlurImage];
    self.blurImgView.userInteractionEnabled = YES;
    [self.blurImgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)]];
}

- (void)conifureBaseConstraint
{
    self.containerView.transform = CGAffineTransformScale(self.containerView.transform, 0.1, 0.1);
    self.containerView.alpha = 0.f;
    [self.view layoutIfNeeded];
}

- (void)didShowAnimation
{
    [UIView animateWithDuration:duration delay:.0 usingSpringWithDamping:0.65 initialSpringVelocity:0.5 options:0 animations:^{
        self.containerView.transform = CGAffineTransformIdentity;
        self.containerView.alpha = 1.f;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismiss
{
    [UIView animateWithDuration:duration/2 delay:0.f usingSpringWithDamping:0.65 initialSpringVelocity:0.5 options:0 animations:^{
        self.containerView.transform = CGAffineTransformScale(self.containerView.transform, 0.1, 0.1);
        self.containerView.alpha = 0.f;
    } completion:^(BOOL finished) {
        if (finished) {
            [super dismiss];
        }
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
