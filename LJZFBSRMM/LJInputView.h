//
//  LJInputView.h
//  LJZFBSRMM
//
//  Created by liujunjie on 15-7-7.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJInputView : UIView
@property (nonatomic,weak) UIButton *sureBtn;
@property (nonatomic,weak) UIButton *cancelBtn;
@property (nonatomic,weak) UIImageView *borderIV;
- (void)addYuan;
- (void)removeYuan;
@end
