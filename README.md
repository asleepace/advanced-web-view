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

## Apple Classes

## MPRemoteCommandCenter

> Don’t create instances of this class yourself. Instead, use the sharedCommandCenter method to retrieve the shared command center object. The properties of the shared command center object contain MPRemoteCommand objects that respond to the various kinds of remote control events. You configure these objects to respond to the events you’re interested to handle in your app.

- https://developer.apple.com/documentation/mediaplayer/mpremotecommandcenter?language=objc

## MPRemoteCommand

> The Media Player framework defines a standard set of remote command objects for handling media-related events. When an accessory or iOS user interface generates a remote control event, the system notifies the corresponding command object on the shared MPRemoteCommandCenter instance. That command object executes any attached handlers.

- https://developer.apple.com/documentation/mediaplayer/mpremotecommand?language=objc

## MPNowPlaying

> Ensure your app is eligible to become the Now Playing app by adopting best practices for providing Now Playing info and registering for remote command center actions.

https://developer.apple.com/documentation/mediaplayer/becoming_a_now_playable_app?language=objc

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

All methods on WebView.superview 

```
Method no #0: _sf_applicationDidEnterBackgroundOrWillTerminate:
Method no #1: _sf_effectiveViewToLayOut
Method no #2: _sf_saveUnsubmittedGeneratedPasswordAndRemoveFormMetadata
Method no #3: _sf_securityInfo
Method no #4: _sf_setSecurityInfo:
Method no #5: _sf_suggestedFilename
Method no #6: webui_formMetadataForLastPasswordGenerationOrSubmitEventInFrame:
Method no #7: webui_lastGeneratedPasswordForCurrentBackForwardItem
Method no #8: webui_presentingViewController
Method no #9: webui_preventNavigationDuringAutoFillPrompt
Method no #10: webui_privateBrowsingEnabled
Method no #11: webui_removeFormMetadataForLastPasswordGenerationOrSubmitEventInFrame:
Method no #12: webui_setFormMetadata:forLastPasswordGenerationOrSubmitEventInFrame:
Method no #13: webui_setLastGeneratedPasswordForCurrentBackForwardItem:
Method no #14: dealloc
Method no #15: .cxx_destruct
Method no #16: encodeWithCoder:
Method no #17: initWithCoder:
Method no #18: URL
Method no #19: title
Method no #20: valueForUndefinedKey:
Method no #21: .cxx_construct
Method no #22: _MIMEType
Method no #23: configuration
Method no #24: _handle
Method no #25: setBounds:
Method no #26: mediaType
Method no #27: setOpaque:
Method no #28: reload
Method no #29: serverTrust
Method no #30: stopLoading
Method no #31: _contentSizeCategory
Method no #32: _viewScale
Method no #33: initWithFrame:
Method no #34: loadData:MIMEType:characterEncodingName:baseURL:
Method no #35: removeFromSuperview
Method no #36: setBackgroundColor:
Method no #37: setFrame:
Method no #38: _paginationMode
Method no #39: _setPageLength:
Method no #40: _share:
Method no #41: findInteraction
Method no #42: performTextSearchWithQueryString:usingOptions:resultAggregator:
Method no #43: _obscuredInsets
Method no #44: backForwardList
Method no #45: define:
Method no #46: didMoveToWindow
Method no #47: findAndReplace:
Method no #48: findInteraction:sessionForView:
Method no #49: select:
Method no #50: toggleBoldface:
Method no #51: _addShortcut:
Method no #52: _define:
Method no #53: _didScroll
Method no #54: _dynamicUserInterfaceTraitDidChange
Method no #55: _effectiveAppearanceIsDark
Method no #56: _findInteraction
Method no #57: _findInteractionEnabled
Method no #58: _findSelected:
Method no #59: _fixedLayoutSize
Method no #60: _formDelegate
Method no #61: _gapBetweenPages
Method no #62: _inputDelegate
Method no #63: _insertionPointColor
Method no #64: _isValid
Method no #65: _keyboardDidChangeFrame:
Method no #66: _keyboardDidShow:
Method no #67: _keyboardWillChangeFrame:
Method no #68: _keyboardWillHide:
Method no #69: _keyboardWillShow:
Method no #70: _lookup:
Method no #71: _nextAccessoryTab:
Method no #72: _page
Method no #73: _pageCount
Method no #74: _pageLength
Method no #75: _paginationBehavesLikeColumns
Method no #76: _pasteAndMatchStyle:
Method no #77: _populateArchivedSubviews:
Method no #78: _promptForReplace:
Method no #79: _registerForNotifications
Method no #80: _scrollViewDidInterruptDecelerating:
Method no #81: _searchableObject
Method no #82: _selectionGranularity
Method no #83: _sessionState
Method no #84: _setFixedLayoutSize:
Method no #85: _setFormDelegate:
Method no #86: _setGapBetweenPages:
Method no #87: _setPaginationBehavesLikeColumns:
Method no #88: _setPaginationMode:
Method no #89: _setSuppressSoftwareKeyboard:
Method no #90: _setUnobscuredSafeAreaInsets:
Method no #91: _singleTapGestureRecognizer
Method no #92: _textInputTraits
Method no #93: _translate:
Method no #94: _transliterateChinese:
Method no #95: _updateScrollViewInsetAdjustmentBehavior
Method no #96: _windowDidRotate:
Method no #97: addShortcut:
Method no #98: allowsLinkPreview
Method no #99: becomeFirstResponder
Method no #100: buildMenuWithBuilder:
Method no #101: canBecomeFirstResponder
Method no #102: canGoBack
Method no #103: canGoForward
Method no #104: canPerformAction:withSender:
Method no #105: captureTextFromCamera:
Method no #106: clearAllDecoratedFoundText
Method no #107: compareFoundRange:toRange:inDocument:
Method no #108: copy:
Method no #109: cut:
Method no #110: decorateFoundTextRange:inDocument:usingStyle:
Method no #111: decreaseSize:
Method no #112: didBeginTextSearchOperation
Method no #113: didEndTextSearchOperation
Method no #114: find:
Method no #115: findInteraction:didBeginFindSession:
Method no #116: findInteraction:didEndFindSession:
Method no #117: findInteractionEnabled
Method no #118: findNext:
Method no #119: findPrevious:
Method no #120: findSelected:
Method no #121: goBack
Method no #122: goForward
Method no #123: increaseSize:
Method no #124: initWithFrame:configuration:
Method no #125: inputAccessoryView
Method no #126: inputAssistantItem
Method no #127: inputView
Method no #128: interactionState
Method no #129: isFindInteractionEnabled
Method no #130: isLoading
Method no #131: layoutSubviews
Method no #132: loadHTMLString:baseURL:
Method no #133: loadRequest:
Method no #134: makeTextWritingDirectionLeftToRight:
Method no #135: makeTextWritingDirectionNatural:
Method no #136: makeTextWritingDirectionRightToLeft:
Method no #137: offsetFromPosition:toPosition:inDocument:
Method no #138: paste:
Method no #139: pasteAndMatchStyle:
Method no #140: pressesBegan:withEvent:
Method no #141: pressesCancelled:withEvent:
Method no #142: pressesChanged:withEvent:
Method no #143: pressesEnded:withEvent:
Method no #144: promptForReplace:
Method no #145: replace:
Method no #146: replaceFoundTextInRange:inDocument:withText:
Method no #147: resignFirstResponder
Method no #148: safeAreaInsetsDidChange
Method no #149: scrollRangeToVisible:inDocument:
Method no #150: scrollView
Method no #151: scrollView:contentSizeForZoomScale:withProposedSize:
Method no #152: scrollViewDidEndDecelerating:
Method no #153: scrollViewDidEndDragging:willDecelerate:
Method no #154: scrollViewDidEndScrollingAnimation:
Method no #155: scrollViewDidEndZooming:withView:atScale:
Method no #156: scrollViewDidScroll:
Method no #157: scrollViewDidScrollToTop:
Method no #158: scrollViewDidZoom:
Method no #159: scrollViewWillBeginDragging:
Method no #160: scrollViewWillBeginZooming:withView:
Method no #161: scrollViewWillEndDragging:withVelocity:targetContentOffset:
Method no #162: selectAll:
Method no #163: selectedTextRange
Method no #164: setAllowsLinkPreview:
Method no #165: setCustomUserAgent:
Method no #166: setFindInteractionEnabled:
Method no #167: setInteractionState:
Method no #168: setSemanticContentAttribute:
Method no #169: setUIDelegate:
Method no #170: share:
Method no #171: supportsTextReplacement
Method no #172: targetForAction:withSender:
Method no #173: toggleItalics:
Method no #174: toggleUnderline:
Method no #175: translate:
Method no #176: transliterateChinese:
Method no #177: underPageBackgroundColor
Method no #178: undoManager
Method no #179: useSelectionForFind:
Method no #180: viewForZoomingInScrollView:
Method no #181: willFinishIgnoringCalloutBarFadeAfterPerformingAction
Method no #182: _isEditable
Method no #183: _isBackground
Method no #184: _isClosed
Method no #185: setMediaType:
Method no #186: _close
Method no #187: _didLoadNonAppInitiatedRequest:
Method no #188: _isPlayingAudio
Method no #189: _isShowingVideoPictureInPicture
Method no #190: _pageForTesting
Method no #191: _setLayoutMode:
Method no #192: _textZoomFactor
Method no #193: _unreachableURL
Method no #194: customUserAgent
Method no #195: _countOfUpdatesWithLayerChanges
Method no #196: _doAfterNextPresentationUpdate:
Method no #197: _imageAnalysisGestureRecognizer
Method no #198: _isInFullscreen
Method no #199: _lastNavigationWasAppInitiated:
Method no #200: _overrideViewportWithArguments:
Method no #201: _pageZoomFactor
Method no #202: _processDidExit
Method no #203: _updateScrollViewIndicatorStyle
Method no #204: closeFullScreenWindowController
Method no #205: fullscreenState
Method no #206: setInspectable:
Method no #207: setSelectedColorForColorPicker:
Method no #208: UIDelegate
Method no #209: _accessibilityClearSelection
Method no #210: _accessibilityDidGetSpeakSelectionContent:
Method no #211: _accessibilityRetrieveRectsAtSelectionOffset:withText:completionHandler:
Method no #212: _accessibilityRetrieveSpeakSelectionContent
Method no #213: _accessibilitySettingsDidChange:
Method no #214: _accessibilityStoreSelection
Method no #215: _acquireResizeAssertionForReason:
Method no #216: _addAppHighlight
Method no #217: _addAppHighlightInNewGroup:originatedInApp:
Method no #218: _addEventAttributionWithSourceID:destinationURL:sourceDescription:purchaser:reportEndpoint:optionalNonce:applicationBundleID:ephemeral:
Method no #219: _addLayerForFindOverlay
Method no #220: _addUpdateVisibleContentRectPreCommitHandler
Method no #221: _addsVisitedLinks
Method no #222: _adjustScrollRectToAvoidHighlightOverlay:
Method no #223: _alignCenter:
Method no #224: _alignJustified:
Method no #225: _alignLeft:
Method no #226: _alignRight:
Method no #227: _allMediaPresentationsClosed
Method no #228: _allowAnimationControls
Method no #229: _allowsAnyAnimationToPlay
Method no #230: _allowsDoubleTapGestures
Method no #231: _allowsMediaDocumentInlinePlayback
Method no #232: _allowsRemoteInspection
Method no #233: _allowsViewportShrinkToFit
Method no #234: _animationForFindOverlay:
Method no #235: _appHighlightDelegate
Method no #236: _appPrivacyReportTestingData:
Method no #237: _applicationNameForUserAgent
Method no #238: _archiveWithConfiguration:completionHandler:
Method no #239: _attachmentForIdentifier:
Method no #240: _audioRoutingArbitrationStatus
Method no #241: _audioRoutingArbitrationUpdateTime
Method no #242: _backgroundExtendsBeyondPage
Method no #243: _becomeFirstResponderWithSelectionMovingForward:completionHandler:
Method no #244: _beginAnimatedFullScreenExit
Method no #245: _beginAnimatedResizeWithUpdates:
Method no #246: _beginAutomaticLiveResizeIfNeeded
Method no #247: _beginBackSwipeForTesting
Method no #248: _beginInteractiveObscuredInsetsChange
Method no #249: _beginLiveResize
Method no #250: _caLayerTreeAsText
Method no #251: _callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:
Method no #252: _canTogglePictureInPicture
Method no #253: _canUseCredentialStorage
Method no #254: _cancelAnimatedResize
Method no #255: _certificateChain
Method no #256: _changeListType:
Method no #257: _clearAppPrivacyReportTestingData:
Method no #258: _clearBackForwardCache
Method no #259: _clearInterfaceOrientationOverride
Method no #260: _clearOverrideLayoutParameters
Method no #261: _clearOverrideZoomScaleParameters
Method no #262: _clearSafeBrowsingWarning
Method no #263: _clearSafeBrowsingWarningIfForMainFrameNavigation
Method no #264: _clearServiceWorkerEntitlementOverride:
Method no #265: _closeAllMediaPresentations
Method no #266: _committedURL
Method no #267: _completeBackSwipeForTesting
Method no #268: _completeTextManipulation:completion:
Method no #269: _completeTextManipulationForItems:completion:
Method no #270: _computePagesForPrinting:completionHandler:
Method no #271: _computedContentInset
Method no #272: _computedObscuredInset
Method no #273: _computedObscuredInsetForSafeBrowsingWarning
Method no #274: _computedUnobscuredSafeAreaInset
Method no #275: _contentBoundsExtendedForRubberbandingWithScale:
Method no #276: _contentInsetsFromSystemMinimumLayoutMargins
Method no #277: _contentOffsetAdjustedForObscuredInset:
Method no #278: _contentProviderRegistry
Method no #279: _contentRectForUserInteraction
Method no #280: _contentSizeCategoryDidChange:
Method no #281: _contentViewIsFirstResponder
Method no #282: _contentVisibleRect
Method no #283: _contentZoomScale
Method no #284: _contentsOfUserInterfaceItem:
Method no #285: _convertPointFromContentsToView:
Method no #286: _convertPointFromViewToContents:
Method no #287: _couldNotRestorePageState
Method no #288: _countStringMatches:options:maxCount:
Method no #289: _createMediaSessionCoordinatorForTesting:completionHandler:
Method no #290: _currentContentView
Method no #291: _customUserAgent
Method no #292: _dataDetectionResults
Method no #293: _dataForDisplayedPDF
Method no #294: _dataTaskWithRequest:completionHandler:
Method no #295: _decreaseListLevel:
Method no #296: _decrementFocusPreservationCount
Method no #297: _deferrableUserScriptsNeedNotification
Method no #298: _denyNextUserMediaRequest
Method no #299: _destroyEndLiveResizeObserver
Method no #300: _destroyResizeAnimationView
Method no #301: _detectDataWithTypes:completionHandler:
Method no #302: _deviceOrientationIgnoringOverrides
Method no #303: _diagnosticLoggingDelegate
Method no #304: _didAddLayerForFindOverlay:
Method no #305: _didChangeEditorState
Method no #306: _didCommitLayerTree:
Method no #307: _didCommitLayerTreeDuringAnimatedResize:
Method no #308: _didCommitLoadForMainFrame
Method no #309: _didCompleteAnimatedResize
Method no #310: _didDisableBrowserExtensions:
Method no #311: _didDismissContactPicker
Method no #312: _didDismissContextMenu
Method no #313: _didEnableBrowserExtensions:
Method no #314: _didFailNavigation:
Method no #315: _didFinishLoadingDataForCustomContentProviderWithSuggestedFilename:data:
Method no #316: _didFinishNavigation:
Method no #317: _didFinishScrolling:
Method no #318: _didFinishTextInteractionInTextInputContext:
Method no #319: _didInsertAttachment:withSource:
Method no #320: _didInvalidateDataForAttachment:
Method no #321: _didInvokeUIScrollViewDelegateCallback
Method no #322: _didLoadAppInitiatedRequest:
Method no #323: _didPresentContactPicker
Method no #324: _didRelaunchProcess
Method no #325: _didRemoveAttachment:
Method no #326: _didRemoveLayerForFindOverlay
Method no #327: _didRequestPasswordForDocument
Method no #328: _didSameDocumentNavigationForMainFrame:
Method no #329: _didShowContextMenu
Method no #330: _didStartProvisionalLoadForMainFrame
Method no #331: _didStopDeferringGeometryUpdates
Method no #332: _didStopRequestingPasswordForDocument
Method no #333: _disableBackForwardSnapshotVolatilityForTesting
Method no #334: _disableURLSchemeCheckInDataDetectors
Method no #335: _dismissContactPickerWithContacts:
Method no #336: _dismissFilePicker
Method no #337: _dispatchSetDeviceOrientation:
Method no #338: _dispatchSetOrientationForMediaCapture:
Method no #339: _dispatchSetViewLayoutSize:
Method no #340: _displayCaptureState
Method no #341: _displayCaptureSurfaces
Method no #342: _doAfterActivityStateUpdate:
Method no #343: _doAfterNextPresentationUpdateWithoutWaitingForAnimatedResizeForTesting:
Method no #344: _doAfterNextPresentationUpdateWithoutWaitingForPainting:
Method no #345: _doAfterNextStablePresentationUpdate:
Method no #346: _doAfterNextVisibleContentRectAndPresentationUpdate:
Method no #347: _doAfterNextVisibleContentRectUpdate:
Method no #348: _doAfterProcessingAllPendingMouseEvents:
Method no #349: _doAfterReceivingEditDragSnapshotForTesting:
Method no #350: _dragCaretRect
Method no #351: _dragInteractionPolicy
Method no #352: _dumpPrivateClickMeasurement:
Method no #353: _effectiveDataOwner:
Method no #354: _effectiveObscuredInsetEdgesAffectedBySafeArea
Method no #355: _effectiveUserInterfaceLevelIsElevated
Method no #356: _enclosingScrollerScrollingEnded:
Method no #357: _enclosingViewForExposedRectComputation
Method no #358: _endAnimatedFullScreenExit
Method no #359: _endAnimatedResize
Method no #360: _endInteractiveObscuredInsetsChange
Method no #361: _endLiveResize
Method no #362: _enhancedWindowingToggled:
Method no #363: _ensureResizeAnimationView
Method no #364: _ephemeralUIEventAttribution
Method no #365: _evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:
Method no #366: _evaluateJavaScript:inFrame:inContentWorld:completionHandler:
Method no #367: _evaluateJavaScript:withSourceURL:inFrame:inContentWorld:completionHandler:
Method no #368: _evaluateJavaScriptWithoutUserGesture:completionHandler:
Method no #369: _executeEditCommand:argument:completion:
Method no #370: _filePickerAcceptedTypeIdentifiers
Method no #371: _findDelegate
Method no #372: _findString:options:maxCount:
Method no #373: _firePresentationUpdateForPendingStableStatePresentationCallbacks
Method no #374: _focusTextInputContext:placeCaretAt:completionHandler:
Method no #375: _frameOrBoundsMayHaveChanged
Method no #376: _frameOrBoundsWillChange
Method no #377: _frameTrees:
Method no #378: _frames:
Method no #379: _fullScreenPlaceholderView
Method no #380: _fullscreenDelegate
Method no #381: _getApplicationManifestWithCompletionHandler:
Method no #382: _getContentsAsAttributedStringWithCompletionHandler:
Method no #383: _getContentsAsStringWithCompletionHandler:
Method no #384: _getContentsAsStringWithCompletionHandlerKeepIPCConnectionAliveForTesting:
Method no #385: _getContentsOfAllFramesAsStringWithCompletionHandler:
Method no #386: _getMainResourceDataWithCompletionHandler:
Method no #387: _getPDFFirstPageSizeInFrame:completionHandler:
Method no #388: _getProcessDisplayNameWithCompletionHandler:
Method no #389: _getTextFragmentMatchWithCompletionHandler:
Method no #390: _getWebArchiveDataWithCompletionHandler:
Method no #391: _gpuProcessIdentifier
Method no #392: _gpuToWebProcessConnectionCountForTesting:
Method no #393: _grantAccessToAssetServices
Method no #394: _hasOverriddenLayoutParameters
Method no #395: _hasResizeAssertion
Method no #396: _hasServiceWorkerBackgroundActivityForTesting
Method no #397: _hasServiceWorkerForegroundActivityForTesting
Method no #398: _hasSleepDisabler
Method no #399: _haveSetObscuredInsets
Method no #400: _haveSetUnobscuredSafeAreaInsets
Method no #401: _hideContentUntilNextUpdate
Method no #402: _hideFindOverlay
Method no #403: _hideFindUI
Method no #404: _hidePasswordView
Method no #405: _historyDelegate
Method no #406: _iconLoadingDelegate
Method no #407: _increaseListLevel:
Method no #408: _incrementFocusPreservationCount
Method no #409: _indent:
Method no #410: _initialContentOffsetForScrollView
Method no #411: _initialScaleFactor
Method no #412: _initializeWithConfiguration:
Method no #413: _inputViewBoundsInWindow
Method no #414: _insertAttachmentWithFileWrapper:contentType:completion:
Method no #415: _insertAttachmentWithFileWrapper:contentType:options:completion:
Method no #416: _insertAttachmentWithFilename:contentType:data:options:completion:
Method no #417: _insertNestedOrderedList:
Method no #418: _insertNestedUnorderedList:
Method no #419: _insertOrderedList:
Method no #420: _insertUnorderedList:
Method no #421: _inspector
Method no #422: _interfaceOrientationOverride
Method no #423: _internalDoAfterNextPresentationUpdate:withoutWaitingForPainting:withoutWaitingForAnimatedResize:
Method no #424: _invalidateResizeAssertions
Method no #425: _isAnimatingDragCancel
Method no #426: _isBeingInspected
Method no #427: _isDisplayingPDF
Method no #428: _isDisplayingStandaloneImageDocument
Method no #429: _isDisplayingStandaloneMediaDocument
Method no #430: _isForcedIntoAppBoundMode:
Method no #431: _isJITEnabled:
Method no #432: _isKeyboardScrollingAnimationRunning
Method no #433: _isLayerTreeFrozenForTesting:
Method no #434: _isNavigatingToAppBoundDomain:
Method no #435: _isNavigationSwipeGestureRecognizer:
Method no #436: _isPictureInPictureActive
Method no #437: _isRetainingActiveFocusedState
Method no #438: _isShowingDataListSuggestions
Method no #439: _isShowingNavigationGestureSnapshot
Method no #440: _isWindowResizingEnabled
Method no #441: _keyboardChangedWithInfo:adjustScrollView:
Method no #442: _killWebContentProcess
Method no #443: _killWebContentProcessAndResetState
Method no #444: _launchInitialProcessIfNecessary
Method no #445: _layerForFindOverlay
Method no #446: _layerTreeCommitComplete
Method no #447: _layoutMode
Method no #448: _loadAlternateHTMLString:baseURL:forUnreachableURL:
Method no #449: _loadData:MIMEType:characterEncodingName:baseURL:userData:
Method no #450: _loadRequest:shouldOpenExternalURLs:
Method no #451: _loadRequest:shouldOpenExternalURLsPolicy:
Method no #452: _loadServiceWorker:completionHandler:
Method no #453: _loadServiceWorker:usingModules:completionHandler:
Method no #454: _mainFrame
Method no #455: _mainFrameURL
Method no #456: _maximumUnobscuredSizeOverride
Method no #457: _mayAutomaticallyShowVideoPictureInPicture
Method no #458: _mayContainEditableElementsInRect:
Method no #459: _mediaCaptureEnabled
Method no #460: _mediaCaptureReportingDelayForTesting
Method no #461: _mediaCaptureState
Method no #462: _mediaMutedState
Method no #463: _minimumEffectiveDeviceWidth
Method no #464: _minimumLayoutSizeOverride
Method no #465: _minimumUnobscuredSizeOverride
Method no #466: _navigationGestureDidBegin
Method no #467: _navigationGestureDidEnd
Method no #468: _negotiatedLegacyTLS
Method no #469: _networkProcessIdentifier
Method no #470: _networkRequestsInProgress
Method no #471: _notifyUserScripts
Method no #472: _obscuredInsetEdgesAffectedBySafeArea
Method no #473: _observedRenderingProgressEvents
Method no #474: _outdent:
Method no #475: _overrideDeviceScaleFactor
Method no #476: _overrideLayoutParametersWithMinimumLayoutSize:maximumUnobscuredSizeOverride:
Method no #477: _overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:
Method no #478: _overrideZoomScaleParametersWithMinimumZoomScale:maximumZoomScale:allowUserScaling:
Method no #479: _pageExtendedBackgroundColor
Method no #480: _pageScale
Method no #481: _paginationLineGridEnabled
Method no #482: _passwordView
Method no #483: _pasteAsQuotation:
Method no #484: _pauseAllAnimationsWithCompletionHandler:
Method no #485: _playAllAnimationsWithCompletionHandler:
Method no #486: _preconnectToServer:
Method no #487: _presentLockdownMode
Method no #488: _presentLockdownModeAlertIfNeeded
Method no #489: _previousAccessoryTab:
Method no #490: _printFormatterClass
Method no #491: _printProvider
Method no #492: _processDidResumeForTesting
Method no #493: _processWillSuspendForTesting:
Method no #494: _processWillSuspendImminentlyForTesting
Method no #495: _processWillSwap
Method no #496: _processWillSwapOrDidExit
Method no #497: _propertiesOfLayerWithID:
Method no #498: _provisionalWebProcessIdentifier
Method no #499: _recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:
Method no #500: _reloadExpiredOnly
Method no #501: _reloadWithoutContentBlockers
Method no #502: _remoteInspectionNameOverride
Method no #503: _remoteObjectRegistry
Method no #504: _removeDataDetectedLinks:
Method no #505: _removeLayerForFindOverlay
Method no #506: _requestActivatedElementAtPosition:completionBlock:
Method no #507: _requestActiveNowPlayingSessionInfo:
Method no #508: _requestRectForFoundTextRange:completionHandler:
Method no #509: _requestTextInputContextsInRect:completionHandler:
Method no #510: _resetCachedScrollViewBackgroundColor
Method no #511: _resetContentOffset
Method no #512: _resetFocusPreservationCount
Method no #513: _resetInteraction
Method no #514: _resetNavigationGestureStateForTesting
Method no #515: _resetObscuredInsets
Method no #516: _resetObscuredInsetsForTesting
Method no #517: _resetScrollViewInsetAdjustmentBehavior
Method no #518: _resetUnobscuredSafeAreaInsets
Method no #519: _resizeWhileHidingContentWithUpdates:
Method no #520: _resolutionForShareSheetImmediateCompletionForTesting
Method no #521: _resourceDirectoryURL
Method no #522: _resourceLoadDelegate
Method no #523: _restoreAndScrollToAppHighlight:
Method no #524: _restoreAppHighlights:
Method no #525: _restoreFromSessionStateData:
Method no #526: _restorePageScrollPosition:scrollOrigin:previousObscuredInset:scale:
Method no #527: _restorePageStateToUnobscuredCenter:scale:
Method no #528: _restoreScrollAndZoomStateForTransaction:
Method no #529: _restoreSessionState:andNavigate:
Method no #530: _resumeAllMediaPlayback
Method no #531: _resumePage:
Method no #532: _retainActiveFocusedState
Method no #533: _revokeAccessToAssetServices
Method no #534: _safeAreaShouldAffectObscuredInsets
Method no #535: _safeBrowsingWarning
Method no #536: _sampledPageTopColor
Method no #537: _saveBackForwardSnapshotForItem:
Method no #538: _saveResources:suggestedFileName:completionHandler:
Method no #539: _scheduleForcedVisibleContentRectUpdate
Method no #540: _scheduleVisibleContentRectUpdate
Method no #541: _scheduleVisibleContentRectUpdateAfterScrollInView:
Method no #542: _scrollPerformanceData
Method no #543: _scrollPerformanceDataCollectionEnabled
Method no #544: _scrollToAndRevealSelectionIfNeeded
Method no #545: _scrollToContentScrollPosition:scrollOrigin:animated:
Method no #546: _scrollToRect:origin:minimumScrollDistance:
Method no #547: _scrollViewInternal
Method no #548: _scrollViewIsRubberBanding:
Method no #549: _scrollViewIsRubberBandingForRefreshControl
Method no #550: _scrollViewSystemContentInset
Method no #551: _scrollbarStateForScrollingNodeID:isVertical:
Method no #552: _scrollingTreeAsText
Method no #553: _scrollingUpdatesDisabledForTesting
Method no #554: _selectDataListOption:
Method no #555: _selectionAttributes
Method no #556: _selectionRectIsFullyVisibleAndNonEmpty
Method no #557: _serviceWorkersEnabled:
Method no #558: _sessionStateData
Method no #559: _sessionStateWithFilter:
Method no #560: _setAddsVisitedLinks:
Method no #561: _setAllowsMediaDocumentInlinePlayback:
Method no #562: _setAllowsRemoteInspection:
Method no #563: _setAllowsViewportShrinkToFit:
Method no #564: _setAppHighlightDelegate:
Method no #565: _setApplicationNameForUserAgent:
Method no #566: _setAvoidsUnsafeArea:
Method no #567: _setBackgroundExtendsBeyondPage:
Method no #568: _setCanUseCredentialStorage:
Method no #569: _setConnectedToHardwareConsoleForTesting:
Method no #570: _setContinuousSpellCheckingEnabledForTesting:
Method no #571: _setCustomUserAgent:
Method no #572: _setDefersLoadingForTesting:
Method no #573: _setDeviceHasAGXCompilerServiceForTesting
Method no #574: _setDeviceOrientationUserPermissionHandlerForTesting:
Method no #575: _setDiagnosticLoggingDelegate:
Method no #576: _setDisplayCaptureState:completionHandler:
Method no #577: _setDragInteractionPolicy:
Method no #578: _setEditable:
Method no #579: _setEphemeralUIEventAttribution:
Method no #580: _setEphemeralUIEventAttribution:forApplicationWithBundleID:
Method no #581: _setFindDelegate:
Method no #582: _setFindInteractionEnabled:
Method no #583: _setFont:sender:
Method no #584: _setFontSize:sender:
Method no #585: _setFullscreenDelegate:
Method no #586: _setGrammarCheckingEnabledForTesting:
Method no #587: _setHasCustomContentView:loadedMIMEType:
Method no #588: _setHistoryDelegate:
Method no #589: _setIconLoadingDelegate:
Method no #590: _setIndexOfGetDisplayMediaDeviceSelectedForTesting:
Method no #591: _setInputDelegate:
Method no #592: _setInterfaceOrientationOverride:
Method no #593: _setMediaCaptureEnabled:
Method no #594: _setMediaCaptureReportingDelayForTesting:
Method no #595: _setMinimumEffectiveDeviceWidth:
Method no #596: _setObscuredInsetEdgesAffectedBySafeArea:
Method no #597: _setObscuredInsets:
Method no #598: _setObservedRenderingProgressEvents:
Method no #599: _setOpaqueInternal:
Method no #600: _setOverlaidAccessoryViewsInset:
Method no #601: _setOverrideDeviceScaleFactor:
Method no #602: _setPageMuted:
Method no #603: _setPageScale:withOrigin:
Method no #604: _setPageZoomFactor:
Method no #605: _setPaginationLineGridEnabled:
Method no #606: _setPrivateClickMeasurementAppBundleIDForTesting:completionHandler:
Method no #607: _setPrivateClickMeasurementAttributionReportURLsForTesting:destinationURL:completionHandler:
Method no #608: _setPrivateClickMeasurementAttributionTokenPublicKeyURLForTesting:completionHandler:
Method no #609: _setPrivateClickMeasurementAttributionTokenSignatureURLForTesting:completionHandler:
Method no #610: _setPrivateClickMeasurementOverrideTimerForTesting:completionHandler:
Method no #611: _setRemoteInspectionNameOverride:
Method no #612: _setResourceLoadDelegate:
Method no #613: _setScrollPerformanceDataCollectionEnabled:
Method no #614: _setScrollingUpdatesDisabledForTesting:
Method no #615: _setShareSheetCompletesImmediatelyWithResolutionForTesting:
Method no #616: _setSystemAudioCaptureState:completionHandler:
Method no #617: _setSystemCanPromptForGetDisplayMediaForTesting:
Method no #618: _setSystemPreviewCompletionHandlerForLoadTesting:
Method no #619: _setTextColor:sender:
Method no #620: _setTextManipulationDelegate:
Method no #621: _setTextZoomFactor:
Method no #622: _setThrottleStateForTesting:
Method no #623: _setUIEventAttribution:
Method no #624: _setUserContentExtensionsEnabled:
Method no #625: _setViewScale:
Method no #626: _setViewportSizeForCSSViewportUnits:
Method no #627: _setupPageConfiguration:
Method no #628: _setupScrollAndContentViews
Method no #629: _shouldAvoidResizingWhenInputViewBoundsChange
Method no #630: _shouldAvoidSecurityHeuristicScoreUpdates
Method no #631: _shouldBypassGeolocationPromptForTesting
Method no #632: _shouldDeferGeometryUpdates
Method no #633: _shouldUpdateKeyboardWithInfo:
Method no #634: _showFindOverlay
Method no #635: _showPasswordViewWithDocumentName:passwordHandler:
Method no #636: _showSafeBrowsingWarning:completionHandler:
Method no #637: _showSafeBrowsingWarningWithTitle:warning:details:completionHandler:
Method no #638: _showSafeBrowsingWarningWithURL:title:warning:details:completionHandler:
Method no #639: _showSafeBrowsingWarningWithURL:title:warning:detailsWithLinks:completionHandler:
Method no #640: _simulateDeviceOrientationChangeWithAlpha:beta:gamma:
Method no #641: _simulateElementAction:atLocation:
Method no #642: _simulateLongPressActionAtLocation:
Method no #643: _simulateSelectionStart
Method no #644: _simulateTextEntered:
Method no #645: _snapshotLayerContentsForBackForwardListItem:
Method no #646: _snapshotRect:intoImageOfWidth:completionHandler:
Method no #647: _snapshotRectAfterScreenUpdates:rectInViewCoordinates:intoImageOfWidth:completionHandler:
Method no #648: _stableStateOverride
Method no #649: _startImageAnalysis:target:
Method no #650: _startTextManipulationsWithConfiguration:completion:
Method no #651: _stopAllMediaPlayback
Method no #652: _stopMediaCapture
Method no #653: _storeAppHighlight:
Method no #654: _suggestedFilenameForDisplayedPDF
Method no #655: _supportsTextZoom
Method no #656: _suspendAllMediaPlayback
Method no #657: _suspendMediaPlaybackCounter
Method no #658: _suspendPage:
Method no #659: _switchFromStaticFontRegistryToUserFontRegistry
Method no #660: _systemAudioCaptureState
Method no #661: _takeFindStringFromSelection:
Method no #662: _takePDFSnapshotWithConfiguration:completionHandler:
Method no #663: _takeViewSnapshot
Method no #664: _tapHighlightViewRect
Method no #665: _targetContentZoomScaleForRect:currentScale:fitEntireRect:minimumScale:maximumScale:
Method no #666: _textManipulationDelegate
Method no #667: _themeColor
Method no #668: _togglePictureInPicture
Method no #669: _toggleStrikeThrough:
Method no #670: _trackTransactionCommit:
Method no #671: _triggerSystemPreviewActionOnElement:document:page:
Method no #672: _tryClose
Method no #673: _tryToHandleKeyEventInCustomContentView:
Method no #674: _uiEventAttribution
Method no #675: _uiTextCaretRect
Method no #676: _uiViewTreeAsText
Method no #677: _unobscuredSafeAreaInsets
Method no #678: _updateDrawingAreaSize
Method no #679: _updateFindOverlayPosition
Method no #680: _updateLiveResizeTransform
Method no #681: _updateMediaPlaybackControlsManager
Method no #682: _updateScrollViewBackground
Method no #683: _updateScrollViewContentInsetsIfNecessary
Method no #684: _updateScrollViewForTransaction:
Method no #685: _updateVisibleContentRects
Method no #686: _updateWebpagePreferences:
Method no #687: _userAgent
Method no #688: _userContentExtensionsEnabled
Method no #689: _videoControlsManagerDidChange
Method no #690: _viewForFindUI
Method no #691: _viewStabilityState:
Method no #692: _viewportSizeForCSSViewportUnits
Method no #693: _visibleContentRect
Method no #694: _visibleRectInEnclosingView:
Method no #695: _wasPrivateRelayed
Method no #696: _webProcessIdentifier
Method no #697: _webProcessIsResponsive
Method no #698: _webViewPrintFormatter
Method no #699: _willBeginTextInteractionInTextInputContext:
Method no #700: _willInvokeUIScrollViewDelegateCallback
Method no #701: _willOpenAppLink
Method no #702: _wirelessVideoPlaybackDisabled
Method no #703: _wkScrollView
Method no #704: _zoomOutWithOrigin:animated:
Method no #705: _zoomToCenter:atScale:animated:honorScrollability:
Method no #706: _zoomToFocusRect:selectionRect:fontSize:minimumScale:maximumScale:allowScaling:forceScroll:
Method no #707: _zoomToInitialScaleWithOrigin:animated:
Method no #708: _zoomToRect:atScale:origin:animated:
Method no #709: _zoomToRect:withOrigin:fitEntireRect:minimumScale:maximumScale:minimumScrollDistance:
Method no #710: activeViewLayoutSize:
Method no #711: allowsBackForwardNavigationGestures
Method no #712: axesToPreventScrollingForPanGestureInScrollView:
Method no #713: browsingContextController
Method no #714: callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:
Method no #715: cameraCaptureState
Method no #716: certificateChain
Method no #717: closeAllMediaPresentations
Method no #718: closeAllMediaPresentations:
Method no #719: closeAllMediaPresentationsWithCompletionHandler:
Method no #720: createPDFWithConfiguration:completionHandler:
Method no #721: createWebArchiveDataWithCompletionHandler:
Method no #722: currentlyVisibleContentInsetsWithScale:obscuredInsets:
Method no #723: didEndFormControlInteraction
Method no #724: didStartFormControlInteraction
Method no #725: dismissFormAccessoryView
Method no #726: estimatedProgress
Method no #727: evaluateJavaScript:completionHandler:
Method no #728: evaluateJavaScript:inFrame:inContentWorld:completionHandler:
Method no #729: findString:withConfiguration:completionHandler:
Method no #730: formInputLabel
Method no #731: fullScreenWindowController
Method no #732: goToBackForwardListItem:
Method no #733: hasFullScreenWindowController
Method no #734: hasOnlySecureContent
Method no #735: isInspectable
Method no #736: keyboardAccessoryBarNext
Method no #737: keyboardAccessoryBarPrevious
Method no #738: loadFileRequest:allowingReadAccessToURL:
Method no #739: loadFileURL:allowingReadAccessToURL:
Method no #740: loadSimulatedRequest:response:responseData:
Method no #741: loadSimulatedRequest:responseHTMLString:
Method no #742: loadSimulatedRequest:withResponse:responseData:
Method no #743: loadSimulatedRequest:withResponseHTMLString:
Method no #744: maximumViewportInset
Method no #745: microphoneCaptureState
Method no #746: minimumViewportInset
Method no #747: navigationDelegate
Method no #748: pageZoom
Method no #749: pauseAllMediaPlayback:
Method no #750: pauseAllMediaPlaybackWithCompletionHandler:
Method no #751: reloadFromOrigin
Method no #752: requestMediaPlaybackState:
Method no #753: requestMediaPlaybackStateWithCompletionHandler:
Method no #754: resumeAllMediaPlayback:
Method no #755: resumeDownloadFromResumeData:completionHandler:
Method no #756: scrollView:handleScrollUpdate:completion:
Method no #757: selectFormAccessoryHasCheckedItemAtRow:
Method no #758: selectFormAccessoryPickerRow:
Method no #759: selectFormPopoverTitle
Method no #760: selectWordBackwardForTesting
Method no #761: setAllMediaPlaybackSuspended:completionHandler:
Method no #762: setAllowsBackForwardNavigationGestures:
Method no #763: setCameraCaptureState:completionHandler:
Method no #764: setMicrophoneCaptureState:completionHandler:
Method no #765: setMinimumViewportInset:maximumViewportInset:
Method no #766: setNavigationDelegate:
Method no #767: setPageZoom:
Method no #768: setTimePickerValueToHour:minute:
Method no #769: setUnderPageBackgroundColor:
Method no #770: startDownloadUsingRequest:completionHandler:
Method no #771: suspendAllMediaPlayback:
Method no #772: takeSnapshotWithConfiguration:completionHandler:
Method no #773: textContentTypeForTesting
Method no #774: themeColor
Method no #775: timePickerValueHour
Method no #776: timePickerValueMinute
Method no #777: usesStandardContentView
Method no #778: visibleRectInViewCoordinates
```