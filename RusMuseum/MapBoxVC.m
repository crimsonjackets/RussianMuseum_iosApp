//
//  MapBoxVC.m
//  RusMuseum
//
//  Created by Max on 17/11/14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import "MapBoxVC.h"
#import "Mapbox.h"
@interface MapBoxVC ()

@end

@implementation MapBoxVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RMMBTilesSource *offlineSource = [[RMMBTilesSource alloc] initWithTileSetResource:@"control-room-0.2.0" ofType:@"mbtiles"];
    
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:offlineSource];
    
    mapView.zoom = 2;
    
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    mapView.adjustTilesForRetinaDisplay = YES; // these tiles aren't designed specifically for retina, so make them legible
    
    [self.view addSubview:mapView];
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
