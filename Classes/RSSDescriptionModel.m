//
//  RSSDescriptionModel.m
//  RSSFeedsReader
//
//  Created by Edward Chiang on 2010/12/31.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "RSSDescriptionModel.h"
#import "Atlas.h"
#import "TTURLXMLResponse.h"
#import "RSSFeed.h"

@implementation RSSDescriptionModel

@synthesize searchGUID = _searchGUID;
@synthesize searchQuery = _searchQuery;
@synthesize feeds = _feedDescription;

- (id)initWithSearchQuery:(NSString*)query searchGuid:(NSString*)guid {
  TTDPRINT(@"Begin"); 
  if (self = [super init]) {
    TTDPRINT(@"Begin"); 
    self.searchGUID = guid;
    self.searchQuery = query;
  }
  TTDPRINT(@"end"); 
  return self;
}

- (void) dealloc {
  TT_RELEASE_SAFELY(_searchGUID);
  TT_RELEASE_SAFELY(_feedDescription);
  [super dealloc];
}


/*
 * Begain to load
 */
- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
  
  TTDPRINT(@"Begin"); 
  
  if (!self.isLoading && TTIsStringWithAnyText(_searchQuery)) {
    
    // Prepare the feed URL
    NSString* feedUrl = [NSString stringWithFormat:kSearchFeedFormat, _searchQuery];
    TTDPRINT(@"Ask for %@",feedUrl);
    
    TTURLRequest* request = [TTURLRequest requestWithURL:feedUrl delegate:self];
    
    request.cachePolicy = cachePolicy;
    request.cacheExpirationAge = TT_CACHE_EXPIRATION_AGE_NEVER;
    
    TTURLXMLResponse* response = [[TTURLXMLResponse alloc] init];
    response.isRssFeed = YES;
    request.response = response;
    TT_RELEASE_SAFELY(response);
    
    TTDPRINT(@"Start Request send");
    [request send];
    TTDPRINT(@"End Request send");
  }
}

/*
 *  Collecting feed items
 */
- (void)requestDidFinishLoad:(TTURLRequest*)request {
  TTDPRINT(@"Start"); 
  TTURLXMLResponse* response = request.response;
  
  NSDictionary* feed = response.rootObject;
  // TTDPRINT(@"Show feed content: %@", feed);
  
  TTDASSERT([[feed objectForKey:@"channel"] isKindOfClass:[NSDictionary class]]);
  NSDictionary* channel = [feed objectForKey:@"channel"];
  TTDASSERT([[channel objectForKey:@"item"] isKindOfClass:[NSArray class]]);
  
  NSArray* items = [channel objectForKey:@"item"];
  
  // Date format
  NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
  [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzzz"];
  
  // Prepare feeds Array
  NSMutableArray* feedItems = [[NSMutableArray alloc] initWithCapacity:[items count]];
  
  for (NSDictionary* item in items) {
    
    // Prepare each feed
    RSSFeed* rssFeed = [[RSSFeed alloc] init];
    
    
    // Date
    NSDate* date = [dateFormatter dateFromString:[[item objectForKey:@"pubDate"]
                                                  objectForXMLNode]];
    
    NSString *dateString = [[item objectForKey:@"pubDate"]
                            objectForXMLNode];
    // TTDPRINT(@"Date: %@", [dateFormatter stringFromDate:date]);
    
    rssFeed.publishDate = date;
    
    // Author
    rssFeed.author = [[item objectForKey:@"author"] objectForXMLNode];
    
    rssFeed.feedTitle = [[item objectForKey:@"title"] objectForXMLNode];
    
    // category
    // rssFeed.category = [[item objectForKey:@"category"] objectForXMLNode];
    
    // description
    rssFeed.description = [[item objectForKey:@"description"] objectForXMLNode];
    
    // GUID
    rssFeed.GUID = [[item objectForKey:@"guid"] objectForXMLNode];
    TTDPRINT(@"GUID: %@", rssFeed.GUID);
    
    // Add each feed
    if ([rssFeed.GUID compare:self.searchGUID] == NSOrderedSame) {
      [feedItems addObject:rssFeed];
    }
    TT_RELEASE_SAFELY(rssFeed);
  }
  
  _feedDescription = feedItems;
  
  TT_RELEASE_SAFELY(dateFormatter);
  [super requestDidFinishLoad:request];
  TTDPRINT(@"End");
}

@end
