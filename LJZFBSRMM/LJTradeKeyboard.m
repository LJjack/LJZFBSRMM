//
//  LJTradeKeyboard.m
//  LJZFBSRMM
//
//  Created by liujunjie on 15-7-7.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import "LJTradeKeyboard.h"
#import "LJCommit.h"
@interface LJButton : UIButton

@end
@implementation LJButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"trade.bundle/number_bg"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    }
    return self;
}

@end
@implementation LJTradeKeyboard
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:CGRectMake(0, kScreenSize.height*0.55, kKeyboardWidth, kKeyboardHeight)]) {
        [self setBackgroundColor:[UIColor lightGrayColor]];
        [self addMt];
        [self setupAllBtn];
    }
    return self;
}
- (void)addMt {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 4, kScreenSize.width, kScreenSize.height*0.046)];
    [label setTextColor:[UIColor greenColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:@"安全键盘"];
    [self addSubview:label];
}
- (void)setupAllBtn {
    for (NSInteger x = 0; x < 4; x ++) {
        for (NSInteger y = 0; y < 3; y ++) {
            LJButton *button = [LJButton buttonWithType:UIButtonTypeCustom];
            [button setFrame:CGRectMake(kKeyBtnBorder+(kKeyBtnBorder+kKeyBtnWidth)*y, kScreenSize.height*0.05+kKeyBtnBorder+(kKeyBtnBorder+kKeyBtnHeight)*x, kKeyBtnWidth, kKeyBtnHeight)];
            [button setTag:x*3+y+1];
            if (button.tag>9) {
                switch (button.tag) {
                    case 10:
                        [button setTitle:@"隐藏" forState:UIControlStateNormal];
                        break;
                    case 11:
                        [button setTitle:@"0" forState:UIControlStateNormal];
                        break;
                    case 12:
                        [button setTitle:@"删除" forState:UIControlStateNormal];
                        break;
                    default:
                        break;
                }
            }else{
                [button setTitle:[NSString stringWithFormat:@"%d",button.tag] forState:UIControlStateNormal];
            }
            
            [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
    }
}
- (void)click:(LJButton *)sender {
    if ([_delegate respondsToSelector:@selector(tradeKeyboard:event:)]) {
        [_delegate tradeKeyboard:self event:sender.tag];
    }
}
@end
