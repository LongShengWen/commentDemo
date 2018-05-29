//
//  swHeaderView.h
//  commentDemo
//
//  Created by 粟黄 on 24/5/18.
//  Copyright © 2018年 LongShengWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "swCommentModel.h"

@protocol headerDelegate <NSObject>

@optional

- (void)touchOpenComment:(swCommentModel *)model;
- (void)touchReplyComment:(swCommentModel *)model;

@end

@interface swHeaderView : UITableViewHeaderFooterView

@property(nonatomic,weak) id<headerDelegate>callBackDelegate;

@property(nonatomic,strong) swCommentModel *baseModel;

- (void)setModel:(swCommentModel *)model;
@end
