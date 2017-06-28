//
//  F3HTileModel.m
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/28.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import "F3HTileModel.h"

@implementation F3HTileModel
+ (instancetype)emptyTile {
    F3HTileModel *tile = [[self class] new];
    tile.empty = YES;
    tile.value = 0;
    return tile;
}

- (NSString *)description {
    if (self.empty) {
        return @"Tile (empty)";
    }
    return [NSString stringWithFormat:@"Tile (value: %lu)", (unsigned long)self.value];
}

@end
