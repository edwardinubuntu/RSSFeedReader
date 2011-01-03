//
//  Atlas.h
//  MyRSSFeedReader
//
//  Created by Edward Chiang on 2010/12/29.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* kAppRootURLPath;
extern NSString* kAppDescriptionURLPath;
extern NSString* kAppDescriptionPath;

// Setting the blog feed format
extern NSString* kSearchFeedFormat;

// Setting the blog account
extern NSString* kBlogAccount;

// Setting is the RSS feed come from blogger
extern BOOL* kIsBloggerAuthorName;

// Setting for the XML key
extern NSString* kContentKey;
// Setting for Content key, ex: blogger using 'description'
extern NSString* kAuthorKey;
// Setting for isUsing guid for looking description
extern BOOL* kIsUsingGUIDForDescription;
