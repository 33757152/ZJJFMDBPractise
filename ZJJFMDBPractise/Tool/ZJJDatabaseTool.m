//
//  ZJJDatabaseTool.m
//  TestDemo
//
//  Created by 张锦江 on 2017/7/11.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import "ZJJDatabaseTool.h"
#import "ZJJPeopleInfo.h"
#import "FMDatabase.h"

@implementation ZJJDatabaseTool

static FMDatabase *_db = nil;

+ (void)creatDatabaseTable {
    NSString *path = [NSString stringWithFormat:@"%@/Documents/zjj.sqlite",NSHomeDirectory()];
    if (!_db) {
        _db = [FMDatabase databaseWithPath:path];
        [_db open];
        NSString *creatSQL = @"create table ZJJTable (peopleID integer primary key autoincrement, name text not null, age integer not null);";
        [_db executeUpdate:creatSQL];
        [_db close];
    }
    NSLog(@"数据库路径为:%@",path);
}

+ (void)insertDataToTableWithModel:(ZJJPeopleInfo *)model {
    [_db open];
    NSString *insertSql = [NSString stringWithFormat:@"insert into ZJJTable (name,age) values ('%@','%ld'); ",model.name,model.age];
    [_db executeUpdate:insertSql];
    [_db close];
}

+ (void)deleteDataOfTableWithModel:(ZJJPeopleInfo *)model {
    [_db open];
    NSString *deleteSql = [NSString stringWithFormat:@"delete from ZJJTable where PeopleID = '%ld';",model.peopleID];
    [_db executeUpdate:deleteSql];
    [_db close];
}

+ (NSMutableArray *)selectTableAllData {
    [_db open];
    NSString *selectSql = @"select * from ZJJTable;";
    FMResultSet *set = [_db executeQuery:selectSql];
    NSMutableArray *mArr = [ZJJPeopleInfo obtainArrayWithSet:set];
    [_db close];
    return mArr;    
}




@end
