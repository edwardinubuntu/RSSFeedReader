//
//  RSSDescriptionDataSource.m
//  RSSFeedsReader
//
//  Created by Edward Chiang on 2010/12/31.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "RSSDescriptionDataSource.h"
#import "RSSDescriptionModel.h"
#import "RSSFeed.h"
#import "Atlas.h"

@implementation RSSDescriptionDataSource


- (id)initWithSearchQuery:(NSString*)query searchGuid:(NSString*)guid;{
  if (self = [super init]) {
    TTDPRINT(@"RSSDescriptionModel Start.");
    _descriptionModel = [[RSSDescriptionModel alloc] initWithSearchQuery:query searchGuid:guid];
    TTDPRINT(@"RSSDescriptionModel add.");
  }
  
  return self;
}

- (void) dealloc {
  TT_RELEASE_SAFELY(_descriptionModel);
  [super dealloc];
}


/*
 *  Ask for model
 */
- (id<TTModel>)model {
  TTDPRINT(@"Start");
  return _descriptionModel;
}

- (void)tableViewDidLoadModel:(UITableView*)tableView {
  TTDPRINT(@"Start.");
  
  NSMutableArray* items = [[NSMutableArray alloc] init];
  for (RSSFeed* rssFeed in _descriptionModel.feeds) {
    
    NSString* content = [NSString stringWithFormat:@"<b><a href='%@'>%@</a></b><br/>by %@%<br/><br/>%@", 
                      rssFeed.link , rssFeed.feedTitle,[RSSFeed extractBloggerName:rssFeed.author], rssFeed.description ];
    
    TTStyledText* styledText = [TTStyledText textFromXHTML:content
                                               lineBreaks:NO URLs:YES];
    //If this asserts, it's likely that the rssFeed contains an HTML character that caused
    TTDASSERT(nil != styledText);
    
    // Adding the style text to items
    [items addObject:[TTTableStyledTextItem itemWithText:styledText]];    
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
