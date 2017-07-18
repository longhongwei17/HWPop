//
//  Person.h
//  HWPop
//
//  Created by Apple on 2017/7/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy, readonly) NSString *name;

+ (instancetype)personWithName:(NSString *)name;

@end
