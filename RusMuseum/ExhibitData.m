//
//  GalleryData.m
//  RusMuseum
//
//  Created by admin on 17.11.14.
//  Copyright (c) 2014 crimsonjackets. All rights reserved.
//

#import "ExhibitData.h"

@implementation ExhibitData
+(NSArray *)getExhibitDataForShowRoom:(int) showRoomId{
    if (showRoomId == 34){
        return  @[@{@"title": @"Корабельная роща", @"author": @"И.И.Шишкин", @"info": @"", @"video":@"", @"image_name": @"korabel_roscha"},
                  @{@"title": @"Покорение Сибири Ермаком", @"author": @"В.И.Суриков", @"info": @"", @"video":@"", @"image_name": @"pokorenie"},
                  @{@"title": @"Переход Суворова через Альпы", @"author": @"В.И.Суриков", @"info": @"", @"video":@"", @"image_name": @"perehod_suvorova"}];
    }
    if (showRoomId == 25){
        return  @[@{@"title": @"Взятие снежного городка", @"author": @"В.И.Суриков", @"info": @"", @"video":@"", @"image_name": @"vzyatie"},
                  @{@"title": @"Бурлаки на Волге", @"author": @"И.Е.Репин", @"info": @"", @"video":@"", @"image_name": @"burlaki"}];
    }
    return nil;
}
@end
