//
//  ControllersForMenu.h
//  RusMuseum
//
//  Created by admin on 14.11.14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define MenuControllers [ControllersForMenu sharedInstance]
@interface ControllersForMenu : NSObject

@property (nonatomic,strong) UIViewController * startVC;
@property (nonatomic,strong) UIViewController * qrReaderVC;
@property (nonatomic,strong) UIViewController * chooseFloorVC;
@property (nonatomic,strong) UIViewController * sponsorVC;
@property (nonatomic,strong) UINavigationController *navigationController;

+ (ControllersForMenu *)sharedInstance;
- (void) goStartVC;
- (void) goQrReaderVC;
- (void) goChooseFloorVC;
- (void) goSponsorVC;



@end
