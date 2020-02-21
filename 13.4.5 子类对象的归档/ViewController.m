//
//  ViewController.m
//  13.4.5 子类对象的归档
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import "Student.h"
#import "ArchiveService.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *scoreTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)writeToFile:(id)sender {
    Student *student = [[Student alloc] init];
    student.name = self.nameTextField.text;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    student.age = [formatter numberFromString:self.ageTextField.text];
    student.score = self.scoreTextField.text;
    if([ArchiveService writeSubObjectToArchiveFile:student]){
        NSLog(@"归档成功");
    };
}

- (IBAction)readFromFile:(id)sender {
    Student *student = [ArchiveService readSubObjectFromArchiveFile];
    NSLog(@"student name: %@, student age:%@, student score:%@", student.name,student.age,student.score);
}


@end
