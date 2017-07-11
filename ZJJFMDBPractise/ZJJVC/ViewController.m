//
//  ViewController.m
//  ZJJFMDBPractise
//
//  Created by 张锦江 on 2017/7/11.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import "ViewController.h"
#import "ZJJTableInfoVC.h"
#import "ZJJDatabaseTool.h"
#import "ZJJPeopleInfo.h"

typedef NS_ENUM(NSUInteger,ZJJTF) {
    ZJJTFName = 1000,
    ZJJTFAge
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    [self creatUI];
}
#pragma mark - 方法
- (void)creatUI {
    UIButton *lookButton = [self obtainButtonWithSel:@selector(enterClick) frame:CGRectMake(150, 100, 100, 50) title:@"查看"];
    [self.view addSubview:lookButton];
    for (int i = 0; i<2; i++) {
        UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(50, 200+(40+30)*(i%2), KSCREEN_WIDTH-100, 40)];
        tf.backgroundColor = [UIColor lightGrayColor];
        tf.placeholder = i == 0 ? @"姓名" : @"年龄";
        tf.tag = i == 0 ? ZJJTFName : ZJJTFAge;
        [self.view addSubview:tf];
    }
    UIButton *addButton = [self obtainButtonWithSel:@selector(addClick) frame:CGRectMake(150, 350, 100, 50) title:@"添加"];
    [self.view addSubview:addButton];
}
- (UIButton *)obtainButtonWithSel:(SEL)selector frame:(CGRect)rect title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = rect;
    button.backgroundColor = [UIColor cyanColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)enterClick {
    [self.view endEditing:YES];
    ZJJTableInfoVC *vc = [[ZJJTableInfoVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)addClick {
    [self.view endEditing:YES];
    UITextField *nameTF = [self.view viewWithTag:ZJJTFName];
    UITextField *ageTF = [self.view viewWithTag:ZJJTFAge];
    if ([nameTF.text isEqualToString:@""] || [ageTF.text isEqualToString:@""]) {
        return;
    }
    ZJJPeopleInfo *info = [[ZJJPeopleInfo alloc] init];
    info.name = nameTF.text;
    info.age = [ageTF.text integerValue];
    [ZJJDatabaseTool insertDataToTableWithModel:info];    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
