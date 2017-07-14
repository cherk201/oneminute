//
//  DLYResource.h
//  OneMinute
//
//  Created by chenzonghai on 12/07/2017.
//  Copyright © 2017 动旅游. All rights reserved.
//

#import "DLYModule.h"

typedef  NS_ENUM(NSInteger, DLYResourceType){
    DLYResourceTypeVideoHeader = 0,
    DLYResourceTypeVideoTailer,
    DLYResourceTypeBGM,
    DLYResourceTypeSoundEffect,
    DLYResourceTypeSampleVideo
};

@interface DLYResource : DLYModule

@property (nonatomic, strong) NSFileManager                *fileManager;
@property (nonatomic, strong) NSString                     *resourceFolderPath;
@property (nonatomic, strong) NSString                     *resourcePath;

/**
 加载资源文件

 @param resourceType 资源类型
 @param fileName 文件名称
 @return 返回在沙盒中的地址
 */
- (NSURL *) loadResourceWithType:(DLYResourceType )resourceType fileName:(NSString *)fileName;

/**
 加载草稿视频片段文件

 @return 返回草稿片段
 */
-(NSArray *)loadBDraftParts;

/**
 保存到沙盒文件夹

 @param sandboxFolderType 保存文件夹类型
 @param subfolderName 子文件夹名称
 @param suffixName 文件后缀
 @return 返回保存后的URL
 */
- (NSURL *) saveToSandboxFolderType:(NSSearchPathDirectory)sandboxFolderType subfolderName:(NSString *)subfolderName suffixType:(NSString *)suffixName;

@end
