//
//  demoViewController.m
//  存储用户数据NSUserDefaults
//
//  Created by shikee_app05 on 14-11-29.
//  Copyright (c) 2014年 shikee_app05. All rights reserved.
//

#import "demoViewController.h"

@interface demoViewController (){
    
    UITextField *uidNumber;
    UITextField *nameText;
    UITextField *passwordText;
    UITextField *signText;
    UITextField *phoneText;
    
    UITextView *textView;
    UIImageView *saveView;
    UIImageView *imageView;
}

@end

@implementation demoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    /*
     UI编号
     */
    UILabel *idLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 90, 25)];
    idLabel.textColor = [UIColor whiteColor];
    idLabel.textAlignment = NSTextAlignmentRight;
    idLabel.text = @"编号：";
    [self.view addSubview:idLabel];
    
    uidNumber = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(idLabel.frame), CGRectGetMinY(idLabel.frame), 200, CGRectGetHeight(idLabel.frame))];
    uidNumber.borderStyle = UITextBorderStyleRoundedRect;
    uidNumber.placeholder = @"输入编号";
    uidNumber.delegate = self;
    [self.view addSubview:uidNumber];
    /*
     UI姓名
     */
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(idLabel.frame), CGRectGetMaxY(idLabel.frame)+10, CGRectGetWidth(idLabel.frame), CGRectGetHeight(idLabel.frame))];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentRight;
    nameLabel.text = @"姓名：";
    [self.view addSubview:nameLabel];
    
    nameText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame), CGRectGetMinY(nameLabel.frame), CGRectGetWidth(uidNumber.frame), CGRectGetHeight(nameLabel.frame))];
    nameText.borderStyle = UITextBorderStyleRoundedRect;
    nameText.placeholder = @"输入姓名";
    nameText.delegate = self;
    [self.view addSubview:nameText];

    
    /*
     UI密码
     */
    UILabel *passwordLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(nameLabel.frame), CGRectGetMaxY(nameLabel.frame)+10, CGRectGetWidth(idLabel.frame), CGRectGetHeight(idLabel.frame))];
    passwordLabel.textColor = [UIColor whiteColor];
    passwordLabel.textAlignment = NSTextAlignmentRight;
    passwordLabel.text = @"密码：";
    [self.view addSubview:passwordLabel];
    passwordText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(passwordLabel.frame), CGRectGetMinY(passwordLabel.frame), CGRectGetWidth(uidNumber.frame), CGRectGetHeight(passwordLabel.frame))];
    passwordText.borderStyle = UITextBorderStyleRoundedRect;
    passwordText.placeholder = @"输入密码";
    passwordText.delegate = self;
    [self.view addSubview:passwordText];
    /*
     UI标识
     */
    UILabel *signLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(nameLabel.frame), CGRectGetMaxY(passwordLabel.frame)+10, CGRectGetWidth(idLabel.frame), CGRectGetHeight(idLabel.frame))];
    signLabel.textColor = [UIColor whiteColor];
    signLabel.textAlignment = NSTextAlignmentRight;
    signLabel.text = @"SIGN：";
    [self.view addSubview:signLabel];
    signText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(idLabel.frame), CGRectGetMinY(signLabel.frame), CGRectGetWidth(uidNumber.frame), CGRectGetHeight(passwordLabel.frame))];
    signText.borderStyle = UITextBorderStyleRoundedRect;
    signText.placeholder = @"输入SIGN";
    signText.delegate = self;
    [self.view addSubview:signText];
    /*
     UI号码
     */
    UILabel *phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(nameLabel.frame), CGRectGetMaxY(signText.frame)+10, CGRectGetWidth(idLabel.frame), CGRectGetHeight(idLabel.frame))];
    phoneLabel.textColor = [UIColor whiteColor];
    phoneLabel.textAlignment = NSTextAlignmentRight;
    phoneLabel.text = @"号码：";
    [self.view addSubview:phoneLabel];
    phoneText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(idLabel.frame), CGRectGetMinY(phoneLabel.frame), CGRectGetWidth(uidNumber.frame), CGRectGetHeight(passwordLabel.frame))];
    phoneText.borderStyle = UITextBorderStyleRoundedRect;
    phoneText.placeholder = @"输入联系号码";
    phoneText.delegate = self;
    [self.view addSubview:phoneText];
    
    /*
     UI按钮
     */
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    searchBtn.frame = CGRectMake(10, CGRectGetMaxY(phoneText.frame)+20, 300, 25);
    searchBtn.tintColor = [UIColor whiteColor];
    searchBtn.backgroundColor = [UIColor brownColor];
    [searchBtn setTitle:@"保存并显示" forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchBtn];
    
    
    textView = [[UITextView alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(searchBtn.frame)+20, 200, 280)];
    textView.backgroundColor = [UIColor clearColor];
    textView.textColor = [UIColor whiteColor];
    textView.editable = NO;
    [self.view addSubview:textView];
    
    UILabel *saveLabel = [[UILabel alloc]initWithFrame:CGRectMake(315-100, CGRectGetMaxY(searchBtn.frame)+20, 100, CGRectGetHeight(idLabel.frame))];
    saveLabel.textColor = [UIColor whiteColor];
    saveLabel.textAlignment = NSTextAlignmentCenter;
    saveLabel.text = @"要保存的图片";
    saveLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:saveLabel];

    saveView = [[UIImageView alloc]initWithFrame:CGRectMake(215, CGRectGetMaxY(saveLabel.frame)+10, 100, 100)];
    saveView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    saveView.image = [UIImage imageNamed:@"iOS8.jpg"];
    [self.view addSubview:saveView];
    
    UILabel *imageLabel = [[UILabel alloc]initWithFrame:CGRectMake(315-100, CGRectGetMaxY(saveView.frame)+10, 100, CGRectGetHeight(idLabel.frame))];
    imageLabel.textColor = [UIColor whiteColor];
    imageLabel.textAlignment = NSTextAlignmentCenter;
    imageLabel.text = @"读取出的图片";
    imageLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:imageLabel];
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(215, CGRectGetMaxY(imageLabel.frame)+10, 100, 100)];
    imageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:imageView];
    
    
    
    
    Person *person = [Person callPerson];
    
    uidNumber.text = person.userId;
    nameText.text = person.userName;
    passwordText.text = person.password;
    signText.text = person.sign;
    
    phoneText.text = person.phoneNumber;
    saveView.image = person.headPicture;
    
    imageView.image = person.headPicture;
    
}
//点击return 按钮 去掉
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)btnClick:(UIButton *)sender{
    Person *person = [Person callPerson];
    
    person.userId = uidNumber.text;
    person.userName = nameText.text;
    person.password = passwordText.text;
    person.sign = signText.text;
    
    person.phoneNumber = phoneText.text;
    person.headPicture = saveView.image;
    
    NSDictionary *userDic =  [NSDictionary dictionaryWithObjectsAndKeys:
                              person.userId, @"uid",
                              person.userName, @"name",
                              person.password, @"password",
                              person.sign, @"sign",
                              person.phoneNumber, @"phoneNumber",
                              person.headPicture, @"headPicture",nil];
    
    textView.text = [NSString stringWithFormat:@"%@",userDic];
    imageView.image = person.headPicture;
    
    [self.view endEditing:YES];//取消第一响应者
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
