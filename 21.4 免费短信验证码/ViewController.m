//
//  ViewController.m
//  21.4 免费短信验证码
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import <SMS_SDK/SMSSDK.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)getSMS:(id)sender {
    //获取验证码
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneTextField.text zone:@"86" template:nil result:^(NSError *error) {
        if (error == nil) {
            self.resultLabel.text = @"发送成功";
            
            self.phoneTextField.userInteractionEnabled = NO;
        }else{
            self.resultLabel.text = @"failue";
            NSLog(@"%@",error);
        }
    }];
     
    
}

- (IBAction)verifySMS:(id)sender {
    //输入验证码获取结果
    
    [SMSSDK commitVerificationCode:self.codeTextField.text
                       phoneNumber:self.phoneTextField.text
                              zone:@"86"
                            result:^(NSError *error) {
                                NSLog(@"%@",error);
                                if (error == nil) {
                                    self.resultLabel.text = @"验证成功";
                                }else {
                                    NSString *errorMsg = error.userInfo[@"commitVerificationCode"];
                                    self.resultLabel.text = errorMsg;
                                }
                                
                            }
     ];
    
    
    self.phoneTextField.userInteractionEnabled = YES;
}


@end
