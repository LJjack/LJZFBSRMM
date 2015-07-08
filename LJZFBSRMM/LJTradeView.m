//
//  LJTradeView.m
//  LJZFBSRMM
//
//  Created by liujunjie on 15-7-7.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import "LJTradeView.h"
#import "LJInputView.h"
#import "LJTradeKeyboard.h"
@interface LJTradeView ()<LJTradeKeyboardDelegate,UIAlertViewDelegate>
{
    NSInteger _num;
}
@property (nonatomic,weak) LJInputView *inputView;
@property (nonatomic,weak) LJTradeKeyboard *keyboard;
@property (nonatomic,weak) UILabel *sucessLabel;
@property (nonatomic,copy) NSMutableArray *pwd;

@end
@implementation LJTradeView
- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        _pwd = [NSMutableArray array];
        // 1.添加蒙板
        [self addMaskView];
        // 2.添加输入view
        [self addInputView];
        //3.添加键盘
        [self addKeyboard];
    }
    return  self;
}
// 添加蒙板
- (void)addMaskView {
    UIView *maskView = [[UIView alloc] initWithFrame:self.bounds];
    [maskView setBackgroundColor:[UIColor blackColor]];
    [maskView setAlpha:0.4];
    [self addSubview:maskView];
}
// 添加输入view
- (void)addInputView {
    LJInputView *inputView = [[LJInputView alloc] initWithFrame:
                              CGRectMake(10, 74, self.bounds.size.width - 20, self.bounds.size.width * 0.55)];
    [inputView.sureBtn addTarget:self action:@selector(clickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
    [inputView.cancelBtn addTarget:self action:@selector(clickCancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:inputView];
    _inputView = inputView;
}
- (void)clickSureBtn:(UIButton *) sender{
    [sender setEnabled:NO];
     NSLog(@"%@",_pwd);
    UILabel *sucessLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    [sucessLabel setCenter:self.center];
    [sucessLabel setText:@"支付成功"];
    [sucessLabel setTextAlignment:NSTextAlignmentCenter];
    [sucessLabel setBackgroundColor:[UIColor blackColor]];
    [sucessLabel setTextColor:[UIColor whiteColor]];
    [self.superview addSubview:sucessLabel];
    _sucessLabel = sucessLabel;
   [NSTimer scheduledTimerWithTimeInterval:1.2f target:self selector:@selector(removeFromSuperViewWithSucessView:) userInfo:nil repeats:NO];
    [self removeFromSuperview];
}
- (void)removeFromSuperViewWithSucessView:(NSTimer *)timer {
    [_sucessLabel removeFromSuperview];
    [timer invalidate];
    timer = nil;
    NSLog(@"===");
}
- (void)clickCancelBtn {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"支付" message:@"是否取消支付" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}
#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self removeFromSuperview];
    }
    
}
//键盘
- (void)addKeyboard {
    LJTradeKeyboard *keyboard = [[LJTradeKeyboard alloc] init];
    [keyboard setTransform:CGAffineTransformMakeTranslation(0, keyboard.frame.size.height)];
    [keyboard setDelegate:self];
    [self addSubview:keyboard];
    _keyboard = keyboard;
}
- (void)tradeKeyboard:(LJTradeKeyboard *)tradeKeyboard event:(NSInteger)tag
{
    if (tag == 10) {
        
    }else if(tag == 12) {
        [_inputView removeYuan];
        if (_num <= 0) return;
        _num --;
        [_pwd removeObjectAtIndex:_num];
        
    }else {
        [_inputView addYuan];
        if (_num >= 6) return;
        [_pwd insertObject:[NSString stringWithFormat:@"%d",tag] atIndex:_num];
        _num ++;
    }
}
- (void)show {
    [UIView animateWithDuration:0.3 animations:^{
        [_keyboard setTransform:CGAffineTransformIdentity];
        [_inputView setTransform:CGAffineTransformMakeTranslation(0, -30.0f)];
    }];
}
@end
