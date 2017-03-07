//*************************正向处理*************************
//*************向RM请求TBG**********
requst_tbg :: REQUST_TBG;

FromDevice(h2-eth0)-> [0]requst_tbg;

out7 :: Queue(200) -> ToDevice(h2-eth1); //向RM请求TBG信息

requst_tbg[0] -> out7;

//**************接收RM的回送***********
recv_tbg :: RECV_TBG;

FromDevice(h2-eth1)->[0]recv_tbg;

recv_tbg[0]->Discard;

//***********for client1****************
tunnel_tag :: CoLoR_Encapsulation;

FromDevice(h2-eth0) -> [0]tunnel_tag;

out1 :: Queue(200) -> ToDevice(h2-eth6);

tunnel_tag[0]->out1;

//***********for client2***************
tunnel_tag2 :: CoLoR_Encapsulation;

FromDevice(h2-eth2) -> [0]tunnel_tag2;

tunnel_tag2[0]->out1;

//***********for client3***************
tunnel_tag4 :: CoLoR_Encapsulation;

FromDevice(h2-eth3) -> [0]tunnel_tag4;

tunnel_tag4[0]->out1;

//***********for client4***************
tunnel_tag6 :: CoLoR_Encapsulation;

FromDevice(h2-eth4) -> [0]tunnel_tag6;

tunnel_tag6[0]->out1;

//***********for client5***************
tunnel_tag8 :: CoLoR_Encapsulation;

FromDevice(h2-eth5) -> [0]tunnel_tag8;

tunnel_tag8[0]->out1;

//*************************反向处理*************************
tunnel_tag0 :: CoLoR_Decapsulation;

FromDevice(h2-eth6) -> [0]tunnel_tag0;

out2 :: Queue(200) -> ToDevice(h2-eth0);
out3 :: Queue(200) -> ToDevice(h2-eth2);
out4 :: Queue(200) -> ToDevice(h2-eth3);
out5 :: Queue(200) -> ToDevice(h2-eth4);
out6 :: Queue(200) -> ToDevice(h2-eth5);

tunnel_tag0[0]->out2;
tunnel_tag0[1]->out3;
tunnel_tag0[2]->out4;
tunnel_tag0[3]->out5;
tunnel_tag0[4]->out6;
tunnel_tag0[5]->Discard();  //丢弃更新包

//*******************************更新部分********************************
//****************控制启动/关闭模块****************
updatepid_TAG_creat :: Updatepid_TAG_Creat;

FromDevice(h2-eth1) -> [0]updatepid_TAG_creat;

updatepid_TAG_creat[0] -> out7; //回复对方紧急更新包
updatepid_TAG_creat[1] -> Discard();

//****************发送流程************************
updatepid_TAG_send:: Updatepid_TAG_Send;

TimedSource(INTERVAL 1,DATA UPDATEPID)->[0]updatepid_TAG_send;

updatepid_TAG_send[0]->out7; 
updatepid_TAG_send[1]->Discard();

//*****************处理流程**********************
updatepid_TAG_process :: Updatepid_TAG_Process;

FromDevice(h2-eth6) -> [0]updatepid_TAG_process; 

updatepid_TAG_process[0]->Discard();

/*
//*******************************隧道维护部分******************************
//************发包模块**********
tag_maint_send :: TAG_MAINT_SEND;

TimedSource(INTERVAL 0.5,DATA UPDATEPID)->[0]tag_maint_send;

tag_maint_send[0] -> out1;

//**********收包模块************
tag_maint_recv :: TAG_MAINT_RECV;

FromDevice(h2-eth6)->[0]tag_maint_recv;

//*********故障报告RM***********
trouble_report :: TROUBLE_REPORT;

TimedSource(INTERVAL 0.5,DATA UPDATEPID)->[0]trouble_report;

trouble_report[0] -> out7;

//********来自RM的故障确认*************
trouble_confirm :: TROUBLE_CONFIRM;

FromDevice(h2-eth1)->[0]trouble_confirm;
*/