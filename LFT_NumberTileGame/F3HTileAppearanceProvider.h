//
//  F3HTileAppearanceProvider.h
//  LFT_NumberTileGame
//
//  Created by Dareway on 2017/6/28.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol F3HTileAppearanceProviderProtocol <NSObject>

- (UIColor *)tileColorForValue:(NSUInteger)value;

- (UIColor *)numberColorForValue:(NSUInteger)value;

- (UIFont *)fontForNumbers;

@end

@interface F3HTileAppearanceProvider : NSObject<F3HTileAppearanceProviderProtocol>

@end
