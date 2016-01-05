//
//  XBMusic.h
//  QQMusicDemo
//
//  Created by mac on 16/1/4.
//  Copyright © 2016年 zhouxubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBMusic : NSObject
/*
 <key>name</key>
 <string>月半小夜曲</string>
 <key>filename</key>
 <string>1201111234.mp3</string>
 <key>lrcname</key>
 <string>月半小夜曲.lrc</string>
 <key>singer</key>
 <string>李克勤</string>
 <key>singerIcon</key>
 <string>lkq_icon.jpg</string>
 <key>icon</key>
 <string>lkq.jpg</string>
 */
/**
*  歌曲名字
*/
@property (nonatomic, copy) NSString *name;
/**
 *  歌曲文件名
 */
@property (nonatomic, copy) NSString *filename;
/**
 *  歌词文件名
 */
@property (nonatomic, copy) NSString *lrcname;
/**
 *  歌手名字
 */
@property (nonatomic, copy) NSString *singer;
/**
 *  小图
 */
@property (nonatomic, copy) NSString *singerIcon;
/**
 *  大图
 */
@property (nonatomic, copy) NSString *icon;

@end
