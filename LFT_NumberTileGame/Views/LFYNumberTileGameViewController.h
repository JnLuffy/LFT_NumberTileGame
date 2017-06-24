//
//  LFYNumberTileGameViewController.h
//  LFT_NumberTileGame
//
//  Created by apple on 17/6/6.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFYNumberTileGameViewController : UIViewController

/*！
 Return an instance of the number tile game view controller.
 
 \param dimension               how many tiles wide and high the gameboard show be
 \param threshold               the tile value the player must ahieve to win the game (e.g. 2048)
 \param backgroudColor          the backgroud color of the gameborad
 \param soreModuleEnabled       if YES, the score module will be visible
 \param buttonControlsEnabled   if YES, the directional button controls will be visible
 \param swipeControlsEnabled    if YES, the performing swipe  gestrues will advance the game
 */

+(instancetype)numberTileGameWithDimention:(NSUInteger)dimention winThreshold:(NSUInteger)threshold  backgroudColor:(UIColor * )backgroudColor scoreModule:(BOOL) scoreModuleEnabled buttonControls:(BOOL) buttonControlsEnabled swipeControls:(BOOL) swipeControlsEnabled;

@end
