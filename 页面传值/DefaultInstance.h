//
//  DefaultInstance.h
//  页面传值
//
//  Created by yu hua on 2018/4/18.
//  Copyright © 2018年 Chongqing Huayu Network Education Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefaultInstance : NSObject

+(instancetype)sharedInstance;

@property(nonatomic,copy)NSString *str;

@end
