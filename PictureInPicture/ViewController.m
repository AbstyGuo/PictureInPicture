//
//  ViewController.m
//  PictureInPicture
//
//  Created by guoyf on 2020/11/30.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>

@interface ViewController ()<AVPictureInPictureControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *startBtn;

@property (weak, nonatomic) IBOutlet UIButton *endBtn;

@property(nonatomic,strong) AVPlayer * player;

@property (weak, nonatomic) IBOutlet UIView *playerView;

@property(nonatomic,strong) AVPictureInPictureController * picController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    // 获取图片
    UIImage * startImage = [AVPictureInPictureController pictureInPictureButtonStartImageCompatibleWithTraitCollection:nil];
    UIImage * endImage = [AVPictureInPictureController pictureInPictureButtonStopImageCompatibleWithTraitCollection:nil];
    
    // 设置图片
    [_startBtn setImage:startImage forState:UIControlStateNormal];
    [_endBtn setImage:endImage forState:UIControlStateNormal];
    
}

- (void)setUpPlayer
{
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"ani01fad87700" ofType:@"mp4"];
    AVPlayerItem * item = [[AVPlayerItem alloc] initWithURL:[NSURL fileURLWithPath:path]];
    
    self.player = [AVPlayer playerWithPlayerItem:item];
    AVPlayerLayer * layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    layer.frame = self.playerView.bounds;
    layer.backgroundColor = [UIColor blueColor].CGColor;
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    [self.playerView.layer addSublayer:layer];

    NSLog(@"---------------%@",NSStringFromCGRect(layer.bounds));

    self.picController = [[AVPictureInPictureController alloc] initWithPlayerLayer:layer];
    self.picController.delegate = self;
    [self.player play];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setUpPlayer];
}

- (IBAction)startClick:(id)sender {
    if (self.picController.isPictureInPicturePossible) {
        [self.picController startPictureInPicture];
    }
    else
    {
        NSLog(@"picture is not possible");
    }
}
- (IBAction)endClick:(id)sender {
    [self.picController stopPictureInPicture];
}


#pragma mark - delegate

- (void)pictureInPictureControllerWillStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController
{
    
}


- (void)pictureInPictureControllerDidStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController
{
    
}


- (void)pictureInPictureController:(AVPictureInPictureController *)pictureInPictureController failedToStartPictureInPictureWithError:(NSError *)error
{
    NSLog(@"%@",error);
}


- (void)pictureInPictureControllerWillStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController
{
    
}
- (void)pictureInPictureControllerDidStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController
{
    
}
- (void)pictureInPictureController:(AVPictureInPictureController *)pictureInPictureController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL restored))completionHandler
{
    
}



@end
