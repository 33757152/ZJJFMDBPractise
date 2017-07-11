//
//  ZJJPeopleInfo.h
//  ZJJFMDBPractise
//
//  Created by 张锦江 on 2017/7/11.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMResultSet;

@interface ZJJPeopleInfo : NSObject

+ (NSMutableArray *)obtainArrayWithSet:(FMResultSet *)set;

@property (nonatomic,copy)    NSString *name;
@property (nonatomic,assign)  NSInteger age;
@property (nonatomic,assign)  NSInteger peopleID;

@end
