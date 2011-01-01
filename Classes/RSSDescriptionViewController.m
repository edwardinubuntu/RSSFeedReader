//
//  RSSDescriptionViewController.m
//  RSSFeedsReader
//
//  Created by Edward Chiang on 2010/12/30.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "RSSDescriptionViewController.h"
#import "RSSDescriptionDataSource.h"
#import "Atlas.h"

@implementation RSSDescriptionViewController

@synthesize guid = _guid;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  TTDPRINT(@"Start");  
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization.
  }
  return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
  [super loadView];
  TTDPRINT(@"Start");
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  TTDPRINT(@"Start");
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
  [_guid release];
  [super dealloc];
}

#pragma mark -
#pragma mark Custom method

-(id) initWithGUID: (NSString*)guid {
  
  if (self = [self init]) {
    TTDPRINT(@"Setting guid with %@", guid);
    self.guid = guid;
  }
  
  return self;
}

#pragma mark -
#pragma mark TTModelViewController method

- (void)createModel {
  TTDPRINT(@"Begain");
  self.dataSource = [[[RSSDescriptionDataSource alloc] initWithSearchQuery:kBlogAccount searchGuid:self.guid] autorelease];
}

#pragma mark -
#pragma mark TTTableViewController method
- (id<UITableViewDelegate>)createDelegate {
  TTDPRINT(@"Begin");
  return [[[TTTableViewDragRefreshDelegate alloc] initWithController:self] autorelease];
}

@end
