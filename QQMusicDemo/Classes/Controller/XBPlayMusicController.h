//
//  XBPlayMusicController.h
//  QQMusicDemo
//
//  Created by mac on 16/1/4.
//  Copyright © 2016年 zhouxubin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XBMusic, XBPlayMusicController;

@protocol XBPlayMusicControllerDelegate <NSObject>

@optional
- (XBMusic *)playMusicController:(XBPlayMusicController *)playMusicVC previousIndexWithcurrentIndex:(NSInteger)currentIndex;
- (XBMusic *)playMusicController:(XBPlayMusicController *)playMusicVC nextIndexWithcurrentIndex:(NSInteger)currentIndex;

@end
@interface XBPlayMusicController : UIViewController

@property (nonatomic, strong) XBMusic *music;
@property (nonatomic, weak) id <XBPlayMusicControllerDelegate> delegate;
@property (nonatomic, assign) NSInteger currentIndex;
/**
 *  显示view
 */
- (void)show;

@end
