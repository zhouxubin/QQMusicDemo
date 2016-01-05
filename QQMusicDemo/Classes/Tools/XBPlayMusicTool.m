//
//  XBPlayMusicTool.m
//  1-4播放音乐
//
//  Created by mac on 16/1/4.
//  Copyright © 2016年 zhouxubin. All rights reserved.
//

#import "XBPlayMusicTool.h"

@interface XBPlayMusicTool ()
@property (nonatomic, strong) AVAudioPlayer *player;

@end

static NSMutableDictionary *_dictionary;
@implementation XBPlayMusicTool

+ (void)initialize {
    _dictionary = [NSMutableDictionary dictionary];
}

+ (AVAudioPlayer *)playMusicWith:(NSString *)fileName {
    // 先去字典找有没有播放器
    AVAudioPlayer *player = _dictionary[fileName];
    if (player == nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:filePath];
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        _dictionary[fileName] = player;
    }
    // 播放音乐
    [player play];
    return player;
}

+ (void)pauseMusicWith:(NSString *)fileName {
    // 去字典中找播放器
    AVAudioPlayer *player = _dictionary[fileName];
    if (player) {
        [player pause];
    }
}

+ (void)stopMusicWith:(NSString *)fileName {
    // 去字典中找播放器
    AVAudioPlayer *player = _dictionary[fileName];
    if (player) {
        [player stop];
        [_dictionary removeObjectForKey:fileName];
    }
}

@end
