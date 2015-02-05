# NSUserDefaults-for-data-memory
NSUserDefaults存储登陆账号信息，用户名、明文密码、头像、sign、是否登陆状态等。

#方法：

读取数据:{

    [[NSUserDefaults standardUserDefaults] objectForKey:@"keyString"];

存储数据:{

    [[NSUserDefaults standardUserDefaults] setObject:"valve" forKey:@"keyString"]; 
    [[NSUserDefaults standardUserDefaults] synchronize];

#Person.m主要内容
初始化方法-(id)init{return person;}

	if (!person) {
		person = [super init];
        if (person) { 
        if ([[NSUserDefaults standardUserDefaults] boolForKey:userDefaultBoolIsLogin]) {
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
            }
        }
    }
#pragma mark- set方法
pragma mark 一般都必备的数据

-(void)setUserId:(NSString *)userId{

    [[NSUserDefaults standardUserDefaults] setObject:userId forKey:userDefaultStringUserID];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _userId = userId;
    }
-(void)setUserName:(NSString *)userName{

    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:userDefaultStringUserName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _userName = userName;
    }
-(void)setPassword:(NSString *)password{

    [[NSUserDefaults standardUserDefaults] setObject:password forKey:userDefaultStringPassWord];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _password = password;
    }
-(void)setSign:(NSString *)sign{

    [[NSUserDefaults standardUserDefaults] setObject:sign forKey:userDefaultStringSign];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _sign = sign;
    }
#pragma mark 定制的数据
//联系号码
-(void)setPhoneNumber:(NSString *)phoneNumber{

    [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:userDefaultStringPhoneNumber];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _phoneNumber = phoneNumber;
    }
//头像路径
-(void)setHeadPicPath:(NSString *)headPicPath{

    [[NSUserDefaults standardUserDefaults] setObject:headPicPath forKey:userDefaultStringHeadPicPath];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _headPicPath = headPicPath;
    }
//头像网络URL路径
-(void)setHeadPicURL:(NSURL *)headPicURL{

    [[NSUserDefaults standardUserDefaults] setObject:headPicURL forKey:userDefaultURLHeadPicPath];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _headPicURL = headPicURL;
    }
//头像，需要转换为NSData
-(void)setHeadPicture:(UIImage *)headPicture{

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
-(void)setIsLogin:(BOOL)isLogin{

    [[NSUserDefaults standardUserDefaults] setBool:isLogin forKey:userDefaultBoolIsLogin];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _isLogin = isLogin;
    }
