//
//  F3HTileView.h
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/27.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol F3HTileAppearanceProviderProtocol;

@interface F3HTileView : UIView
@property (nonatomic, weak) id<F3HTileAppearanceProviderProtocol>delegate;

@property (nonatomic) NSInteger tileValue;


+ (instancetype)tileForPositon:(CGPoint)position sideLength:(CGFloat)side value:(NSUInteger) value cornerRadius:(CGFloat) cornerRadius;

@end
