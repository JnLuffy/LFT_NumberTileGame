//
//  F3HGameModel.m
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/28.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import "F3HGameModel.h"
#import "F3HTileModel.h"
#import "F3HQueueCommand.h"

// Command queue
#define MAX_COMMANDS      100
#define QUEUE_DELAY       0.3

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
    // Check if gameboard is full
    BOOL emptySpotFound = NO;
    for (NSInteger i=0; i<[self.gameState count]; i++) {
        if (((F3HTileModel *) self.gameState[i]).empty) {
            emptySpotFound = YES;
            break;
        }
    }
    if (!emptySpotFound) {
        // Board is full, we will never be able to insert a tile
        return;
    }
    // Yes, this could run forever. Given the size of any practical gameboard, I don't think it's likely.
    NSInteger row = 0;
    BOOL shouldExit = NO;
    while (YES) {
        row = arc4random_uniform((uint32_t)self.dimension);
        // Check if row has any empty spots in column
        for (NSInteger i=0; i<self.dimension; i++) {
            if ([self tileForIndexPath:[NSIndexPath indexPathForRow:row inSection:i]].empty) {
                shouldExit = YES;
                break;
            }
        }
        if (shouldExit) {
            break;
        }
    }
    NSInteger column = 0;
    shouldExit = NO;
    while (YES) {
        column = arc4random_uniform((uint32_t)self.dimension);
        if ([self tileForIndexPath:[NSIndexPath indexPathForRow:row inSection:column]].empty) {
            shouldExit = YES;
            break;
        }
        if (shouldExit) {
            break;
        }
    }
    [self insertTileWithValue:value atIndexPath:[NSIndexPath indexPathForRow:row inSection:column]];
    NSLog(@"insertTitlWithValue  = %lu  row=%li  column = %li",(unsigned long)value,(long)row,(long)column);
}


// Insert a tile (used by the game to add new tiles to the board)
- (void)insertTileWithValue:(NSUInteger)value
                atIndexPath:(NSIndexPath *)path {
    if (![self tileForIndexPath:path].empty) {
        return;
    }
    F3HTileModel *tile = [self tileForIndexPath:path];
    tile.empty = NO;
    tile.value = value;
    [self.delegate insertTileAtIndexPath:path value:value];
}

#pragma mark - Movement API
// Perform a user-initiated move in one of four directions
- (void)performMoveInDirection:(F3HMoveDirection)direction
               completionBlock:(void(^)(BOOL))completion {
    [self queueCommand:[F3HQueueCommand commandWithDirection:direction completionBlock:completion]];
}

- (BOOL)performUpMove {
    return YES;
}

- (BOOL)performDownMove {
    return YES;
}


- (BOOL)performLeftMove {
    return YES;
}

- (BOOL)performRightMove {
    return YES;
}


#pragma mark - Private Methods
- (void)queueCommand:(F3HQueueCommand *)command {
    if (!command || [self.commandQueue count] > MAX_COMMANDS) return;
    
    [self.commandQueue addObject:command];
    if (!self.queueTimer || ![self.queueTimer isValid]) {
        // Timer isn't running, so fire the event immediately.
        [self timerFired:nil];
    }
}


- (void)timerFired:(NSTimer *)timer {
    if ([self.commandQueue count] == 0) return;
    
    BOOL changed = NO;
    while ([self.commandQueue count] > 0) {
        F3HQueueCommand *command = [self.commandQueue firstObject];
        [self.commandQueue removeObjectAtIndex:0];
        switch (command.direction) {
            case F3HMoveDirectionUp:
                changed = [self performUpMove];
                break;
            case F3HMoveDirectionDown:
                changed = [self performDownMove];
                break;
            case F3HMoveDirectionLeft:
                changed = [self performLeftMove];
                break;
            case F3HMoveDirectionRight:
                changed = [self performRightMove];
                break;
        }
        if (command.completion) {
            command.completion(changed);
        }
        if (changed) {
            // This allows us to immediately remove 'useless' commands without gumming up the queue
            break;
        }
    }
    
    // Schedule the timer, so new moves aren't run immediately
    self.queueTimer = [NSTimer scheduledTimerWithTimeInterval:QUEUE_DELAY
                                                       target:self
                                                     selector:@selector(timerFired:)
                                                     userInfo:nil
                                                      repeats:NO];
}


- (F3HTileModel *)tileForIndexPath:(NSIndexPath *)indexPath {
    NSInteger idx = (indexPath.row*self.dimension + indexPath.section);
    if (idx >= [self.gameState count]) {
        return nil;
    }
    return self.gameState[idx];
    
}


@end
