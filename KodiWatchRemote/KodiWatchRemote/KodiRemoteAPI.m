//
//  KodiRemoteAPI.m
//  KodiWatchRemote
//
//  Created by Wolf Posdorfer on 29.09.15.
//  Copyright (c) 2015 posdorfer. All rights reserved.
//

#import "KodiRemoteAPI.h"
#import "Settings.h"
#import "GTMNSString+HTML.h"

@implementation KodiRemoteAPI



#define JSONDICTBASIC @{ @"jsonrpc":@"2.0", @"id":@1}

// { "jsonrpc": "2.0", "method": "Input.ShowOSD", "id": 1 }


+(void) sendRequest:(NSURLRequest*) request
{
    
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:
     ^(NSURLResponse* response, NSData* data, NSError* error)
     {
         NSLog(@"%@", data);
     }];
    
}

+(NSURLRequest*) makeRequestForPlayButton
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"params"] = @{@"playerid":@0};
    dict[@"method"] = @"Player.PlayPause";
    return [self getBasicRequest:[self dictToJSONString_escaped:dict]];
}

+(NSURLRequest *)makeRequestForStopButton
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"params"] = @{@"playerid":@0};
    dict[@"method"] = @"Player.Stop";
    return [self getBasicRequest:[self dictToJSONString_escaped:dict]];
}


+(NSURLRequest*) makeRequestForRightButton
{
    NSString* json = [self dictToJSONString_escaped:[self makeDictionaryForMethod:@"Input.Right"]];
    NSURLRequest* req = [self getBasicRequest:json];
    return req;
}


+(NSURLRequest *)makeRequestForLeftButton
{
    NSString* json = [self dictToJSONString_escaped:[self makeDictionaryForMethod:@"Input.Left"]];
    NSURLRequest* req = [self getBasicRequest:json];
    return req;
}

+(NSURLRequest *)makeRequestForUpButton
{
    NSString* json = [self dictToJSONString_escaped:[self makeDictionaryForMethod:@"Input.Up"]];
    NSURLRequest* req = [self getBasicRequest:json];
    return req;
}

+(NSURLRequest *)makeRequestForDownButton
{
    NSString* json = [self dictToJSONString_escaped:[self makeDictionaryForMethod:@"Input.Down"]];
    NSURLRequest* req = [self getBasicRequest:json];
    return req;
}



+(NSURLRequest *) makeRequestForSelectButton
{
    NSString* json = [self dictToJSONString_escaped:[self makeDictionaryForMethod:@"Input.Select"]];
    NSURLRequest* req = [self getBasicRequest:json];
    return req;
}


+(NSURLRequest *)makeRequestForBackButton
{
    NSString* json = [self dictToJSONString_escaped:[self makeDictionaryForMethod:@"Input.Back"]];
    NSURLRequest* req = [self getBasicRequest:json];
    return req;
}




#pragma mark - Private Methods

+(NSString*) dictToJSONString_escaped:(NSDictionary*) dict
{
    NSError* error = nil;
    NSData* jsondata = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
    NSString* json = [[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", json);
    
    return [json stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


+(NSMutableDictionary*) makeDictionaryForMethod:(NSString*) method
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"method"] = method;
    return dict;
}


+(NSMutableURLRequest*) getBasicRequest:(NSString*) jsonrequest
{
    NSString* address = [Settings getHost];
    NSString* port = [Settings getPort];
    
    NSString* basicUrl = [NSString stringWithFormat:@"http://%@:%@/jsonrpc?request=%@", address, port, jsonrequest];
    
    
    NSLog(@"%@", basicUrl);
    NSURL* url =[NSURL URLWithString:basicUrl];
    
    NSLog(@"%@", url);
    
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    
    
    // Make Auth
    NSString* username = [Settings getUser];
    NSString* password = [Settings getPassword];
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", username, password];
    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:kNilOptions]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    
  
    
  
    return request;
}




@end
