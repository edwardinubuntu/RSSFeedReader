//
//  RSSFeedModel.h
//  RSSFeedReader
//
//  Created by Edward Chiang on 2010/12/29.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface RSSFeedModel : TTURLRequestModel {
  NSString* _searchQuery;
  NSArray*  _feeds;
}

@property (nonatomic, copy)     NSString* searchQuery;
@property (nonatomic, readonly) NSArray*  feeds;

- (id)initWithSearchQuery:(NSString*)query;

@end
