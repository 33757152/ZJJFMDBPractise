//
//  ZJJPeopleInfo.m
//  ZJJFMDBPractise
//
//  Created by 张锦江 on 2017/7/11.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import "ZJJPeopleInfo.h"
#import "FMResultSet.h"

@implementation ZJJPeopleInfo

+ (NSMutableArray *)obtainArrayWithSet:(FMResultSet *)set {
    return [[self alloc] obtainInitArrayResultWithSet:set];
}

- (NSMutableArray *)obtainInitArrayResultWithSet:(FMResultSet *)set {
    NSMutableArray *dataArray = [NSMutableArray array];
    while ([set next]) {
        ZJJPeopleInfo *peopleInfo = [[ZJJPeopleInfo alloc] init];
        peopleInfo.peopleID = [set intForColumn:@"peopleID"];
        peopleInfo.name = [set stringForColumn:@"name"];
        peopleInfo.age = [set intForColumn:@"age"];
        [dataArray addObject:peopleInfo];
    }
    [set close];
    return dataArray;
}
@end
