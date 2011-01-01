//
//  RSSFeedReaderAppDelegate.h
//  RSSFeedReader
//
//  Created by Edward Chiang on 2010/12/30.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>

@interface RSSFeedsReaderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

