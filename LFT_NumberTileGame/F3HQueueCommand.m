//
//  F3HQueueCommand.m
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/29.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import "F3HQueueCommand.h"

@implementation F3HQueueCommand

+ (instancetype)commandWithDirection:(F3HMoveDirection)direction completionBlock:(void(^)(BOOL))completion{
    F3HQueueCommand *command = [[self class] new];
    command.direction = direction;
    command.completion = completion;
    return command;
}

@end
