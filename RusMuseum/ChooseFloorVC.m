//
//  ChooseFloorVC.m
//  RusMuseum
//
//  Created by Max on 15/11/14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import "ChooseFloorVC.h"
#import "MapVC.h"
@interface ChooseFloorVC ()

@end

@implementation ChooseFloorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)goToMap:(UIButton *) sender{
    NSLog(@"button tag = %ld", sender.tag);
    MapVC * mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mapVC"];
    mapVC.currentFloor = (int)sender.tag;
    [self.navigationController pushViewController:mapVC animated:YES];
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
