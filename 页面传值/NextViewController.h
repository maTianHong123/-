//
//  NextViewController.h
//  页面传值
//
//  Created by yu hua on 2018/4/18.
//  Copyright © 2018年 Chongqing Huayu Network Education Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NextViewControllerDelegate <NSObject>

-(void)passValue:(NSString* )str;

@end

@interface NextViewController : UIViewController

@property(nonatomic,weak)id<NextViewControllerDelegate>delegate;

//定义一个block进行页面反向传值
@property(copy) void (^block)(NSString*);

@end
