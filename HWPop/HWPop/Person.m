//
//  Person.m
//  HWPop
//
//  Created by Apple on 2017/7/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Person.h"

@interface Person ()

@property (nonatomic, copy, readwrite) NSString *name;

@end

@implementation Person

+ (instancetype)personWithName:(NSString *)name
{
   return [[self alloc] initWithName:name];
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

@end
