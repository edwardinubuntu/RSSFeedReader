//
//  RSSFeedsReaderAppDelegate.m
//  RSSFeedsReader
//
//  Created by Edward Chiang on 2010/12/29.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "RSSFeedsReaderAppDelegate.h"
#import "RSSFeedViewController.h"
#import "RSSDescriptionViewController.h"
#import "Atlas.h"
#import "RSSFeed.h"

@implementation RSSFeedsReaderAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {
  
  // Add navigator
  TTNavigator* navigator = [TTNavigator navigator];
  navigator.persistenceMode = TTNavigatorPersistenceModeNone;
  
  TTURLMap* map = navigator.URLMap;
  
  // Adding URL Map
  [map from:@"*" toViewController:[TTWebController class]];
  [map from:kAppRootURLPath toViewController:[RSSFeedViewController class]];
  [map from:kAppDescriptionURLPath toViewController:[RSSDescriptionViewController class]];
  [map from:kAppDescriptionPath toViewController:[RSSDescriptionViewController class]];
  
  if (![navigator restoreViewControllers]) {
    // Start default page
    [navigator openURLAction:[[TTURLAction actionWithURLPath:kAppRootURLPath] applyAnimated:YES]];
  }
  
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
  /*
   Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
   */
}


- (void)dealloc {
  [window release];
  [super dealloc];
}

#pragma mark -
#pragma mark TTBaseNavigator method
- (BOOL)navigator:(TTNavigator*)navigator shouldOpenURL:(NSURL*)URL {
  return YES;
}

#pragma mark -
#pragma mark UIApplication method
- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)URL {
  [[TTNavigator navigator] openURLAction:[TTURLAction actionWithURLPath:URL.absoluteString]];
  return YES;
}


@end
