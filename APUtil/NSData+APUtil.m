//
//  NSData+APUtil.m
//  Pods
//
//  Created by Flavio Negrão Torres on 07/05/15.
//
//

#import "NSData+APUtil.h"

@implementation NSData (APUtil)

- (NSData*) mmaped {
    //http://stackoverflow.com/questions/15932492/ipad-parsing-an-extremely-huge-json-file-between-50-and-100-mb
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *filePath = [NSString stringWithFormat:@"%@%@", basePath, @"json_temp"];
    
    NSError* writeError = nil;
    [self writeToFile:filePath options:NSDataWritingAtomic error:&writeError];
    
    NSError* readError;
    return [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedAlways | NSDataReadingUncached error:&readError];
}

@end
