//
//  RootViewController.m
//  CallPhone
//
//  Created by David on 13-11-8.
//  Copyright (c) 2013年 David. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    NSArray *array = [[NSArray alloc]initWithObjects:@"内部拨号1",@"内部拨号2",@"网页拨号", nil];
    for (int i = 0; i<3; i++) {
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button1 setFrame:CGRectMake(200, 60+i*60, 90, 50)];
        [button1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button1 setTag:i+200];
        [button1 setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        [self.view addSubview:button1];
    }
    
}

- (void)buttonClicked:(UIButton *)sender
{
    if (sender.tag%200 == 0) {
        //内部拨号1
        //这种拨号方法是不通知用户的情况下，直接跳转到拨号页面进行拨号，结束后不能回到程序中，停留在拨号页面
        //app store不可通过
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://10086"]];
    }
    if (sender.tag%200 == 1) {
        //内部拨号2
        //这种拨号方法比前者多一个uialertview的提示，拨号结束后返回程序中，可上线
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"telprompt://10086"]];
    }
    if (sender.tag%200 == 2) {
        //ios6之前可用，之后失效。
        UIWebView *callPhoneWeb = [[UIWebView alloc]init];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"tel://10086"]];
        [callPhoneWeb loadRequest:request];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
