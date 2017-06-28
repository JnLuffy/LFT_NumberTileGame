//
//  F3HTileModel.h
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/28.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface F3HTileModel : NSObject
@property (nonatomic) BOOL empty;
@property (nonatomic) NSUInteger value;
+ (instancetype)emptyTile;
@end
