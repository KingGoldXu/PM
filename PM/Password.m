//
//  Password.m
//  PM
//
//  Created by Apple on 15/12/13.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "Password.h"

@implementation Password

-(void)encodeWithCoder:(NSCoder *)aCoder{
//    NSLog(@"encode方法");
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.pid forKey:@"pid"];
    [aCoder encodeObject:self.groupName forKey:@"groupName"];
    [aCoder encodeObject:self.creationDate forKey:@"creationDate"];
    
}

-(id)initWithCoder:(NSCoder *)aDecoder{
//    NSLog(@"decode方法");
    if(self=[super init]){
        self.title=[aDecoder decodeObjectForKey:@"title"];
        self.password=[aDecoder decodeObjectForKey:@"password"];
        self.pid=[aDecoder decodeObjectForKey:@"pid"];
        self.groupName=[aDecoder decodeObjectForKey:@"groupName"];
        self.creationDate=[aDecoder decodeObjectForKey:@"creationDate"];
    }
    return self;
}

-(id)initWithPW:(Password *)aPassword{
//    NSString *title=[[NSString alloc]initWithString:aPassword.title];
//    NSString *pid=[[NSString alloc]initWithString:aPassword.pid];
//    NSString *password=[[NSString alloc]initWithString:aPassword.password];
    self.title=[aPassword.title copy];
    self.pid=[aPassword.pid copy];
    self.password=[aPassword.password copy];
    return self;
}

@end
