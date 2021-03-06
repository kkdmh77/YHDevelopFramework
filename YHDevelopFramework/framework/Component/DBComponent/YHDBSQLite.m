//
//  YHDBSQLite.m
//  YHDevelopFramework
//
//  Created by 君若见故 on 16/7/20.
//  Copyright © 2016年 isoftstone. All rights reserved.
//

#import "YHDBSQLite.h"

@interface YHDBSQLite ()

@property (nonatomic,strong) FMDatabaseQueue *dbQueue;

@end

@implementation YHDBSQLite

static YHDBSQLite *dbManager;

+ (instancetype)sharedDBManagerWithFile:(NSString *)path {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dbManager = [[self alloc] init];
        dbManager.dbQueue = [FMDatabaseQueue databaseQueueWithPath:path];
    });
    return dbManager;
}
#pragma mark - define

- (void)inTransaction:(void (^)(FMDatabase *, BOOL *))block {

    [self.dbQueue inTransaction:block];
}
//操作数据库
- (void)inDatabase:(void (^)(FMDatabase *db))block {
    [self.dbQueue inDatabase:block];
}

#pragma mark - private



@end
