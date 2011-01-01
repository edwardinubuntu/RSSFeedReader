//
//  RSSDescriptionModel.h
//  RSSFeedsReader
//
//  Created by Edward Chiang on 2010/12/31.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface RSSDescriptionModel : TTURLRequestModel {
  NSString* _searchGUID;
  NSString* _searchQuery;
  NSArray*  _feedDescription;
}

@property (nonatomic, copy)     NSString* searchGUID;
@property (nonatomic, copy)     NSString* searchQuery;
@property (nonatomic, readonly) NSArray*  feeds;

- (id)initWithSearchQuery:(NSString*)query searchGuid:(NSString*)guid;

@end
