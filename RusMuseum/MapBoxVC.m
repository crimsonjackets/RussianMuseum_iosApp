//
//  MapBoxVC.m
//  RusMuseum
//
//  Created by Max on 17/11/14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import "MapBoxVC.h"

@interface MapBoxVC ()

@end

@implementation MapBoxVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RMMBTilesSource *offlineSource = [[RMMBTilesSource alloc] initWithTileSetResource:@"2rooms_f585e0" ofType:@"mbtiles"];
    
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:offlineSource];
    
    mapView.zoom = 2;
    mapView.delegate = self;
    
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    mapView.adjustTilesForRetinaDisplay = YES; // these tiles aren't designed specifically for retina, so make them legible
    
    [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)singleTapOnMap:(RMMapView *)mapView at:(CGPoint)point
{
    
    RMMapboxSource *source = (RMMapboxSource *)mapView.tileSource;
    
    if ([source conformsToProtocol:@protocol(RMInteractiveSource)] && [source supportsInteractivity])
    {
        NSString *formattedOutput = [source formattedOutputOfType:RMInteractiveSourceOutputTypeTeaser
                                                         forPoint:point
                                                        inMapView:mapView];
        
        if (formattedOutput && [formattedOutput length])
        {
            if (self.mapBoxVCDelegate){
                NSLog(@"formattedOutput == %@",formattedOutput);
                int separatorPosition =  [formattedOutput rangeOfString:@"#"].location;
                int roomNumber = [[formattedOutput substringToIndex:separatorPosition] intValue];
                int exhibitNumber = [[formattedOutput substringFromIndex:(separatorPosition + 1)] intValue];
                [self.mapBoxVCDelegate didTapExhibitWithNumber:exhibitNumber inRoom:roomNumber];
                
            }else{
                NSLog(@"MapBoxVC.delegate is nil");
            }
            
        }
    }
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
