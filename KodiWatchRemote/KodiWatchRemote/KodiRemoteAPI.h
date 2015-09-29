//
//  KodiRemoteAPI.h
//  KodiWatchRemote
//
//  Created by Wolf Posdorfer on 29.09.15.
//  Copyright (c) 2015 posdorfer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KodiRemoteAPI : NSObject


+(void) sendRequest:(NSURLRequest*) request;


+(NSURLRequest*) makeRequestForPlayButton;

+(NSURLRequest*) makeRequestForRightButton;

+(NSURLRequest*) makeRequestForLeftButton;

+(NSURLRequest*) makeRequestForUpButton;

+(NSURLRequest*) makeRequestForDownButton;

+(NSURLRequest*) makeRequestForStopButton;

+(NSURLRequest *) makeRequestForSelectButton;

+(NSURLRequest *) makeRequestForBackButton;

@end
