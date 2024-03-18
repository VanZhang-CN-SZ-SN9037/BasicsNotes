//
//  ViewController.m
//  8.3.9 自定义Cell
//
//  Created by VanZhang on 2020/2/21.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import "MYCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation ViewController

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        //取出cell的xib
        UINib *nib = [UINib nibWithNibName:@"MYCollectionViewCell" bundle:nil];
        MYCollectionViewCell *cell = [nib instantiateWithOwner:nil options:nil].lastObject;
        // 根据xib中cell, 设置itemsize的大小
        flowLayout.itemSize = cell.frame.size;
        [_collectionView registerNib:nib forCellWithReuseIdentifier:@"MYCollectionViewCell"];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MYCollectionViewCell" forIndexPath:indexPath];
    cell.photoImageView.image = [UIImage imageNamed:@"99logo"];
    cell.label.text = @"九九学院";
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
