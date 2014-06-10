//
//  MusicViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-31.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "MusicViewController.h"

@interface MusicViewController ()

@end

@implementation MusicViewController
@synthesize imageView;
@synthesize play;
@synthesize pause;
@synthesize toolbar;
@synthesize song;
@synthesize artist;
@synthesize status;

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    NSLog(@"%s", __func__);
    [super viewDidLoad];
    
    [self initUI];

    self.player = [MPMusicPlayerController iPodMusicPlayer];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self
                           selector:@selector(nowPlayingItemChanged:)
                               name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification object:self.player];
    
    [self.player beginGeneratingPlaybackNotifications];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Custom Action
- (void) initUI
{
    UIBarButtonItem *addBtnItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(addPressed:)];
    self.navigationItem.rightBarButtonItem = addBtnItem;
    
    imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(0, 64, 320, 320);
    [self.view addSubview:imageView];
    
    toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 384, 320, 44)];
    [self.view addSubview:toolbar];
    
    
    UIBarButtonItem *fixRewindItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                  target:nil
                                                                                  action:nil];
    fixRewindItem.width = 55;
    
    UIBarButtonItem *rewindItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind
                                                                               target:self
                                                                               action:@selector(rewindPressed:)];
    
    UIBarButtonItem *fixPlayItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:nil
                                                                               action:nil];
    fixPlayItem.width = 55;
    
    UIBarButtonItem *playItem   = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay
                                                                               target:self
                                                                               action:@selector(playPausePressed:)];
    
    UIBarButtonItem *fixFastItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                 target:nil
                                                                                 action:nil];
    fixFastItem.width = 55;
    
    UIBarButtonItem *pauseItem  = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPause
                                                                              target:self
                                                                              action:@selector(playPausePressed:)];
    UIBarButtonItem *fastItem   = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                                                                               target:self
                                                                               action:@selector(fastForwardPressed:)];
    NSArray *toolItems = [NSArray arrayWithObjects:fixRewindItem,rewindItem,fixPlayItem,playItem,fixFastItem,fastItem,nil];
    [toolbar setItems:toolItems];
    
    song = [[UILabel alloc]init];
    song.backgroundColor = [UIColor clearColor];
    song.frame = CGRectMake(0, 418, 320, 24);
    [self.view addSubview:song];
    
    artist = [[UILabel alloc]init];
    artist.backgroundColor = [UIColor clearColor];
    artist.frame = CGRectMake(0, 442, 320, 24);
    [self.view addSubview:artist];
    
    status = [[UILabel alloc]init];
    status.backgroundColor = [UIColor clearColor];
    status.frame = CGRectMake(139, 33, 42, 21);
    [self.view addSubview:status];
    
//    UIButton *rewindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rewindBtn setImage:[UIImage imageNamed:@"rewind.png"] forState:UIControlStateNormal];
//    [rewindBtn addTarget:self
//                  action:@selector(rewindPressed:)
//        forControlEvents:UIControlEventTouchUpInside];
//    rewindBtn.frame = CGRectMake(65, 384, 30, 30);
//    [self.view addSubview:rewindBtn];
    
//    pause = [UIButton buttonWithType:UIButtonTypeCustom];
//    [pause setImage:[UIImage imageNamed:@"play.png"]
//          forState:UIControlStateNormal];
//    pause.frame = CGRectMake(145, 384, 30, 30);
//    [pause addTarget:self
//              action:@selector(playPausePressed:)
//    forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:pause];
//    
//    play = [UIButton buttonWithType:UIButtonTypeCustom];
//    [play setImage:[UIImage imageNamed:@"play.png"]
//          forState:UIControlStateNormal];
//    play.frame = CGRectMake(145, 384, 30, 30);
//    [play addTarget:self
//             action:@selector(playPausePressed:)
//   forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:play];
//    
//    UIButton *fastBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [fastBtn setImage:[UIImage imageNamed:@"fast.png"] forState:UIControlStateNormal];
//    [fastBtn addTarget:self action:@selector(fastForwardPressed:) forControlEvents:UIControlEventTouchUpInside];
//    fastBtn.frame = CGRectMake(225, 384, 30, 30);
//    [self.view addSubview:fastBtn];
}

#pragma mark - 
#pragma mark - Clicked Action
- (IBAction)rewindPressed:(id)sender {
    if ([self.player indexOfNowPlayingItem] == 0) {
        [self.player skipToBeginning];
    } else {
        [self.player endSeeking];
        [self.player skipToPreviousItem];
    }
}

- (IBAction)playPausePressed:(id)sender {
    [self.pause setTintColor:[UIColor blackColor]];
    MPMusicPlaybackState playbackState = [self.player playbackState];
    NSMutableArray *items = [NSMutableArray arrayWithArray:[self.toolbar items]];
    if (playbackState == MPMusicPlaybackStateStopped || playbackState == MPMusicPlaybackStatePaused) {
        [self.player play];
        [items replaceObjectAtIndex:3 withObject:self.pause];
    } else if (playbackState == MPMusicPlaybackStatePlaying) {
        [self.player pause];
        [items replaceObjectAtIndex:3 withObject:self.play];
    }
    [self.toolbar setItems:items animated:NO];
}

- (IBAction)fastForwardPressed:(id)sender {
    NSUInteger nowPlayingIndex = [self.player indexOfNowPlayingItem];
    [self.player endSeeking];
    [self.player skipToNextItem];
    if ([self.player nowPlayingItem] == nil) {
        if ([self.collection count] > nowPlayingIndex+1) {
            // added more songs while playing
            [self.player setQueueWithItemCollection:self.collection];
            MPMediaItem *item = [[self.collection items] objectAtIndex:nowPlayingIndex+1];
            [self.player setNowPlayingItem:item];
            [self.player play];
        }
        else {
            // no more songs
            [self.player stop];
            NSMutableArray *items = [NSMutableArray arrayWithArray:[self.toolbar items]];
            [items replaceObjectAtIndex:3 withObject:self.play];
            [self.toolbar setItems:items];
        }
    }
}

- (IBAction)addPressed:(id)sender {
    MPMediaType mediaType = MPMediaTypeMusic;
    MPMediaPickerController *picker = [[MPMediaPickerController alloc] initWithMediaTypes:mediaType];
    picker.delegate = self;
    [picker setAllowsPickingMultipleItems:YES];
    picker.prompt = NSLocalizedString(@"Select items to play", @"Select items to play");
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - Media Picker Delegate Methods

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {NSLog(@"%s", __func__);
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
    
    if (self.collection == nil) {
        self.collection = mediaItemCollection;
        [self.player setQueueWithItemCollection:self.collection];
        MPMediaItem *item = [[self.collection items] objectAtIndex:0];
        [self.player setNowPlayingItem:item];
        [self playPausePressed:self];
    } else {
        NSArray *oldItems = [self.collection items];
        NSArray *newItems = [oldItems arrayByAddingObjectsFromArray:[mediaItemCollection items]];
        self.collection = [[MPMediaItemCollection alloc] initWithItems:newItems];
    }
}

- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark - Notification Methods
- (void)nowPlayingItemChanged:(NSNotification *)notification
{
	MPMediaItem *currentItem = [self.player nowPlayingItem];
    if (nil == currentItem) {
        [self.imageView setImage:nil];
        [self.imageView setHidden:YES];
        [self.artist setText:nil];
        [self.song setText:nil];
    }
    else {
        MPMediaItemArtwork *artwork = [currentItem valueForProperty: MPMediaItemPropertyArtwork];
        if (artwork) {
            UIImage *artworkImage = [artwork imageWithSize:CGSizeMake(320, 320)];
            [self.imageView setImage:artworkImage];
            [self.imageView setHidden:NO];
        }
        
        // Display the artist and song name for the now-playing media item
        NSString *artistStr = [currentItem valueForProperty:MPMediaItemPropertyArtist];
        NSString *albumStr = [currentItem valueForProperty:MPMediaItemPropertyAlbumTitle];
        [self.artist setText:[NSString stringWithFormat:@"%@ — %@", artistStr,albumStr]];
        [self.song setText:[currentItem valueForProperty:MPMediaItemPropertyTitle]];
    }
}

@end
