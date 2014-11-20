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
        return  @[@{@"title": @"Девятый вал", @"author": @"И.К.Айвазовский", @"info": @"", @"video":@"", @"image_name": @"Devyatui_val"},
                  @{@"title": @"Черный квадрат", @"author": @"К.С.Малевич", @"info": @"", @"video":@"", @"image_name": @"Black_square"},
                  @{@"title": @"Вид памятника Петру I на Сенатской площади", @"author": @"В.И.Суриков", @"info": @"", @"video":@"", @"image_name": @"Petr_I"}];
    }
    if (showRoomId == 25){
        return  @[@{@"title": @"Последний день Помпеи", @"author": @"К.П.Брюллов", @"info": @"", @"video":@"", @"image_name": @"startBackground"},
                  @{@"title": @"Лунная ночь на Днепре", @"author": @"А.И.Куинджи", @"info": @"", @"video":@"", @"image_name": @"Lunnaya_noch"},
                  @{@"title": @"Корабельная роща", @"author": @"И.И.Шишкин", @"info": @"", @"video":@"", @"image_name": @"korabel_roscha"}];
    }
    return nil;
}
@end
