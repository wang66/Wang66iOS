//
//  URLPath.h
//  HttpManagerDemo
//
//  Created by 王亚文 on 2017/5/7.
//  Copyright © 2017年 wyw. All rights reserved.
//

//#ifndef URLPath_h
//#define URLPath_h

#define OPEN_TEST 1

//#endif


#if OPEN_TEST == 0  // OPEN_TEST，0：开发环境     1：测试环境      2：预发布环境     3：正式环境

#define BasicURL  @"http://api.91stjk.com:80"



#else

#define BasicURL  @"http://api.91stjk.com:80"


#endif /* URLPath_h */






#define HotList @"/pingtuan/api/hots/list-hot"


