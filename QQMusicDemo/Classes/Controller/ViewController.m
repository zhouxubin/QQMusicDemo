//
//  ViewController.m
//  QQMusicDemo
//
//  Created by mac on 16/1/4.
//  Copyright © 2016年 zhouxubin. All rights reserved.
//

#import "ViewController.h"
#import "XBMusicCell.h"
#import "MJExtension.h"
#import "XBPlayMusicController.h"

@interface ViewController () <XBPlayMusicControllerDelegate>

@property (nonatomic, strong) NSArray *musics;
@property (nonatomic, strong) XBPlayMusicController *playMusicVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.musics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    XBMusicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"music_cell"];
    // 取出模型
    XBMusic *music = self.musics[indexPath.row];
    cell.music = music;
    
    return cell;
}

#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.playMusicVC show];
    // 取出模型
    XBMusic *music = self.musics[indexPath.row];
    self.playMusicVC.music = music;
    self.playMusicVC.currentIndex = indexPath.row;
}

#pragma mark - XBPlayMusicController delegate
- (XBMusic *)playMusicController:(XBPlayMusicController *)playMusicVC nextIndexWithcurrentIndex:(NSInteger)currentIndex {
    if (++currentIndex <= self.musics.count - 1) {
        playMusicVC.currentIndex = currentIndex;
        return self.musics[currentIndex];
    }else {
        return nil;
    }
}

- (XBMusic *)playMusicController:(XBPlayMusicController *)playMusicVC previousIndexWithcurrentIndex:(NSInteger)currentIndex {
    if (--currentIndex >= 0) {
        playMusicVC.currentIndex = currentIndex;
        return self.musics[currentIndex];
    }else {
        return nil;
    }
}

#pragma mark - 懒加载
- (NSArray *)musics {
    if (!_musics) {
        _musics = [XBMusic mj_objectArrayWithFilename:@"Musics.plist"];
    }
    return _musics;
}

- (XBPlayMusicController *)playMusicVC {
    if (!_playMusicVC) {
        _playMusicVC = [[XBPlayMusicController alloc] init];
        _playMusicVC.delegate = self;
    }
    return _playMusicVC;
}

@end
