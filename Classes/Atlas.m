//
//  Atlas.m
//  MyRSSFeedReader
//
//  Created by Edward Chiang on 2010/12/29.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "Atlas.h"

// Using for navigation url map
NSString* kAppRootURLPath = @"tt://root";
NSString* kAppDescriptionPath = @"tt://description/";
NSString* kAppDescriptionURLPath = @"tt://description/(initWithGUID:)";

// Setting for the feeds source
NSString* kSearchFeedFormat = @"http://%@.blogspot.com/feeds/posts/default?alt=rss";
// Setting for the blog account.
NSString* kBlogAccount = @"edwardinaction";