//
//  LJTradeKeyboard.h
//  LJZFBSRMM
//
//  Created by liujunjie on 15-7-7.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJTradeKeyboard;
@protocol LJTradeKeyboardDelegate <NSObject>
@required;
- (void)tradeKeyboard:(LJTradeKeyboard *) tradeKeyboard event:(NSInteger) tag;

@end
@interface LJTradeKeyboard : UIView
@property (nonatomic,weak) id<LJTradeKeyboardDelegate> delegate;
@end
