TUNNLE_README.cc
一、各类SID标识定义:L_SID[20]
（1）隧道包标志
	char TUNNEL_SID[15]={'t','u','n','n','e','l','_','s','e','r','v','i','c','e','\0'};    //隧道包标志
（2）更新包标志
	char UPDATE_SID[10]={'p','i','d','u','p','d','a','t','e','\0'};                        //更新包标志
（3）请求TBG包标志
	struct TEST_SID                                                                                     //TBG_REQUST的SID形式
            {
	          char tunnel_sid[15];//最后一位用来存‘\0                              //为隧道包标志
	          IPAddress dst_ip;                                                                    // 目的IP
              };
（4）保活包标志
	uint8_t maint_l_sid[13]={'t','u','n','n','e','l','_','m','a','i','n','t','\0'};   //keepalive包
（5）故障上报标志
	uint8_t  trouble_l_sid[15]={'t','r','o','u','b','l','e','_','r','e','p','o','r','t','\0'}; //故障标志包
（6）RM确认有故障标志
	char TROUBLE_YES[20]={'t','r','o','u','b','l','e','_','c','o','n','f','i','r','m','_','y','e','s','\0'}; //故障标志包
（7）RM确认无故障标志
	char TROUBLE_NO[19]={'t','r','o','u','b','l','e','_','c','o','n','f','i','r','m','_','n','o','\0'}; //无故障标志包
（8）隧道关闭通告包
	char TUNNEL_DOWN[14]={'p','i','d','u','p','d','a','t','e','d','o','w','n','\0'}; //隧道关闭通告包，由PID更新包通告，方便RM对更新包识别
