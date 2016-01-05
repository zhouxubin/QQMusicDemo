//
//  XBMusicCell.h
//  QQMusicDemo
//
//  Created by mac on 16/1/4.
//  Copyright © 2016年 zhouxubin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBMusic.h"
@interface XBMusicCell : UITableViewCell

/**
 *  导入模型属性给属性赋值
 */
@property (nonatomic, strong) XBMusic *music;

@end
