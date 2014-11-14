//
//  StartVC.m
//  RusMuseum
//
//  Created by admin on 14.11.14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import "StartVC.h"
#import "NavigationButton.h"
#import "ControllersForMenu.h"

@interface StartVC ()

@property (nonatomic, strong) IBOutlet UIImageView * backgroundImageView;
@property (nonatomic, strong) IBOutlet UIButton * logoButton;
@property (nonatomic, strong) IBOutlet NavigationButton * menuButton;

@end

@implementation StartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //setting main navigation controller;
    [MenuControllers setNavigationController:self.navigationController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
