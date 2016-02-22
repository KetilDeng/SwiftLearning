//
//  FMDBManager.h
//  FMDB_Manager
//
//  Created by Kerry on 16/2/20.
//  Copyright © 2016年 DKT. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@interface FMDBManager : NSObject

@property (nonatomic, strong) FMDatabase *database;;

+(instancetype)sharedInstance;

/*!
 *  @brief 创建表
 *
 *  @param model  表名
 *  @param suffix 表名后缀（公用model需要后缀来标识为不同表）
 */
-(void)creatTable:(id)model andWithSuffix:(NSString *)suffix;

/*!
 *  @brief 插入、更新表
 *
 *  @param model  表名
 *  @param suffix 表名后缀
 */
-(void)insertAndUpdateModelToDatabase:(id)model andWithSuffix:(NSString *)suffix;

/*!
 *  @brief 插入、更新表
 *
 *  @param model  表名
 *  @param suffix 表名后缀
 *  @param key    插入、更新的key
 *  @param value  插入、更新的值
 */
-(void)insertAndUpdateModelToDatabase:(id)model andWithSuffix:(NSString *)suffix andKey:(NSString *)key andValue:(NSString *)value;

/*!
 *  @brief 根据键值对删除表中数据
 *
 *  @param model  表名
 *  @param suffix 表名后缀
 *  @param key    删除的key
 *  @param value  删除的值
 */
-(void)deleteModelInDatabase:(id)model andWithSuffix:(NSString *)suffix andKey:(NSString *)key andValue:(NSString *)value;

/*!
 *  @brief 删除表
 *
 *  @param model  表名
 *  @param suffix 表名后缀
 */
- (void)deleteTable:(id)model andWithSuffix:(NSString *)suffix;

/*!
 *  @brief 查询表中所有数据
 *
 *  @param model  表名
 *  @param suffix 表名后缀
 *
 *  @return 查询结果
 */
- (NSArray *)selectModelArrayInDatabase:(id)model andWithSuffix:(NSString *)suffix;

/*!
 *  @brief 获取model的属性名
 *
 *  @param model model
 *
 *  @return 获取结果
 */
- (NSArray *)getAllProperties:(id)model;

@end
