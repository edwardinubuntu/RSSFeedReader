//
//  RSSFeed.h
//  RSSFeedsReader
//
//  Created by Edward Chiang on 2010/12/30.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface RSSFeed : NSObject {
  NSDate* _publishDate;
  NSString* _feedGUID;
  NSString* _author;
  NSURL* _link;
  NSString* _title;
  NSString* _category;
  NSString* _description;
}

@property (nonatomic, retain) NSDate* publishDate;
@property (nonatomic, retain) NSString* GUID;
@property (nonatomic, copy) NSString* author;
@property (nonatomic, copy) NSURL* link;
@property (nonatomic, copy) NSString* feedTitle;
@property (nonatomic, copy) NSString* category;
@property (nonatomic, copy) NSString* description;

+ (NSString*)extractBloggerName:(NSString*)author;

@end
