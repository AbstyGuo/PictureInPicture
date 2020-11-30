//
//  ViewController.m
//  PictureInPicture
//
//  Created by guoyf on 2020/11/30.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *startBtn;

@property (weak, nonatomic) IBOutlet UIButton *endBtn;

@property(nonatomic,strong) AVPlayer * player;

@property (weak, nonatomic) IBOutlet UIView *playerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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

    
    [self.player play];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setUpPlayer];
}

- (IBAction)startClick:(id)sender {
}
- (IBAction)endClick:(id)sender {
}

@end
