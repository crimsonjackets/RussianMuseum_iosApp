//
//  ControllersForMenu.m
//  RusMuseum
//
//  Created by admin on 14.11.14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import "ControllersForMenu.h"


@implementation ControllersForMenu

+ (ControllersForMenu *)sharedInstance {
    static dispatch_once_t p = 0;
    __strong static ControllersForMenu * _sharedObject = nil;
    
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *storyboardName = [bundle objectForInfoDictionaryKey:@"UIMainStoryboardFile"];
        UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:bundle];
        _sharedObject.startVC = [storyboard instantiateViewControllerWithIdentifier:@"startVC"];
        _sharedObject.qrReaderVC = [storyboard instantiateViewControllerWithIdentifier:@"qrReaderVC"];
        _sharedObject.chooseFloorVC = [storyboard instantiateViewControllerWithIdentifier:@"chooseFloorVC"];
        _sharedObject.sponsorVC = [storyboard instantiateViewControllerWithIdentifier:@"sponsorVC"];
    });
    
    return _sharedObject;
}



-(void) goStartVC{
    if (self.navigationController){
        if ([self.navigationController topViewController] != self.startVC){
            [self.navigationController setViewControllers:@[self.startVC] animated:YES];
        }
    }
}
-(void) goQrReaderVC{
    if (self.navigationController){
        if ([self.navigationController topViewController] != self.qrReaderVC){
            [self.navigationController setViewControllers:@[self.qrReaderVC] animated:YES];
        }
    }
}
-(void) goChooseFloorVC{
    if (self.navigationController){
        if ([self.navigationController topViewController] != self.chooseFloorVC){
            [self.navigationController setViewControllers:@[self.chooseFloorVC] animated:YES];
        }
    }
}
-(void) goSponsorVC{
    if (self.navigationController){
        if ([self.navigationController topViewController] != self.sponsorVC){
            [self.navigationController setViewControllers:@[self.sponsorVC] animated:YES];
        }
    }
}
@end
