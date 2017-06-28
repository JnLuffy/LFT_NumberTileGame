//
//  F3HGameModel.m
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/28.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import "F3HGameModel.h"

@interface F3HGameModel()
@property (nonatomic, weak) id<F3HGameModelProtocol> delegate;

@property (nonatomic, strong) NSMutableArray *gameState;

@property (nonatomic) NSUInteger dimension;
@property (nonatomic) NSUInteger winValue;

@property (nonatomic, strong) NSMutableArray *commandQueue;
@property (nonatomic, strong) NSTimer *queueTimer;

@property (nonatomic, readwrite) NSInteger score;

@end


@implementation F3HGameModel
+ (instancetype)gameModelWithDimension:(NSUInteger)dimension
                              winValue:(NSUInteger)value
                              delegate:(id<F3HGameModelProtocol>)delegate {
    F3HGameModel *model = [F3HGameModel new];
    model.dimension = dimension;
    model.winValue = value;
    model.delegate = delegate;
    [model reset];
    return model;
}

- (void)reset {
    self.score = 0;
    self.gameState = nil;
    [self.commandQueue removeAllObjects];
    [self.queueTimer invalidate];
    self.queueTimer = nil;
}

#pragma mark - Insertion API
- (void)insertAtRandomLocationTileWithValue:(NSUInteger)value {
    //Check the gameboard is full
    BOOL emptySpotFound = NO;
//    for (NSInteger i=0; i<[self.gameState count]; i++) {
//        if (((F3HTileModel *) self.gameState[i]).empty) {
//            emptySpotFound = YES;
//            break;
//        }
//    }
}

@end
