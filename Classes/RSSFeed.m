//
//  RSSFeed.m
//  RSSFeedsReader
//
//  Created by Edward Chiang on 2010/12/30.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "RSSFeed.h"


@implementation RSSFeed

@synthesize publishDate = _publishDate;
@synthesize GUID = _feedGUID;
@synthesize author = _author;
@synthesize link = _link;
@synthesize feedTitle = _title;
@synthesize category = _category;
@synthesize description = _description;

- (void) dealloc {
  TT_RELEASE_SAFELY(_publishDate);
  TT_RELEASE_SAFELY(_feedGUID);
  TT_RELEASE_SAFELY(_author);
  TT_RELEASE_SAFELY(_link);
  TT_RELEASE_SAFELY(_title);
  TT_RELEASE_SAFELY(_category);
  TT_RELEASE_SAFELY(_description);
  [super dealloc];
}

+ (NSString*)extractBloggerName:(NSString*)author {
  return [[NSString alloc] initWithString:
          [[[[author stringByReplacingOccurrencesOfString: @"noreply@blogger.com" withString:@""]
             stringByReplacingOccurrencesOfString: @"(" withString:@""]
            stringByReplacingOccurrencesOfString: @")" withString:@""]
           stringByReplacingOccurrencesOfString: @" " withString:@""]];
  
}

@end
