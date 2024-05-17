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
#import <MediaPlayer/MediaPlayer.h>
#import <objc/runtime.h>
#import "Inspector.h"
#import "WebView.h"

@interface ViewController () <WKUIDelegate, WKNavigationDelegate, MPNowPlayingSessionDelegate, AVAudioPlayerDelegate>
{
    NSTimer *jsRunLoop;
    MPNowPlayingSession *mediaPlayerSession;
}

@property (strong, nonatomic) AVAudioSession *session;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) AVAudioEngine *engine;

@end

@implementation ViewController

NSString *JS_PLAY = @"document.getElementsByTagName('video')[0].play();";

@synthesize webView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeWebView];
    
    [Inspector selector:self.webView.superclass];

    NSError *error = nil;
    
    self.session = [AVAudioSession sharedInstance];
    // [self.session setCategory:AVAudioSessionCategoryPlayback error:&error];
    [self.session
     setCategory:AVAudioSessionCategoryPlayback
     withOptions:AVAudioSessionCategoryOptionMixWithOthers|AVAudioSessionCategoryOptionAllowAirPlay
          error:&error];
    
    NSError *activationError = nil;
    [self.session setDelegate:self];
    [self.session setActive: YES error: &activationError];
    NSLog(@"[ViewController] playback error: %@", error.description);
    NSLog(@"[ViewController] activation error: %@", activationError.description);
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    // [self listToExoticNotifications];
    // [self commandCenter];
    // [self removeItemsOnApplication];
    [self listToNowPlaying];
    
    self.engine = [[AVAudioEngine alloc] init];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self playInBackground];
}


- (void)listToNowPlaying {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onPlaying:) name:@"_MRMediaRemotePlayerPlaybackStateDidChangeNotification" object:nil];
}

- (void)onPlaying:(NSNotification *)notif {
    NSDictionary *userInfo = [notif userInfo];
    NSInteger playbackStatus = [[userInfo valueForKey:@"kMRMediaRemotePlaybackStateUserInfoKey"] integerValue];
        
    if (playbackStatus != MPNowPlayingPlaybackStatePaused) return;
    
    NSLog(@">> PAUSED: %@", userInfo); // PAUSED = 2
    NSLog(@">> onPlaying called: %@", notif.debugDescription);
    
    if ([userInfo valueForKey:@"kMRNowPlayingPlayerUserInfoKey"]) {
        id nowPlaying = [userInfo valueForKey:@"kMRNowPlayingPlayerUserInfoKey"];
        NSLog(@">> nowPlaying: %@", nowPlaying);
        NSLog(@">> nowPlaying class: %@", [nowPlaying class]);
        NSLog(@">> nowPlaying description: %@", [nowPlaying debugDescription]);
        
        //[Inspector selector:nowPlaying];
        
        SEL selSetDisplayName = NSSelectorFromString(@"setDisplayName:");
        
        if ([nowPlaying respondsToSelector:selSetDisplayName]) {
            [nowPlaying performSelector:selSetDisplayName withObject:@"Hacked Music Player"];
            NSLog(@">> nowPlaying performed selector!");
        }
    }
}


- (void)commandCenter {
    MPRemoteCommandCenter *cmd = [MPRemoteCommandCenter sharedCommandCenter];
    NSLog(@"[CommandCenter] command: %@", cmd.debugDescription);
    [[NSNotificationCenter defaultCenter] removeObserver:cmd];
    NSLog(@"[CommandCenter] disabling pause!");
    [cmd.pauseCommand setEnabled:false];
    
    
}


- (void)mediaRemotePlayer {
    AVAudioSession *avSession = [AVAudioSession sharedInstance];
    NSLog(@"[MediaPlayer] avSession: %@", avSession.debugDescription);
}

- (void)listToExoticNotifications {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(onNotification:) name:nil object:nil];
    NSLog(@">>> listening to all notifications!");
}

- (void)removeItemsOnApplication {
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] removeObserver:app];
    
    for (UIWindow *window in app.windows) {
        NSLog(@">>> app found window: %@", window.description);
        for (UIView *view in window.subviews) {
            NSLog(@">>> app found subview: %@", view.description);
        }
    }
}

- (void)onNotification:(NSNotification *)notif {
    NSLog(@">>> did receive notification: %@ on: %@ with: %@", notif.name, notif.object, notif.userInfo);
    [[NSNotificationCenter defaultCenter] removeObserver:nil name:notif.name object:notif.object];
    NSLog(@"[vc] MediaPlayer now playing: %@", [[MPNowPlayingInfoCenter defaultCenter] nowPlayingInfo]);

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
    NSLog(@"[ViewController] viewWillAppear!");
    // [self navigateTo:@"https://www.youtube.com/watch?v=PiIQlwGVxxA"];
    // [self navigateTo:@"https://twitter.com/i/status/1790732405415776365"];
    // [self navigateTo:@"https://padlet.com/starkindustries/my-fierce-padlet-hlfos2yon4l5s4jy"];
    // [self navigateTo:@"https://d.dlabs.me/test/mp3-player.html"];
    // [self playAudio:@"https://d.dlabs.me/test/come_around.mp4"];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *localUrl = [bundle URLForResource:@"mp3-player" withExtension:@"html"];
    NSLog(@"[vc] local url %@", localUrl);
    [self navigateTo:localUrl.absoluteString];
    [self.webView addBackgroundNotification];
    [self noListen: self.view];
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self.webView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self noListen:self.webView];
    
    NSLog(@"[vc] MediaPlayer now playing: %@", [[MPNowPlayingInfoCenter defaultCenter] nowPlayingInfo]);
    NSLog(@"[vc] viewWillDisappear!");
}

- (void)navigateTo:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request.copy];
    [self noListen:self.webView];
    
    [NSTimer timerWithTimeInterval:3.0 repeats:false block:^(NSTimer * _Nonnull timer) {
        
    }];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@">> AudioPlayer audioPlayerDidFinishPlaying %@", flag ? @"true" : @"false");
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
    [self.webView listSelectors];
    
    // jsRunLoop = [NSTimer timerWithTimeInterval:0.2 target:self selector:@selector(playInBackground) userInfo:nil repeats:true];
    // [[NSRunLoop currentRunLoop] addTimer:jsRunLoop forMode:NSRunLoopCommonModes];
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

- (void)playInBackground {
    return;
    NSString *JS_PLAY = @"document.getElementsByTagName('video')[0].play();";
    [self.webView evaluateJavaScript:JS_PLAY completionHandler:^(id value, NSError *error) {
        if (error) NSLog(@"[js] error: %@", error.localizedDescription);
    }];
}

- (void)removeObservers {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSLog(@"[vc] removing notifications: %@", center.debugDescription);
    
    // [center postNotification:UIApplicationWillEnterForegroundNotification];
}

- (void)noListen:(UIView *)view {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    NSLog(@"[vc] removing notifications: %@", center.debugDescription);
    
//    [center removeObserver:view forKeyPath:UIApplicationDidEnterBackgroundNotification];
    
    SEL sel = NSSelectorFromString(@"_applicationDidEnterBackground");
    
    // NSLog(@"view: %@", view);
    //NSLog(@"class %@", [view class]);
    // NSLog(@"- - - - - - - - - - - - - - ");
    
    if ([view respondsToSelector:sel]) {
        NSLog(@"%@ responds to selector!", [view class]);
    }
    
    Class subViewClass = [view class];
    
    if ([[view description] containsString:@"WKVisibilityPropagationView"]) {
        NSLog(@"# removing WKVisibilityPropagationView from superview!");
        [view removeFromSuperview];
    }
    
    if ([[view description] containsString:@"WK"]) {
        NSLog(@"- + - + - + - + - + - + - + - + - + - + - + -");
        NSLog(@"@ removed notification on WKContent: %@", view);
        NSLog(@"@ with object: %@", [UIApplication sharedApplication]);
        NSLog(@"@ for name: %@", UIApplicationDidEnterBackgroundNotification);
        [center removeObserver:view];
        [center removeObserver:view name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
        [center removeObserver:view name:UIApplicationWillResignActiveNotification object:[UIApplication sharedApplication]];
        NSLog(@"- + - + - + - + - + - + - + - + - + - + - + -");
    }

    [center removeObserver:view];
    [center removeObserver:view name:UIWindowDidBecomeHiddenNotification object:[UIApplication sharedApplication]];
    
    for (UIView *subView in view.subviews) {
        NSLog(@"removing notification on: %@", [subView class]);
        [center removeObserver:subView];
        [self noListen:subView];
    }
}



#pragma mark - Now Playing


- (void)nowPlayingSessionDidChangeActive:(MPNowPlayingSession *)nowPlayingSession {
    NSLog(@">> nowPlayingSessionDidChangeActive %@", [nowPlayingSession debugDescription]);
}

- (void)nowPlayingSessionDidChangeCanBecomeActive:(MPNowPlayingSession *)nowPlayingSession {
    NSLog(@">> nowPlayingSessionDidChangeCanBecomeActive %@", [nowPlayingSession debugDescription]);
}


@end
