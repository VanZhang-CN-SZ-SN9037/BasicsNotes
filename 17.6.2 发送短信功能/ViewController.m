//
//  ViewController.m
//  17.6.2 发送短信功能
//
//  Created by 李维佳 on 2017/4/14.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>
@interface ViewController ()<MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ViewController

- (IBAction)sendMessage:(id)sender {
    if( [MFMessageComposeViewController canSendText] ){
        MFMessageComposeViewController * messageController = [[MFMessageComposeViewController alloc]init];
        messageController.recipients = [NSArray arrayWithObject:self.textField.text];
        messageController.body = @"来自99iOS的短信!";
        messageController.messageComposeDelegate = self;
        //显示发送信息界面的控制器
        [self presentViewController:messageController animated:YES completion:nil];
    }else{
        NSLog(@"设备不具备短信功能");
    }
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissViewControllerAnimated:YES completion:nil];
    if (result ==  MessageComposeResultSent) {
        NSLog(@"发送成功");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
