//
//  ViewController.m
//  页面传值
//
//  Created by yu hua on 2018/4/18.
//  Copyright © 2018年 Chongqing Huayu Network Education Technology Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "DefaultInstance.h"
@interface ViewController ()<NextViewControllerDelegate>

@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UILabel *label;

@end

@implementation ViewController

-(UILabel*)label{
    if (_label==nil) {
        _label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
        _label.backgroundColor=[UIColor blackColor];
        _label.textColor=[UIColor whiteColor];
        _label.font=[UIFont systemFontOfSize:20];
        
    }
    return _label;
}

-(UIButton*)button
{
    if (_button==nil) {
        _button=[[UIButton alloc]initWithFrame:CGRectMake(100, 200, 200, 40)];
        _button.backgroundColor=[UIColor redColor];
        [_button setTitle:@"跳转至页面2" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.button];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //self.label.text=[DefaultInstance sharedInstance].str;
    //self.label.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"NSUserDefaults-re"];
}

-(void)buttonClick{
    NextViewController *VC=[[NextViewController alloc]init];
    //单例传值
    //[DefaultInstance sharedInstance].str=@"单例传值";
    //NSUserDefaults传值
    //[[NSUserDefaults standardUserDefaults] setObject:@"NSUserDefaults传值" forKey:@"NSUserDefaults"];
    //[[NSUserDefaults standardUserDefaults] synchronize];
    //VC.delegate=self;
    //block传值-接收来自页面2的值
    /**
    VC.block = ^(NSString *str){
        self.label.text=str;
    };
     */
    //通知传值-添加监听=等待页面2的传值
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationValueAction:) name:@"notify" object:nil];
    [self presentViewController:VC animated:YES completion:nil];
}

#pragma mark-NextViewControllerDelegate
-(void)passValue:(NSString *)str{
    //self.label.text=str;
}
//接收到通知之后的处理
-(void)notificationValueAction:(NSNotification*)notification{
    self.label.text=[notification.userInfo objectForKey:@"name"];
}

@end
