//
//  LJInputView.m
//  LJZFBSRMM
//
//  Created by liujunjie on 15-7-7.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import "LJInputView.h"
@interface LJInputView ()
{
    NSInteger _num;
}
@end
@implementation LJInputView
- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _num = 10;
        [self setBackgroundColor:[UIColor clearColor]];
        UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.bounds];
        [bgView setImage:[UIImage imageNamed:@"trade.bundle/number_bg"]];
        [self addSubview:bgView];
        //1.添加分割线
        [self addDividingLine];
        //2.添加文字提醒
        [self addReminderText];
        
        //3.添加输入边框（图片）
        [self addBorderImageView];
        //4.添加取消和确定按钮
        [self addCancelAndSureButton];
    }
    return self;
}
//1.添加分割线
- (void)addDividingLine {
    UIImageView *dividingLineIV = [[UIImageView alloc] initWithFrame:self.bounds];
    [dividingLineIV setImage:[UIImage imageNamed:@"trade.bundle/pssword_bg"]];
    [self addSubview:dividingLineIV];
}
//2.添加文字提醒
- (void)addReminderText {
    UILabel *reminderTextLabel = [[UILabel alloc] initWithFrame:
                                  CGRectMake(5, 0, self.bounds.size.width, 30)];
    [reminderTextLabel setText:@"请输入密码"];
    [reminderTextLabel setTextColor:[UIColor blackColor]];
    [reminderTextLabel setTextAlignment:NSTextAlignmentCenter];
    [reminderTextLabel setFont:[UIFont systemFontOfSize:20.0f]];
    [self addSubview:reminderTextLabel];
}

//3.添加输入边框（图片）
- (void)addBorderImageView {
    UIImageView *borderIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trade.bundle/password_in"]];
    [borderIV setCenter:CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)-5)];
    [self addSubview:borderIV];
    self.borderIV = borderIV;
}
//4.添加取消和确定按钮
- (void)addCancelAndSureButton {
    CGFloat btnWidth = self.bounds.size.width*0.38;
    CGFloat btnHeigth = btnWidth*0.5;
    CGFloat bm = CGRectGetMaxY(self.bounds)- btnHeigth*1.02;
    CGFloat btnBorder = self.bounds.size.width*0.02;
    //1.取消按钮
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setImage:[UIImage imageNamed:@"trade.bundle/password_cancel_up"] forState:UIControlStateNormal];
    [cancelBtn setImage:[UIImage imageNamed:@"trade.bundle/password_cancel_down"] forState:UIControlStateHighlighted];
    [cancelBtn setFrame:CGRectMake(btnBorder, bm, btnWidth, btnHeigth)];
    [self addSubview:cancelBtn];
    self.cancelBtn = cancelBtn;
    // 2.确定按钮
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn setImage:[UIImage imageNamed:@"trade.bundle/password_ok_up"] forState:UIControlStateNormal];
    [sureBtn setImage:[UIImage imageNamed:@"trade.bundle/password_ok_down"] forState:UIControlStateHighlighted];
    
    [sureBtn setFrame:CGRectMake(self.bounds.size.width-btnWidth-btnBorder,bm , btnWidth, btnHeigth)];
    [sureBtn setEnabled:NO];
    [self addSubview:sureBtn];
    self.sureBtn = sureBtn;
}
- (void)addYuan {
    if (_num >= 16) return;
    _num ++;
    CGFloat ivwidth = CGRectGetWidth(self.borderIV.frame)/12.0;

    CGFloat  x =  ivwidth +ivwidth*2*(_num-11);
    UIImageView *yuan = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
    [yuan setCenter:CGPointMake(x, CGRectGetHeight(self.borderIV.frame)*0.5)];
    [yuan setImage:[UIImage imageNamed:@"trade.bundle/yuan"]];
    [yuan setTag:_num];
    [self.borderIV addSubview:yuan];
    if (16 == _num) {
        [self.sureBtn setEnabled:YES];
    }
}
- (void)removeYuan {
    if (_num <=10) return;
    
    UIImageView *yuan = (UIImageView *)[self.borderIV viewWithTag:_num];
    [yuan removeFromSuperview];
    [self.sureBtn setEnabled:NO];
    _num --;
    
}

@end
