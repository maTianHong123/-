//
//  NextViewController.m
//  页面传值
//
//  Created by yu hua on 2018/4/18.
//  Copyright © 2018年 Chongqing Huayu Network Education Technology Co., Ltd. All rights reserved.
//

#import "NextViewController.h"
#import "DefaultInstance.h"
@interface NextViewController ()

@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UITextField *textField;

@end

@implementation NextViewController

-(UITextField*)textField{
    if (!_textField) {
        _textField=[[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
        _textField.backgroundColor=[UIColor blackColor];
        _textField.textColor=[UIColor whiteColor];
        
        //_textField.text=[DefaultInstance sharedInstance].str;
        //_textField.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"NSUserDefaults"];
    }
    return _textField;
}

-(UIButton*)button
{
    if (!_button) {
        _button=[[UIButton alloc]initWithFrame:CGRectMake(100, 200, 200, 40)];
        _button.backgroundColor=[UIColor redColor];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button setTitle:@"返回页面1" forState:UIControlStateNormal];
        _button.titleLabel.font=[UIFont systemFontOfSize:20];
        
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.button];
    // Do any additional setup after loading the view.
}

-(void)buttonAction{
    //[DefaultInstance sharedInstance].str=_textField.text;
    //[[NSUserDefaults standardUserDefaults] setObject:self.textField.text forKey:@"NSUserDefaults-re"];
    //[[NSUserDefaults standardUserDefaults] synchronize];
    //代理传值
    //[self.delegate passValue:self.textField.text];
    //block传值
    //_block(self.textField.text);
    //通知传值-发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notify" object:nil userInfo:@{@"name":self.textField.text}];
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
