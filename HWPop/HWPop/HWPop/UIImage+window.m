//
//  UIImage+window.m
//  HWPop
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UIImage+window.h"

@implementation UIImage (window)

+ (UIImage *)windowsBlurImage
{
    return [[UIImage convertViewToImage] applyBlurWithRadius:.1f tintColor:[UIColor colorWithWhite:.0f alpha:.5f] saturationDeltaFactor:1.f maskImage:nil];
}

@end
