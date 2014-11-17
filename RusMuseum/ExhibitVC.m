//
//  ExhibitVC.m
//  RusMuseum
//
//  Created by admin on 17.11.14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import "ExhibitVC.h"
#import "ExhibitCollectionVC.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ExhibitVC () <ExhibitSelectionDelegate>
@property (nonatomic, weak) IBOutlet UIView *exhibitSelectorView;

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@property (nonatomic, weak) IBOutlet UIButton *infoButton;
@property (nonatomic, weak) IBOutlet UIButton *videoButton;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, strong) NSDictionary * detailExhibit;

@end

@implementation ExhibitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Set up exhibit selection delegate on child view controller
    [self.childViewControllers enumerateObjectsUsingBlock:^(id vc, NSUInteger idx, BOOL *stop) {
        if([vc respondsToSelector:@selector(setExhibitSelectionDelegate:)]) {
            [vc setExhibitSelectionDelegate:self];
        }
        if([vc respondsToSelector:@selector(setExhibitList:)]) {
            [vc setExhibitList:self.exhibitList];
        }
        
    }];
    [self updateViewsWithExhibit:self.exhibitList[0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleInfoButtonTap:(UIButton *)sender{
    NSLog(@"info button tapped");
}
- (IBAction)handleVideoButtonTap:(UIButton *)sender{
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"video.mp4" ofType:nil];
    NSURL *movieURL = [NSURL fileURLWithPath:filepath];//[NSURL URLWithString:[self.detailExhibit objectForKey:@"video"]]
    MPMoviePlayerViewController *movieController = [[MPMoviePlayerViewController alloc] initWithContentURL:movieURL];
    [self presentMoviePlayerViewControllerAnimated:movieController];
    [movieController.moviePlayer play];

}

- (void) updateViews{
    if (!self.detailExhibit) self.detailExhibit = self.exhibitList[0];
    self.titleLabel.text = [self.detailExhibit objectForKey:@"title"];
    self.authorLabel.text = [self.detailExhibit objectForKey:@"author"];
    self.backgroundImageView.image = [UIImage imageNamed:[self.detailExhibit objectForKey:@"image_name"]];
}
- (void) updateViewsWithExhibit:(NSDictionary *) exhibit{
    self.detailExhibit = exhibit;
    [self updateViews];
}


#pragma mark <ExhibitSelectionDelegate>
- (void) didSelectExhibit:(NSDictionary *)exhibit sender:(id)sender{
    [self updateViewsWithExhibit:exhibit];
}
@end
