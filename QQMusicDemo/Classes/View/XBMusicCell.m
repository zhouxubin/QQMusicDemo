//
//  XBMusicCell.m
//  QQMusicDemo
//
//  Created by mac on 16/1/4.
//  Copyright © 2016年 zhouxubin. All rights reserved.
//

#import "XBMusicCell.h"

const CGFloat layerCornerRadius = 24;

@interface XBMusicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *musicName;
@property (weak, nonatomic) IBOutlet UILabel *singerName;

@end

@implementation XBMusicCell

#pragma mark - 重写setter方法给属性赋值
- (void)setMusic:(XBMusic *)music {
    _music = music;
    
    self.iconView.image = [UIImage imageNamed:music.singerIcon];
    self.musicName.text = music.name;
    self.singerName.text = music.singer;
}

- (void)awakeFromNib {
    // Initialization code
    // 设置头像的边框
    self.iconView.layer.cornerRadius = layerCornerRadius;
    self.iconView.layer.masksToBounds = YES;
    self.iconView.layer.borderWidth = 3;
    self.iconView.layer.borderColor = [UIColor blueColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
