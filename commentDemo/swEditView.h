//
//  swEditView.h
//  commentDemo
//
//  Created by 粟黄 on 29/5/18.
//  Copyright © 2018年 LongShengWen. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol swEditViewDelegate <NSObject>
@optional

- (void)touchEndEditView;

@end
@interface swEditView : UIView

@property(nonatomic,weak) id<swEditViewDelegate> callbackDelegate;

@end
