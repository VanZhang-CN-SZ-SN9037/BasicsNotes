//
//  MYView.m
//  7.2.9
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "MYView.h"
@interface MYView()
@property (nonatomic, strong) UIView *subView;
@end
@implementation MYView

- (instancetype)initWithFrame:(CGRect)frame
{
    NSLog(@"%s",__func__);
    self = [super initWithFrame:frame];
    if (self) {
        //定制View
        self.backgroundColor = [UIColor blueColor];
        self.alpha = 0.5;
        self.userInteractionEnabled = YES; //设置为NO后，不再响应touch方法
        self.multipleTouchEnabled = YES;
        //控制子视图不能超出父视图的范围
        self.clipsToBounds = YES;
        //添加子视图
        [self subView];
        //添加手势
        UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longpressAction)];
        [self addGestureRecognizer:longpress];
    }
    return self;
}

//子视图懒加载
-(UIView *)subView{
    if (_subView == nil) {
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(0, 0, 50, 50);//超出父视图的范围，无法响应点击事件
        view.backgroundColor = [UIColor redColor];
        [self addSubview:view];
        _subView = view;
    }
    return _subView;
}

-(void)drawRect:(CGRect)rect{
    NSLog(@"%s",__func__);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect    myFrame = self.bounds;
    //添加边框
    CGContextSetLineWidth(context, 10);
    CGRectInset(myFrame, 5, 5);
    [[UIColor greenColor] set];
    UIRectFrame(myFrame);
}

/*配置View点击，作用域在于对象的frame范围内*/
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s 接收到触摸事件",__func__);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s, event: %@",__func__,event);
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"点击了视图" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

-(void)longpressAction {
    NSLog(@"长按了视图");
}
@end
