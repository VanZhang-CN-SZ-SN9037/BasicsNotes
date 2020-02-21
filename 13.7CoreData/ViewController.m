//
//  ViewController.m
//  13.7CoreData
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import "Person+CoreDataClass.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIAlertController *alert;
@property (nonatomic, strong) NSMutableArray<Person *> *personList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1. 获取NSManagedObjectContext对象
    AppDelegate *appDelegate = (id)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    // 2. 生成一个Person的查询对象
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    // 3. 设置查询对象排序描述符，这样能使得查询的结果按照我们的需要排序
    NSSortDescriptor * sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSArray * sortDescriptors = [NSArray arrayWithObject: sort];
    fetchRequest.sortDescriptors = sortDescriptors;
    // 4. 设置查询条件，我们这边直接返回TRUE，表示查询所有数据
    NSPredicate *predicate = [NSPredicate predicateWithValue:YES];
    fetchRequest.predicate = predicate;
    // 5. 执行查询语句，并更新tableview的显示
    NSArray * results = [context executeFetchRequest:fetchRequest error:nil];
    [self.personList addObjectsFromArray:results];
    //更新表视图
    [self.tableView reloadData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.alert dismissViewControllerAnimated:YES completion:^{
        NSLog(@"%@", textField.text);
        // 1. 获取NSManagedObjectContext对象
        AppDelegate *appDelegate = (id)[UIApplication sharedApplication].delegate;
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        // 2. 创建Person实体描述
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person"
                                                  inManagedObjectContext:context];
        // 3. 创建一个Person实体
        Person *person = (id)[[NSManagedObject alloc] initWithEntity:entity
                                      insertIntoManagedObjectContext:context];
        person.name = textField.text;
        // 4. 添加Person实体到UITableView数据源
        [self.personList addObject:person];
        [self.tableView reloadData];
    }];
    self.alert = nil;
    return YES;
}

- (IBAction)onClickedAddButton:(id)sender {
    self.alert = [UIAlertController alertControllerWithTitle:@"添加名字" message:nil preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(self) weakSelf = self;
    [self.alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.delegate = weakSelf;
    }];
    [self presentViewController:self.alert animated:YES completion:nil];
}

- (IBAction)onClickedEditLastOneButton:(id)sender {
    NSLog(@"修改最后一行");
    Person *person = self.personList.lastObject;
    person.name = [NSString stringWithFormat:@"已修改:%@", person.name];
    [self.tableView reloadData];
}

- (IBAction)onClickedDeleteLastOneButton:(id)sender {
    if (self.personList.count == 0) {
        NSLog(@"没有数据了，不能进行操作");
        return;
    }
    
    NSLog(@"删除最后一行");
    // 1. 获取最后一个Person对象
    Person *person = self.personList.lastObject;
    // 2. 获取NSManagedObjectContext对象
    AppDelegate *appDelegate = (id)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    [context deleteObject:person];
    // 3. 判断Person对象如果被删除，则从self.personList中把它移除。随后更新表视图
    if ([person isDeleted]) {
        [self.personList removeObject:person];
    }
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.personList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    cell.textLabel.text = self.personList[indexPath.row].name;
    return cell;
}

#pragma mark - Getter
- (NSMutableArray<Person *> *)personList {
    if (nil == _personList) {
        _personList = [NSMutableArray<Person *> arrayWithCapacity:10];
    }
    return _personList;
}


@end
