//
//  ExhibitCollectionVC.m
//  RusMuseum
//
//  Created by admin on 17.11.14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import "ExhibitCollectionVC.h"
#import "ExhibitCollectionViewCell.h"

@interface ExhibitCollectionVC ()
@property (assign, nonatomic) CGAffineTransform currentCellContentTransform;
@end

@implementation ExhibitCollectionVC

static NSString * const reuseIdentifier = @"ExhibitCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    

    
    // Do any additional setup after loading the view.
}
- (void) viewWillAppear:(BOOL)animated{
    self.currentCellContentTransform = CGAffineTransformIdentity;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    if([self.collectionViewLayout isKindOfClass:[UICollectionViewFlowLayout class]]) {
        UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
        // Find the restrictive dimension
        CGFloat minDimension = MIN(CGRectGetHeight(self.view.bounds), CGRectGetWidth(self.view.bounds));
        CGSize newSize = CGSizeMake(minDimension, minDimension);
        if(!CGSizeEqualToSize(newSize, flowLayout.itemSize)) {
            // Reset the size of the cells
            flowLayout.itemSize = newSize;
            // Get the flow layout to re-layout.
            [flowLayout invalidateLayout];
        }
    }
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.exhibitList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                                           forIndexPath:indexPath];
    
    // Reset the trainsform on the content
    cell.contentView.transform = CGAffineTransformIdentity;
    
    // Configure the cell
    if([cell isKindOfClass:[ExhibitCollectionViewCell class]]) {
        ExhibitCollectionViewCell *exhibitCell = (ExhibitCollectionViewCell *)cell;
        NSDictionary *exhibit = self.exhibitList[indexPath.item];
        [exhibitCell resetCellForExhibit:exhibit];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    cell.contentView.transform = self.currentCellContentTransform;
}



#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // Notify the selection delegate that a selection has been made
    if(self.exhibitSelectionDelegate &&
       [self.exhibitSelectionDelegate respondsToSelector:@selector(didSelectExhibit:sender:)]) {
        NSDictionary *selectedExhibit = self.exhibitList[indexPath.item];
        [self.exhibitSelectionDelegate didSelectExhibit:selectedExhibit sender:self];
    }
}

@end
