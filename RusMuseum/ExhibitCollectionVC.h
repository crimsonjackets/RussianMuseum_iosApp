//
//  ExhibitCollectionVC.h
//  RusMuseum
//
//  Created by admin on 17.11.14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ExhibitSelectionDelegate <NSObject>

@required
-(void) didSelectExhibit:(NSDictionary *) exhibit sender:(id) sender;

@end

@interface ExhibitCollectionVC : UICollectionViewController

@property (nonatomic, strong) NSArray * exhibitList;
@property (nonatomic, weak) id<ExhibitSelectionDelegate> exhibitSelectionDelegate;

@end


