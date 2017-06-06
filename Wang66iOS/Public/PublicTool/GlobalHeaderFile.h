//
//  GlobalHeaderFile.h
//  Wang66iOS
//
//  Created by renmaituan on 2017/5/24.
//  Copyright © 2017年 wyw. All rights reserved.
//

#ifndef GlobalHeaderFile_h
#define GlobalHeaderFile_h



#define IMAGE(x)  [UIImage imageNamed:x]





#define FONT(x) [UIFont systemFontOfSize:x]
#define BFONT(x) [UIFont boldSystemFontOfSize:x]






#define ColorRGB(r,g,b) [UIColor colorWithRed:r green:g blue:b alpha:1.f]

#define ColorRGBA(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]

#define RandomColor ColorRGB(arc4random_uniform(256)/255.f, arc4random_uniform(256)/255.f, arc4random_uniform(256)/255.f)

#define WhiteColor [UIColor whiteColor]

#define LightGrayColor [UIColor lightGrayColor]

#define RedColor [UIColor redColor]

#define ClearColor [UIColor clearColor]






#define NilStrHandle(str) (str==nil || [str isKindOfClass:[NSNull class]] ? @"" : str)








#define IOSVersion [[UIDevice currentDevice] systemVersion]

#define IOSVersion_equal(version) ([version compare:IOSVersion options:NSNumericSearch] == NSOrderedSame)

#define IOSVersion_lessThan(version) ([version compare:IOSVersion options:NSNumericSearch] == NSOrderedDescending)

#define IOSVersion_lessThanEqual(version) ([version compare:IOSVersion options:NSNumericSearch] != NSOrderedAscending)

#define IOSVersion_moreThan(version) ([version compare:IOSVersion options:NSNumericSearch] == NSOrderedAscending)

#define IOSVersion_moreThanEqual(version) ([version compare:IOSVersion options:NSNumericSearch] != NSOrderedDescending)





#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define ContentView_Height Screen_Height-64.f  // Screen_Height减去导航栏的高度







#define NilStringHandle(str) str==nil ? @"" : str

#define PageSize 20


#endif /* GlobalHeaderFile_h */
