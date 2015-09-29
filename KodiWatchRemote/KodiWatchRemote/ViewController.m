//
//  ViewController.m
//  KodiWatchRemote
//
//  Created by Wolf Posdorfer on 29.09.15.
//  Copyright (c) 2015 posdorfer. All rights reserved.
//

#import "ViewController.h"
#import "KodiRemoteAPI.h"
#import "Settings.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *hostLabel;
@property (weak, nonatomic) IBOutlet UITextField *portLabel;
@property (weak, nonatomic) IBOutlet UITextField *userLabel;
@property (weak, nonatomic) IBOutlet UITextField *passLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self fillInFields];    
}

-(void) fillInFields
{
    NSString* address = [Settings getHost];
    NSString* port = [Settings getPort];
    NSString* username = [Settings getUser];
    NSString* password = [Settings getPassword];
    
    if(address) self.hostLabel.text = address;
    if(port) self.portLabel.text = port;
    if(username) self.userLabel.text = username;
    if(password) self.passLabel.text = password;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButtonTouchUpInside:(id)sender
{
    [self tapGestureRecognized:nil];
    [Settings storeHost:self.hostLabel.text];
    [Settings storePort:self.portLabel.text];
    [Settings storeUser:self.userLabel.text];
    [Settings storePassword:self.passLabel.text];
    NSLog(@"%@", @"Saving");
}


- (IBAction)tapGestureRecognized:(id)sender
{
    [self.hostLabel resignFirstResponder];
    [self.portLabel resignFirstResponder];
    [self.passLabel resignFirstResponder];
    [self.userLabel resignFirstResponder];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    
    if(textField == self.hostLabel)
    {
        [self.portLabel becomeFirstResponder];
        return NO;
    }
    else if(textField == self.portLabel)
    {
        [self.userLabel becomeFirstResponder];
        return NO;
    }
    else if(textField == self.userLabel)
    {
        [self.passLabel becomeFirstResponder];
        return NO;
    }
    else
    {
        [self.passLabel resignFirstResponder];
        return YES;
    }
}
- (IBAction)demoButtonTouchUpInside:(id)sender
{
    
    [KodiRemoteAPI sendRequest:[KodiRemoteAPI makeRequestForRightButton]];
    
    
}

@end
