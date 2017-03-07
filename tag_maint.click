//***************隧道维护模块********************
//************发包模块**********
tag_maint_send :: TAG_MAINT_SEND;

TimedSource(INTERVAL 0.5,DATA UPDATEPID)->[0]tag_maint_send;

out1 :: Queue(200) -> ToDevice(h2-eth6); 

tag_maint_send[0] -> out1;

//**********收包模块************
tag_maint_recv :: TAG_MAINT_RECV;

FromDevice(h2-eth6)->[0]tag_maint_recv;

//*********故障报告RM***********
trouble_report :: TROUBLE_REPORT;

TimedSource(INTERVAL 0.5,DATA UPDATEPID)->[0]trouble_report;

out2 :: Queue(200) -> ToDevice(h2-eth1); 

trouble_report[0] -> out2;

//********来自RM的故障确认*************
trouble_confirm :: TROUBLE_CONFIRM;

FromDevice(h2-eth1)->[0]trouble_confirm;
  
  