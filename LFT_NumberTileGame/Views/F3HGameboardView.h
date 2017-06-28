//
//  F3HGameboardView.h
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/27.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface F3HGameboardView : UIView
+(instancetype)gameboardWithDimension:(NSUInteger)dimension cellWidth:(CGFloat)width cellPadding:(CGFloat)padding cornerRadius:(CGFloat)cornerRadius backGroundColor:(UIColor *)backgroudCorlor foregroundCorlor:(UIColor *)foregroundColor;

-(void)reset;

-(void)insertTileAtIndexPath:(NSIndexPath *)path withValue:(NSUInteger)value;

-(void)moveTileOne:(NSIndexPath *)startA tileTwo:(NSIndexPath *)startB toIndexPath:(NSIndexPath *)end  withValue:(NSUInteger) value;

- (void)moveTileAtIndexPath:(NSIndexPath *)start toIndexPath:(NSIndexPath *)end withValue:(NSUInteger)value;

@end
