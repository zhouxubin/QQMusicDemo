//
//  XBPlayMusicController.m
//  QQMusicDemo
//
//  Created by mac on 16/1/4.
//  Copyright © 2016年 zhouxubin. All rights reserved.
//
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KKeyWindow [UIApplication sharedApplication].keyWindow

#import "XBPlayMusicController.h"
#import "UIView+Frame.h"
#import "XBPlayMusicTool.h"
#import "XBMusic.h"
#import <AVFoundation/AVFoundation.h>
#import "SVProgressHUD.h"

@interface XBPlayMusicController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerName;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation XBPlayMusicController

#pragma mark - 按钮的点击事件
- (IBAction)back {
    KKeyWindow.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.5 animations:^{
        self.view.y = KScreenHeight;
    } completion:^(BOOL finished) {
        KKeyWindow.userInteractionEnabled = YES;
    }];
}

- (IBAction)playOrPause:(UIButton *)sender {
    sender.selected = !sender.selected;
    sender.selected ? [self.player play] : [self.player pause];
}

- (IBAction)previous {
    if ([self.delegate respondsToSelector:@selector(playMusicController:previousIndexWithcurrentIndex:)]) {
        self.music = [self.delegate playMusicController:self previousIndexWithcurrentIndex:self.currentIndex];
        if (self.currentIndex < 0) {
            [SVProgressHUD showInfoWithStatus:@"当前为第一首歌..."];
        }
    }
}

- (IBAction)next {
    if ([self.delegate respondsToSelector:@selector(playMusicController:previousIndexWithcurrentIndex:)]) {
        self.music = [self.delegate playMusicController:self nextIndexWithcurrentIndex:self.currentIndex];
        if (self.currentIndex > 16) {
            [SVProgressHUD showInfoWithStatus:@"当前为最后一首歌..."];
        }
    }
}

- (instancetype)init {

    if (self = [super init]) {
        // 把自己的view放在屏幕的下面
        self.view.frame = CGRectMake(0, KScreenHeight, KScreenWidth, KScreenHeight);
        [KKeyWindow addSubview:self.view];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)show {
    KKeyWindow.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.5 animations:^{
        self.view.y = 0;
    } completion:^(BOOL finished) {
        KKeyWindow.userInteractionEnabled = YES;
    }];
}

#pragma mark - 重写setter方法,设置UI
- (void)setMusic:(XBMusic *)music {
    if (music == nil) return;
    [XBPlayMusicTool stopMusicWith:_music.filename];
    _music = music;
    // 先把原来的给停下
    // 开始播放音乐
    self.player = [XBPlayMusicTool playMusicWith:music.filename];
    self.playButton.selected = self.player.isPlaying;
    self.backgroundImage.image = [UIImage imageNamed:music.icon];
    self.topImageView.image = [UIImage imageNamed:music.icon];
    self.nameLabel.text = music.name;
    self.singerName.text = music.singer;
    self.timeLabel.text = [self convertTimeToString:self.player.duration];
}

- (NSString *)convertTimeToString:(NSTimeInterval)time {
    NSInteger minute = time / 60;
    NSInteger second = (NSInteger)time % 60;
    return [NSString stringWithFormat:@"%02ld:%02ld", minute, second];
}

@end
