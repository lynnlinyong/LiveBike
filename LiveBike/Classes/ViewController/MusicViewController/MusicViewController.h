//
//  MusicViewController.h
//  LiveBike
//
//  Created by Lynn on 14-5-31.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicViewController : UIViewController<MPMediaPickerControllerDelegate>
@property (strong, nonatomic)  UILabel *song;
@property (strong, nonatomic)  UILabel *artist;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIToolbar *toolbar;
@property (strong, nonatomic)  UILabel *status;

@property (strong, nonatomic) UIButton *play;
@property (strong, nonatomic) UIButton *pause;

@property (strong, nonatomic) MPMusicPlayerController *player;
@property (strong, nonatomic) MPMediaItemCollection *collection;

- (IBAction)rewindPressed:(id)sender;
- (IBAction)playPausePressed:(id)sender;
- (IBAction)fastForwardPressed:(id)sender;
- (IBAction)addPressed:(id)sender;

- (void)nowPlayingItemChanged:(NSNotification *)notification;
@end
