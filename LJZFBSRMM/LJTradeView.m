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
@interface LJTradeView ()<LJTradeKeyboardDelegate>
@property (nonatomic,weak) LJInputView *inputView;
@end
@implementation LJTradeView
- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
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
 
    
    [self addSubview:inputView];
    _inputView = inputView;
}
//键盘
- (void)addKeyboard {
    LJTradeKeyboard *keyboard = [[LJTradeKeyboard alloc] init];
    [keyboard setDelegate:self];
    [self addSubview:keyboard];
}
- (void)tradeKeyboard:(LJTradeKeyboard *)tradeKeyboard event:(NSInteger)tag
{
    if (tag == 10) {
        
    }else if(tag == 12) {
        [_inputView removeYuan];
    }else {
        [_inputView addYuan];
    }
}
@end
