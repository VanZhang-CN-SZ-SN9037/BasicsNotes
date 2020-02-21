//
//  ViewController.m
//  13.2.4 操作实例
//
//  Created by Mac on 2018/11/11.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import "Service.h"
#import "Person.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@end

@implementation ViewController

- (IBAction)writeToPlist:(id)sender {
    
    //NSString转NSNumber
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *age = [formatter numberFromString:self.ageTextField.text];
    //创建Dictionary
    NSDictionary *personItemDict = @{
                                     @"name": self.nameTextField.text,
                                     @"age": age,
                                     };
    //写入Plist文件
    [[[Service alloc] init] addPersonWithDict:personItemDict];
}

- (IBAction)readFromPlist:(id)sender {
    NSArray *personArray = [[[Service alloc] init] readAllPerson];
    for (NSDictionary *dict in personArray) {
        Person *person = [Person personWithDict:dict];
        NSLog(@"%@,%@",person.name, person.age);
    }
}



@end
