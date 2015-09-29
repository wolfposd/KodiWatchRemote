//
//  Settings.h
//  KodiWatchRemote
//
//  Created by Wolf Posdorfer on 29.09.15.
//  Copyright (c) 2015 posdorfer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject



+(void) storeHost:(NSString*) hostaddress;
+(void) storePort:(NSString*) port;
+(void) storeUser:(NSString*) user;
+(void) storePassword:(NSString*) pass;



+(NSString*) getHost;
+(NSString*) getPort;
+(NSString*) getUser;
+(NSString*) getPassword;


@end
