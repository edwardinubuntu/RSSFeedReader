//
//  RSSDescriptionDataSource.h
//  RSSFeedsReader
//
//  Created by Edward Chiang on 2010/12/31.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSDescriptionModel.h"

@interface RSSDescriptionDataSource : TTSectionedDataSource {
  RSSDescriptionModel* _descriptionModel;
}

- (id)initWithSearchQuery:(NSString*)query searchGuid:(NSString*)guid;

@end
