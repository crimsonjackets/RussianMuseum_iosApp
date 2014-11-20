//
//  MapBoxVC.h
//  RusMuseum
//
//  Created by Max on 17/11/14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mapbox.h"

@protocol MabBoxVCDelegate <NSObject>

@required
- (void) didTapExhibitWithNumber:(int) exhibitNumber inRoom:(int) roomNumber;

@end

@interface MapBoxVC : UIViewController <RMMapViewDelegate>

@property (nonatomic, weak) id<MabBoxVCDelegate> mapBoxVCDelegate;
@property (nonatomic) int currentFloor;

- (void) changeMap;

@end
