//
//  MapVC.m
//  RusMuseum
//
//  Created by Max on 15/11/14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import "MapVC.h"
#import "MapBoxVC.h"
#import "ExhibitVC.h"
#import "ExhibitData.h"
@interface MapVC () <MabBoxVCDelegate>

@end

@implementation MapVC


- (void)viewDidAppear:(BOOL)animated{
    //enable pop gesture;
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.childViewControllers enumerateObjectsUsingBlock:^(id vc, NSUInteger idx, BOOL *stop) {
        if([vc respondsToSelector:@selector(setMapBoxVCDelegate:)]) {
            [vc setMapBoxVCDelegate:self];
        }
    }];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeFloor:(UIButton *)sender{
    NSLog(@"[MapVC] changeFloor; button tag == %d", (int)sender.tag);
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentFloor"] != sender.tag){
        [[NSUserDefaults standardUserDefaults] setInteger:sender.tag forKey:@"CurrentFloor"];
        //changeMap in MapBoxVC
        [self.childViewControllers enumerateObjectsUsingBlock:^(id vc, NSUInteger idx, BOOL *stop) {
            if([vc respondsToSelector:@selector(changeMap)]) {
                [vc changeMap];
            }
        }];
    }
}


#pragma mark MabBoxVCDelegate
- (void) didTapExhibitWithNumber:(int)exhibitNumber inRoom:(int)roomNumber{
    if (exhibitNumber > 0) exhibitNumber--;
    NSArray *exhibitList = [ExhibitData getExhibitDataForShowRoom:roomNumber];
    ExhibitVC * exhibitVC = [self.storyboard instantiateViewControllerWithIdentifier:@"exhibitVC"];
    exhibitVC.exhibitList = exhibitList;
    exhibitVC.selectedExhibitIndex = exhibitNumber;
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
