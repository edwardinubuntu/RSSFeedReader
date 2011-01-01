//
//  RSSFeedDataSource.h
//  RSSFeedReader
//
//  Created by Edward Chiang on 2010/12/30.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSFeedModel.h"

@interface RSSFeedDataSource : TTSectionedDataSource {
  RSSFeedModel* _feedModel;
}

- (id)initWithSearchQuery:(NSString*)searchQuery;

@end
