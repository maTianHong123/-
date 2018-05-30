//
//  DefaultInstance.m
//  页面传值
//
//  Created by yu hua on 2018/4/18.
//  Copyright © 2018年 Chongqing Huayu Network Education Technology Co., Ltd. All rights reserved.
//

#import "DefaultInstance.h"

@implementation DefaultInstance

//通过类方法创建单例对象
+(instancetype)sharedInstance{
    static DefaultInstance *shareVC=nil;
    if (shareVC==nil) {
        shareVC=[[DefaultInstance alloc]init];
    }
    return shareVC;
}

@end
