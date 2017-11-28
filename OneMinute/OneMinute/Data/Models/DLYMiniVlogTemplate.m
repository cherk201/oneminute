
//
//  DLYMiniVlogTemplate.m
//  OneMinute
//
//  Created by chenzonghai on 10/07/2017.
//  Copyright © 2017 动旅游. All rights reserved.
//

#import "DLYMiniVlogTemplate.h"
#import <RNDecryptor.h>

@implementation DLYMiniVlogTemplate

-(instancetype)initWithTemplateId:(NSString *)templateId{
    
    if (self = [super init]) {
        
        if (templateId) {
            
            NSData *encryptedData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:templateId ofType:nil]];
            
            NSError *error;
            NSData *decryptedData = [RNDecryptor decryptData:encryptedData withPassword:@"dlyvlog2016" error:&error];
            
            if (!error) {
            }
            
            if (decryptedData) {
                NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:decryptedData options:NSJSONReadingMutableContainers error:nil];
                self.templateId = [dic objectForKey:@"id"];
                self.templateTitle = [dic objectForKey:@"title"];
                self.version = [dic objectForKey:@"version"];
                self.parts = [dic objectForKey:@"info"];
                self.BGM = [dic objectForKey:@"BGM"];
                self.subTitle1 = [dic objectForKey:@"subTitle1"];
                self.dateWaterMark = [dic objectForKey:@"dateWaterMark"];
                self.videoHeaderType = [[dic objectForKey:@"header"] integerValue];
                self.videoTailerType = [[dic objectForKey:@"tailer"] integerValue];
                self.templateDescription = [dic objectForKey:@"templateDescription"];
                self.sampleVideoName = [kTEMPLATE_SAMPLE_API stringByAppendingFormat:@"%@",[dic objectForKey:@"sampleVideoName"]];
            }else{
                DLYLog(@"模板脚本文件解析出错");
            }
        }else{
            templateId = kDEFAULT_TEMPLATE_NAME;
            DLYLog(@"模板名称为空");
        }
    }
    return self;
}

-(NSArray<DLYMiniVlogPart *> *)parts{
    
    NSMutableArray *mArray = [NSMutableArray array];
    
    for (int i = 0; i < _parts.count; i++) {
        NSDictionary *dic = (NSDictionary *)_parts[i];
        
        DLYMiniVlogPart *part = [[DLYMiniVlogPart alloc]init];
        part.partNum = [[dic objectForKey:@"partNum"] integerValue];
        part.partType = [[dic objectForKey:@"partType"] integerValue];
        part.ifCombin = [[dic objectForKey:@"ifCombin"] integerValue];
        part.dubStartTime = [dic objectForKey:@"dubStartTime"];
        part.dubStopTime = [dic objectForKey:@"dubStopTime"];
        part.recordType = [[dic objectForKey:@"recordType"] integerValue];
        part.soundType = [[dic objectForKey:@"soundType"] integerValue];
        part.BGMVolume = [[dic objectForKey:@"BGMVolume"] floatValue];
        part.transitionType = [[dic objectForKey:@"transitionType"] integerValue];
        part.shootGuide = [dic objectForKey:@"shootGuide"];
        [mArray addObject:part];
    }
    return [mArray copy];
}
-(void)combinDurationWithParts:(NSArray<DLYMiniVlogPart *> *)parts{
    
    for (DLYMiniVlogPart *part in parts) {
        if(part.partType == DLYMiniVlogPartTypeNormal){
            if(part.ifCombin){
                
            }else{
                
            }
        }else if (part.partType == DLYMiniVlogPartTypeVirtual){
            
        }
    };
}
@end
