//
//  Settings.m
//  KodiWatchRemote
//
//  Created by Wolf Posdorfer on 29.09.15.
//  Copyright (c) 2015 posdorfer. All rights reserved.
//

#import "Settings.h"

@implementation Settings


#define KEY_HOST @"host.address"
#define KEY_PORT @"host.port"
#define KEY_USER @"host.user"
#define KEY_PASS @"host.pass"


+(void) storeHost:(NSString*) hostaddress
{
    [[NSUserDefaults standardUserDefaults] setValue:hostaddress forKey:KEY_HOST];
}

+(void) storePort:(NSString*) port
{
    [[NSUserDefaults standardUserDefaults] setValue:port forKey:KEY_PORT];
}

+(void) storeUser:(NSString*) user
{
    [[NSUserDefaults standardUserDefaults] setValue:user forKey:KEY_USER];
}

+(void) storePassword:(NSString*) pass
{
    [[NSUserDefaults standardUserDefaults] setValue:pass forKey:KEY_PASS];
}

+(NSString*) getHost
{
    return [[NSUserDefaults standardUserDefaults] valueForKey: KEY_HOST];
}

+(NSString*) getPort
{
    return [[NSUserDefaults standardUserDefaults] valueForKey: KEY_PORT];
}

+(NSString*) getUser
{
    return [[NSUserDefaults standardUserDefaults] valueForKey: KEY_USER];
}

+(NSString*) getPassword
{
    return [[NSUserDefaults standardUserDefaults] valueForKey: KEY_PASS];
}
@end
