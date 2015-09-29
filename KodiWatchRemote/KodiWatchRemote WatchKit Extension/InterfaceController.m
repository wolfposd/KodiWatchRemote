//
//  InterfaceController.m
//  KodiWatchRemote WatchKit Extension
//
//  Created by Wolf Posdorfer on 29.09.15.
//  Copyright (c) 2015 posdorfer. All rights reserved.
//

#import "InterfaceController.h"
#import "CommandEnum.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


- (IBAction)leftArrow
{
    [self sendActionToApp:LEFTBUTTON];
}

- (IBAction)rightArrow
{
    [self sendActionToApp:RIGHTBUTTON];
}

- (IBAction)stopButton
{
    [self sendActionToApp:STOPBUTTON];
}

- (IBAction)playButton
{
    [self sendActionToApp:PLAYBUTTON];
}

- (IBAction)selectButton
{
    [self sendActionToApp:SELECTBUTTON];
}
- (IBAction)backButton
{
    [self sendActionToApp:BACKBUTTON];
}
- (IBAction)downButto
{
    [self sendActionToApp:DOWNBUTTON];
}
- (IBAction)upButton
{
    [self sendActionToApp:UPBUTTON];
}


-(void) sendActionToApp:(NSInteger) action
{
    NSDictionary *applicationData = @{@"command": [NSNumber numberWithInteger:action]};
    
    [WKInterfaceController openParentApplication:applicationData reply:
     ^(NSDictionary *replyInfo, NSError *error)
     {
         // dont care
     }];
}


@end



