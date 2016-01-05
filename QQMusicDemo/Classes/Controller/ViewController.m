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

@interface ViewController ()

@property (nonatomic, strong) NSArray *musics;

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

#pragma mark - 懒加载
- (NSArray *)musics {
    if (!_musics) {
        _musics = [XBMusic mj_objectArrayWithFilename:@"Musics.plist"];
    }
    return _musics;
}

@end
