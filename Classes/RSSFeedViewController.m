//
//  RSSFeedViewController.m
//  MyRSSFeedReader
//
//  Created by Edward Chiang on 2010/12/29.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "RSSFeedViewController.h"
#import "RSSFeedDataSource.h"
#import "Atlas.h"

@implementation RSSFeedViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  TTDPRINT(@"Begain");
  
  self.title = kBlogAccount;
  self.variableHeightRows = YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark TTModelViewController method

- (void)createModel {
  TTDPRINT(@"Begain");
  self.dataSource = [[[RSSFeedDataSource alloc] initWithSearchQuery:kBlogAccount] autorelease];
}

#pragma mark -
#pragma mark TTTableViewController method
- (id<UITableViewDelegate>)createDelegate {
  TTDPRINT(@"Begin");
  return [[[TTTableViewDragRefreshDelegate alloc] initWithController:self] autorelease];
}

@end
