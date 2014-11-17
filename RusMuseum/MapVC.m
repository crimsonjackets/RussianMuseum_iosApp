//
//  MapVC.m
//  RusMuseum
//
//  Created by Max on 15/11/14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import "MapVC.h"
#import "ExhibitVC.h"
#import "ExhibitData.h"
@interface MapVC ()

@end

@implementation MapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToExhibit:(UIButton *)sender{
    NSArray *exhibitList = [ExhibitData getExhibitDataForShowRoom:1];
    ExhibitVC * exhibitVC = [self.storyboard instantiateViewControllerWithIdentifier:@"exhibitVC"];
    exhibitVC.exhibitList = exhibitList;
    [self.navigationController pushViewController:exhibitVC animated:YES];
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
