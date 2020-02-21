//
//  ViewController.m
//  13.4.4 归档多个自定义对象
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import "ArchiveService.h"
#import "Person.h"
@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *personsArray;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@end

@implementation ViewController

-(NSMutableArray *)personsArray{
    if (_personsArray == nil) {
        //从归档文件中创建，如果文件不存在，则初始化一个空的数组
        _personsArray = [ArchiveService readObjectsFromArchiveFile];
        if (_personsArray == nil) {
            _personsArray = [NSMutableArray array];
        }
    }
    return _personsArray;
}

- (IBAction)writeToFile:(id)sender {
    NSDictionary *dict = @{@"name":self.nameTextField.text,
                           @"age":self.ageTextField.text};
    Person *person = [Person personWithDict:dict];
    [self.personsArray addObject:person];
    if([ArchiveService writeObjectsToArchiveFile:self.personsArray]){
        NSLog(@"归档成功");
    };
}

- (IBAction)readFromFile:(id)sender {
    NSMutableArray *persons = [ArchiveService readObjectsFromArchiveFile];
    for (Person *person in persons) {
        NSLog(@"person name: %@, person age:%@", person.name,person.age);
    }
}

@end
