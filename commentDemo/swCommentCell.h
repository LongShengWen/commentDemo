//
//  swCommentCell.h
//  commentDemo
//
//  Created by 粟黄 on 24/5/18.
//  Copyright © 2018年 LongShengWen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "swCommentModel.h"

@interface swCommentCell : UITableViewCell

@property(nonatomic,strong) swCommentModel *baseModel;

- (void)setDataModel:(swCommentModel *)commentModel;

@end
