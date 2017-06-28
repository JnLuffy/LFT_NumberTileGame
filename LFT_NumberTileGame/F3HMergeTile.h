//
//  F3HMergeTile.h
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/28.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    F3HMergeTileModeEmpty = 0,
    F3HMergeTileModeNoAction,
    F3HMergeTileModeMove,
    F3HMergeTileModeSingleCombine,
    F3HMergeTileModeDoubleCombine
} F3HMergeTileMode;

@interface F3HMergeTile : NSObject

@property (nonatomic) F3HMergeTileMode model;
@property (nonatomic) NSInteger originalIndexA;
@property (nonatomic) NSInteger originalIndexB;
@property (nonatomic) NSInteger value;

+ (instancetype)mergeTile;

@end
