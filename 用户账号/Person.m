//
//  Person.m
//  存储用户数据NSUserDefaults
//
//  Created by shikee_app05 on 14-11-29.
//  Copyright (c) 2014年 shikee_app05. All rights reserved.
//

#import "Person.h"

static Person *person;

@implementation Person

/*
 **初始化方法
 */
-(id)init
{
    if (!person) {
        person = [super init];
        if (person) {
//            if ([[NSUserDefaults standardUserDefaults] boolForKey:userDefaultBoolIsLogin]) {
            
            _isLogin = [[NSUserDefaults standardUserDefaults] boolForKey:userDefaultBoolIsLogin];
        
            _userId = [[NSUserDefaults standardUserDefaults] objectForKey:userDefaultStringUserID];
            _userName = [[NSUserDefaults standardUserDefaults] objectForKey:userDefaultStringUserName];
            _password = [[NSUserDefaults standardUserDefaults] objectForKey:userDefaultStringPassWord];
            _sign = [[NSUserDefaults standardUserDefaults] objectForKey:userDefaultStringSign];
            
            _phoneNumber = [[NSUserDefaults standardUserDefaults] objectForKey:userDefaultStringPhoneNumber];
            
            _headPicPath = [[NSUserDefaults standardUserDefaults] objectForKey:userDefaultStringHeadPicPath];
            _headPicURL = [[NSUserDefaults standardUserDefaults] objectForKey:userDefaultURLHeadPicPath];
            
            NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:userDefaultDataHeadPicture];
            _headPicture = [UIImage imageWithData:imageData];
//            }
        }
    }
    return person;
}

//调用person类
+ (id) callPerson
{
    if (!person) {
        person = [[Person alloc]init];
    }
    return person;
}

#pragma mark- set方法
#pragma mark 一般都必备的数据
-(void)setUserId:(NSString *)userId
{
    [[NSUserDefaults standardUserDefaults] setObject:userId forKey:userDefaultStringUserID];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _userId = userId;
}
-(void)setUserName:(NSString *)userName
{
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:userDefaultStringUserName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _userName = userName;
}
-(void)setPassword:(NSString *)password
{
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:userDefaultStringPassWord];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _password = password;
}
-(void)setSign:(NSString *)sign
{
    [[NSUserDefaults standardUserDefaults] setObject:sign forKey:userDefaultStringSign];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _sign = sign;
}

#pragma mark 定制的数据
//联系号码
-(void)setPhoneNumber:(NSString *)phoneNumber
{
    [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:userDefaultStringPhoneNumber];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _phoneNumber = phoneNumber;
}
//头像路径
-(void)setHeadPicPath:(NSString *)headPicPath
{
    [[NSUserDefaults standardUserDefaults] setObject:headPicPath forKey:userDefaultStringHeadPicPath];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _headPicPath = headPicPath;
}
//头像网络URL路径
-(void)setHeadPicURL:(NSURL *)headPicURL
{
    [[NSUserDefaults standardUserDefaults] setObject:headPicURL forKey:userDefaultURLHeadPicPath];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _headPicURL = headPicURL;
}
//头像，需要想转换为NSData
-(void)setHeadPicture:(UIImage *)headPicture
{
    NSData *imageData;
    if (UIImagePNGRepresentation(headPicture) == nil) {
        imageData = UIImageJPEGRepresentation(headPicture, 1);
    } else {
        imageData = UIImagePNGRepresentation(headPicture);
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:imageData forKey:userDefaultDataHeadPicture];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _headPicture = headPicture;
}
//是否登陆
-(void)setIsLogin:(BOOL)isLogin
{
    [[NSUserDefaults standardUserDefaults] setBool:isLogin forKey:userDefaultBoolIsLogin];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _isLogin = isLogin;
}


@end
