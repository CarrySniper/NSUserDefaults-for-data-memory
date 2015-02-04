//
//  Person.h
//  存储用户数据NSUserDefaults
//
//  Created by shikee_app05 on 14-11-29.
//  Copyright (c) 2014年 shikee_app05. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    //NSUserDefaults *userDefaults;
}

/*
 **该app用户包含的数据
 */

//一般情况下都会有
@property (nonatomic, strong) NSString *userId;//用户ID
@property (nonatomic, strong) NSString *userName;//用户名
@property (nonatomic, strong) NSString *password;//密码
@property (nonatomic, strong) NSString *sign;//服务器生成的签名

//定制的数据
@property (nonatomic, strong) NSString *phoneNumber;//联系号码

@property (nonatomic, strong) NSString *headPicPath;//用户头像路径
@property (nonatomic, strong) NSURL *headPicURL;//用户头像url路径
@property (nonatomic, strong) UIImage *headPicture;//用户头像

@property (nonatomic, assign) BOOL      isLogin;//是否已经登陆

//初始化及调用person类
+ (id) callPerson;

@end
