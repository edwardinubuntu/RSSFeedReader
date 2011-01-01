//
//  RSSDescriptionViewController.h
//  RSSFeedsReader
//
//  Created by Edward Chiang on 2010/12/30.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Three20/Three20.h>

@interface RSSDescriptionViewController : TTTableViewController {
  NSString* _guid;
}

@property (nonatomic, retain) NSString* guid;

-(id) initWithGUID: (NSString*)guid;

@end
