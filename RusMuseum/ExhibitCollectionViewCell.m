//
//  ExhibitCollectionViewCell.m
//  RusMuseum
//
//  Created by admin on 17.11.14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import "ExhibitCollectionViewCell.h"
@interface ExhibitCollectionViewCell()
@property (nonatomic, weak) IBOutlet UILabel * titleLabel;
@property (nonatomic, weak) IBOutlet UILabel * authorLabel;
@property (nonatomic, weak) IBOutlet UIImageView * backgroundImage;

@end
@implementation ExhibitCollectionViewCell

-(void) resetCellForExhibit:(NSDictionary *)exhibit{
    self.titleLabel.text = [exhibit objectForKey:@"title"];
    self.authorLabel.text = [exhibit objectForKey:@"author"];
    self.backgroundImage.image = [UIImage imageNamed:[exhibit objectForKey:@"image_name"]];
}

@end
