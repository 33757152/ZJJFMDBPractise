//
//  ZJJTableInfoVC.m
//  ZJJFMDBPractise
//
//  Created by 张锦江 on 2017/7/11.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import "ZJJTableInfoVC.h"
#import "ZJJDatabaseTool.h"
#import "ZJJPeopleInfo.h"

@interface ZJJTableInfoVC ()

@property (strong,nonatomic) NSMutableArray *dataArray;

@end

@implementation ZJJTableInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"数据库信息";

    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor whiteColor];

}
- (NSMutableArray *)dataArray {
    // getter 方法
    if (!_dataArray) {
        _dataArray = [ZJJDatabaseTool selectTableAllData];
    }
    return _dataArray;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    ZJJPeopleInfo *obj = _dataArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"编号:%ld,姓名:%@,年龄:%ld",obj.peopleID,obj.name,obj.age];    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    ZJJPeopleInfo *info = _dataArray[indexPath.row];
    [ZJJDatabaseTool deleteDataOfTableWithModel:info];
    self.dataArray = [ZJJDatabaseTool selectTableAllData];
    [self.tableView reloadData];
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
