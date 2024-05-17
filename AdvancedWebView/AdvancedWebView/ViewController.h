//
//  ViewController.h
//  AdvancedWebView
//
//  Created by Colin Teahan on 5/15/24.
//

#import <UIKit/UIKit.h>
#import "WebView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) WebView *webView;

- (void)playInBackground;

@end

