//
//  RSSFeedDataSource.m
//  RSSFeedReader
//
//  Created by Edward Chiang on 2010/12/30.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "RSSFeedDataSource.h"
#import "RSSDescriptionModel.h"
#import "RSSFeed.h"
#import "Atlas.h"

@implementation RSSFeedDataSource

static int subLength = 25;

- (id)initWithSearchQuery:(NSString*)searchQuery {
  
  if (self = [super init]) {
    _feedModel = [[RSSFeedModel alloc] initWithSearchQuery:searchQuery];
    TTDPRINT(@"RSSFeedModel add.");
  }
  
  return self; 
}

- (void) dealloc {
  TT_RELEASE_SAFELY(_feedModel);
  [super dealloc];
}

/*
 *  Ask for model
 */
- (id<TTModel>)model {
  TTDPRINT(@"Start");
  return _feedModel;
}

- (void)tableViewDidLoadModel:(UITableView*)tableView {
  TTDPRINT(@"Start.");
  
  
  NSMutableArray* items = [[NSMutableArray alloc] init];
  for (RSSFeed* rssFeed in _feedModel.feeds) {

    TTDPRINT(@"Start rssFeed.");
    // Using TTTableMessageItem
    
    
    NSMutableString *accessURL = [[NSMutableString alloc] initWithString:@"tt://description/"];
    if (rssFeed.GUID != nil && kIsUsingGUIDForDescription) {
      [accessURL appendString:[RSSFeed escapeReservedWords:rssFeed.GUID]];
    }
    TTDPRINT(@"Access URL: %@", accessURL);
    
    // Mark this one, before category fixed
    // [items addObject:[TTTableMessageItem itemWithTitle:author caption:rssFeed.category text:rssFeed.feedTitle timestamp:rssFeed.publishDate URL:accessURL]];
    
    // Handle the Text
    NSString* text = rssFeed.feedTitle;
    
    // Handle the auther
    NSString *auther = [[NSString alloc] initWithString:@""];
    if (kIsBloggerAuthorName) {
      auther = [RSSFeed extractBloggerName:rssFeed.author];
    } else if (rssFeed.author == nil) {
      auther = @"";
    } else {
      auther = rssFeed.author;
    }

    // Handle the sub Title
    NSString* subTitle = [NSString stringWithFormat:@"%@ - %@", 
                          auther, [rssFeed.publishDate formatRelativeTime] ];

    TT_RELEASE_SAFELY(auther);
    
    if ([text length] >= subLength) {
      text = [NSString stringWithFormat:@"%@ %@", 
              [text substringToIndex:subLength],@"..." ];
    }
    
    [items addObject:[TTTableSubtitleItem itemWithText:text subtitle:subTitle
                                  URL:accessURL]];
    
    // [items addObject:[TTTableMessageItem itemWithTitle:text caption:author text:rssFeed.feedTitle timestamp:rssFeed.publishDate URL:accessURL]];
    
    TT_RELEASE_SAFELY(accessURL);
  }
  
  self.items = items;
  TT_RELEASE_SAFELY(items);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)titleForLoading:(BOOL)reloading {
  if (reloading) {
    return NSLocalizedString(@"Updating RSS feed...", @"RSS feed updating text");
  } else {
    return NSLocalizedString(@"Loading RSS feed...", @"RSS feed loading text");
  }
}

@end
