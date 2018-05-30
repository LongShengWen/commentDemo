//
//  swCommentModel.m
//  commentDemo
//
//  Created by 粟黄 on 24/5/18.
//  Copyright © 2018年 LongShengWen. All rights reserved.
//

#import "swCommentModel.h"

@implementation swCommentModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.subCommentArray = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)buildCommentModel:(NSDictionary *)dic
{
    self.userName = @"尼古拉斯 赵四";
    self.comment = @"除了帅一无是处";
    self.isOpen = NO;
    for (int i = 0; i < 4; i ++) {
        swCommentModel *subModel = [[swCommentModel alloc]init];
        subModel.userName = @"赵四";
        subModel.toUserName = @"张全蛋";
        subModel.comment = @"好吧";
        
        [self.subCommentArray addObject:subModel];
    }
}
@end
