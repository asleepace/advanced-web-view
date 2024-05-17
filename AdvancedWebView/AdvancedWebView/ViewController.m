//
//  ViewController.m
//  AdvancedWebView
//
//  Created by Colin Teahan on 5/15/24.
//

#import "ViewController.h"
#import <AVFAudio/AVFAudio.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "WebView.h"

@interface ViewController () <WKUIDelegate, WKNavigationDelegate, AVAudioPlayerDelegate>
{
    NSTimer *jsRunLoop;
}

@property (strong, nonatomic) AVAudioSession *session;
@property (strong, nonatomic) AVAudioPlayer *player;

@end

@implementation ViewController

@synthesize webView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *error = nil;
    
    self.session = [AVAudioSession sharedInstance];
    // [self.session setCategory:AVAudioSessionCategoryPlayback error:&error];
    [self.session
     setCategory:AVAudioSessionCategoryPlayback
     withOptions:AVAudioSessionCategoryOptionMixWithOthers|AVAudioSessionCategoryOptionAllowAirPlay
          error:&error];
    
    NSError *activationError = nil;
    [self.session setActive: YES error: &activationError];
    NSLog(@"[ViewController] playback error: %@", error.description);
    NSLog(@"[ViewController] activation error: %@", activationError.description);
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self playInBackground];
    NSLog(@"[vc] viewWillDisappear!");
}

//- (void)playAudio:(NSString *)audioFile {
//    NSURL *url = [NSURL URLWithString:audioFile];
//    NSData *audioData = [NSData dataWithContentsOfURL:url];
//    
//    NSLog(@"[audio] loaded audio data: %ld", [audioData length]);
//    
//    NSError *error = nil;
//    // self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
//    
//    self.player = [[AVAudioPlayer alloc] initWithData:audioData error:&error];
//    if (error) NSLog(@"[audio] error: %@", error.localizedDescription);
//    
//    self.player.numberOfLoops = -1;
//    [self.player setDelegate:self];
//    [self.player setVolume:100.0];
//    [self.player play];
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initializeWebView];
    NSLog(@"[ViewController] viewWillAppear!");
    // [self navigateTo:@"https://www.youtube.com/watch?v=PiIQlwGVxxA"];
    // [self navigateTo:@"https://twitter.com/i/status/1790732405415776365"];
    // [self navigateTo:@"https://padlet.com/starkindustries/my-fierce-padlet-hlfos2yon4l5s4jy"];
    [self navigateTo:@"https://d.dlabs.me/test/mp3-player.html"];
    // [self playAudio:@"https://d.dlabs.me/test/come_around.mp4"];
}

- (void)navigateTo:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request.copy];
}

- (void)initializeWebView {
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    
    // Below iOS 9.0 use config.mediaPlaybackRequiresUserAction
    config.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypeNone;
    config.processPool = [[WKProcessPool alloc] init];
    config.allowsPictureInPictureMediaPlayback = true;
    config.suppressesIncrementalRendering = false;
    config.allowsAirPlayForMediaPlayback = true;
    config.allowsInlineMediaPlayback = true;
    config.preferences = [self preferences];
    config.defaultWebpagePreferences = [self webpagePreferences];
    
    typeof(self) __weak weakSelf = self;

    self.webView = [[WebView alloc] initWithFrame:CGRectZero configuration:config];
    self.webView.allowsLinkPreview = true;
    
    [self.webView setNavigationDelegate:weakSelf];
    [self.webView setUIDelegate:weakSelf];

    [self.webView setInspectable:true];
    [self.view addSubview:self.webView];
    
    // jsRunLoop = [NSTimer timerWithTimeInterval:0.2 target:self selector:@selector(playInBackground) userInfo:nil repeats:true];
    // [[NSRunLoop currentRunLoop] addTimer:jsRunLoop forMode:NSRunLoopCommonModes];
}

- (void)playInBackground {
    NSLog(@"[vc] playInBackground!");
    [self.webView evaluateJavaScript:@"document.getElementsByTagName('video')[0].play();" completionHandler:^(id value, NSError *error) {
        if (error) NSLog(@"[js] error: %@", error.localizedDescription);
        if (value) NSLog(@"[js] play: %@", value);
    }];
}

- (WKWebpagePreferences *)webpagePreferences {
    WKWebpagePreferences *webpagePrefs = [[WKWebpagePreferences alloc] init];
    webpagePrefs.preferredContentMode = WKContentModeDesktop;
    webpagePrefs.allowsContentJavaScript = true;
    return webpagePrefs;
}

- (WKPreferences *)preferences {
    WKPreferences *preferences = [[WKPreferences alloc] init];
    preferences.inactiveSchedulingPolicy = WKInactiveSchedulingPolicyNone;
    return preferences;
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction preferences:(WKWebpagePreferences *)preferences decisionHandler:(void (^)(WKNavigationActionPolicy, WKWebpagePreferences * _Nonnull))decisionHandler {
    NSLog(@"decide policy for: %@", navigationAction.debugDescription);
    decisionHandler(WKNavigationActionPolicyAllow, preferences);
}

@end
