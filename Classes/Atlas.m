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

// Other kind of rss feed
/*
NSString* kSearchFeedFormat = @"http://pingchu.com/?feed=rss2";
NSString* kAuthorKey = @"dc:creator";
NSString* kBlogAccount = @"ping";
BOOL* kIsBloggerAuthorName=NO;
NSString* kContentKey = @"content:encoded";
BOOL* kIsUsingGUIDForDescription = YES;
*/
 
/*
 * Blogger Setting
 */
// Setting for the feeds source
NSString* kSearchFeedFormat = @"http://%@.blogspot.com/feeds/posts/default?alt=rss";
NSString* kBlogAccount = @"edwardinaction";
NSString* kAuthorKey = @"author";
BOOL* kIsBloggerAuthorName=YES;
NSString* kContentKey = @"description";
BOOL* kIsUsingGUIDForDescription = YES;
