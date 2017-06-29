//
//  F3HQueueCommand.h
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/29.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "F3HGameModel.h"

@interface F3HQueueCommand : NSObject
@property (nonatomic) F3HMoveDirection direction;
@property (nonatomic, copy) void(^completion)(BOOL atLeastOneMove);

+ (instancetype)commandWithDirection:(F3HMoveDirection)direction completionBlock:(void(^)(BOOL))completion;
@end
