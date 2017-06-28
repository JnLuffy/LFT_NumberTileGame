//
//  F3HGameModel.h
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/28.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    F3HMoveDirectionUp = 0,
    F3HMoveDirectionDown,
    F3HMoveDirectionLeft,
    F3HMoveDirectionRight
} F3HMoveDirection;


@protocol F3HGameModelProtocol

- (void)scoreChanged:(NSUInteger)newScore;

- (void)moveTileFromIndexPath:(NSIndexPath *)fromPath
                  toIndexPath:(NSIndexPath *)toIndexPath
                     newValue:(NSUInteger )value;

- (void)moveTileOne:(NSIndexPath *)startA
            tileTwo:(NSIndexPath *)startB
        toIndexPath:(NSIndexPath *)end
           newValue:(NSUInteger)value;

- (void)insertTileAtIndexPath:(NSIndexPath *)path
                        value:(NSUInteger)value;

@end

@interface F3HGameModel : NSObject
@property (nonatomic, readonly) NSInteger score;

+ (instancetype)gameModelWithDimension:(NSUInteger)dimension
                              winValue:(NSUInteger)value
                              delegate:(id<F3HGameModelProtocol>)delegate;

- (void)reset;

- (void)insertAtRandomLocationTileWithValue:(NSUInteger)value;

- (void)insertTileWithValue:(NSUInteger)value
                atIndexPath:(NSIndexPath *)path;

- (void)performMoveInDirection:(F3HMoveDirection)direction
               completionBlock:(void(^)(BOOL))completion;

- (BOOL)userHasLost;
- (NSIndexPath *)userHasWon;

@end
