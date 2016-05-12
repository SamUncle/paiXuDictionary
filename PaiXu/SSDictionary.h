//
//  SSDictionary.h
//  PaiXu
//
//  Created by SmileSun on 16-5-12.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSDictionary : NSMutableDictionary
{
    NSMutableArray *array;
    NSMutableDictionary * dictionary;
}
- (id)initWithCapacity:(NSUInteger)capacity;
@end
