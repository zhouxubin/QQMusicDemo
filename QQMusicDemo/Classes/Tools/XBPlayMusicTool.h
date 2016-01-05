//
//  XBPlayMusicTool.h
//  1-4播放音乐
//
//  Created by mac on 16/1/4.
//  Copyright © 2016年 zhouxubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface XBPlayMusicTool : NSObject

/**
 *  播放音乐
 *
 *  @param fileName 音乐文件名
 */
+ (AVAudioPlayer *)playMusicWith:(NSString *)fileName;

/**
 *  暂停音乐
 *
 *  @param fileName 音乐文件名
 */
+ (void)pauseMusicWith:(NSString *)fileName;

/**
 *  停止音乐
 *
 *  @param fileName 音乐文件名
 */
+ (void)stopMusicWith:(NSString *)fileName;

@end
