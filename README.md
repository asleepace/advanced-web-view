# Advanced Web View

A WKWebView with some advanced features!

## WKWebView

This is the notification that is sent when the application enters the background on the **WKContentView.mm** file.

```objc
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
```

WKVisibilityPropagationView is a subclass of WKWebView.

https://github.com/WebKit/WebKit/blob/main/Source/WebKit/UIProcess/ios/WKVisibilityPropagationView.mm

https://github.com/WebKit/WebKit/blob/4bae864b01100e8179cc36948b7d15b7dafe2095/Source/WebKit/UIProcess/ios/WKContentView.mm#L1045

## Helpful Links

- https://developer.apple.com/documentation/avfaudio/avaudiosession?language=objc

- https://developer.apple.com/documentation/webkit/wkaudiovisualmediatypes?language=objc

## Debugging

These are all the notification events which are sent when the application goes to the background.

```obj-c
// passing nil as the name will make the observer receive all notifications
[center addObserver:self selector:@selector(onNotification:) name:nil object:nil];
```

```
>>> did receive notification: UISceneWillDeactivateNotification
>>> did receive notification: UICanvasWillDeactivateNotification
>>> did receive notification: _UIApplicationWillAddDeactivationReasonNotification
>>> did receive notification: UIApplicationWillResignActiveNotification
>>> did receive notification: _UIApplicationWillAddDeactivationReasonNotification
>>> did receive notification: UIApplicationSuspendedEventsOnlyNotification
>>> did receive notification: UISceneDidEnterBackgroundNotification
>>> did receive notification: UICanvasDidEnterBackgroundNotification
>>> did receive notification: _UIApplicationWillAddDeactivationReasonNotification
>>> did receive notification: UIApplicationSuspendedNotification
>>> did receive notification: _MRMediaRemotePlayerPlaybackStateDidChangeNotification
>>> did receive notification: UIApplicationDidEnterBackgroundNotification
>>> did receive notification: _MRMediaRemotePlayerIsPlayingDidChangeNotification
>>> did receive notification: _UIApplicationDidRemoveDeactivationReasonNotification
>>> did receive notification: UIApplicationSceneOcclusionChangedNotification
>>> did receive notification: UISceneWillBeginSystemSnapshotSequence
>>> did receive notification: UIStatusBarStyleOverridesDidChangeNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: _UIApplicationWillBeginSnapshotSessionNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UITextEffectsWindowDidRotateNotification
>>> did receive notification: UIStatusBarStyleOverridesDidChangeNotification
>>> did receive notification: _UIApplicationDidEndSnapshotSessionNotification
>>> did receive notification: UISceneDidCompleteSystemSnapshotSequence
>>> did receive notification: _UIWindowDidDisposeContextNotification
>>> did receive notification: _UIWindowDidDisposeContextNotification
>>> did receive notification: _UIWindowDidDisposeContextNotification
>>> did receive notification: _MRMediaRemoteApplicationDisplayNameDidChangeNotification
>>> did receive notification: _MRMediaRemoteApplicationClientStateDidChange
>>> did receive notification: BufferBackingWillDeallocate
>>> did receive notification: VKAnalysisDidUpdateNotification
>>> did receive notification: _UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification
```