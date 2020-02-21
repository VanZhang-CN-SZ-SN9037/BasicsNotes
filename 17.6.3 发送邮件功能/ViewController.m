//
//  ViewController.m
//  17.6.3 发送邮件功能
//
//  Created by 李维佳 on 2017/4/14.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MFMailComposeViewController.h>
@interface ViewController ()<MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ViewController

- (IBAction)sendMail:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        NSString *recipient = [NSString stringWithFormat:@"%@",self.textField.text];
        [controller setToRecipients:[NSArray arrayWithObjects:recipient, nil]];
        //要发送的邮件主题
        [controller setSubject:@"邮件测试"];
        //要发送邮件的内容
        [controller setMessageBody:@"Hello " isHTML:NO];
        [self presentViewController:controller animated:YES completion:nil];
    }else{
        NSLog(@"设备不具备发送邮件功能");
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error {
    if (result == MFMailComposeResultSent) {
        NSLog(@"邮件发送成功");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
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
