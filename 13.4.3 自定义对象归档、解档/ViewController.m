//
//  ViewController.m
//  13.4.3 自定义对象归档、解档
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ArchiveService.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)writeToArchive:(id)sender {
    NSDictionary *dict = @{@"name":self.nameTextField.text,
                           @"age":self.ageTextField.text};
    
    Person *person = [Person personWithDict:dict];
    
    if([ArchiveService writeObjectToArchiveFile:person]){
        NSLog(@"归档成功");
    };
}

- (IBAction)readFromArchiive:(id)sender {
    Person *person = [ArchiveService readObjectFromArchiveFile];
    NSLog(@"person name: %@, person age:%@", person.name,person.age);
}



@end
