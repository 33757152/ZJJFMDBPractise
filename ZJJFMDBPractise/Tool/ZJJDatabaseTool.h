//
//  ZJJDatabaseTool.h
//  TestDemo
//
//  Created by 张锦江 on 2017/7/11.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZJJPeopleInfo;
@interface ZJJDatabaseTool : NSObject

// 创建表格
+ (void)creatDatabaseTable;

// 添加元素到数据库里面
+ (void)insertDataToTableWithModel:(ZJJPeopleInfo *)model;

// 删除数据库里面的某个元素
+ (void)deleteDataOfTableWithModel:(ZJJPeopleInfo *)model;

// 查询数据库里面的所有数据
+ (NSMutableArray *)selectTableAllData;

@end
