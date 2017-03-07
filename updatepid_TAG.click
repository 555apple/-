//****************控制启动/关闭模块****************
updatepid_TAG_control :: Updatepid_TAG_Control;

FromDevice(h2-eth1) -> [0]updatepid_TAG_control;

updatepid_TAG_control[0] -> Discard();

//****************发送流程************************
updatepid_TAG_send:: Updatepid_TAG_Send;

TimedSource(INTERVAL 1,DATA UPDATEPID)->[0]updatepid_TAG_send;

out1 :: Queue(200) -> ToDevice(h2-eth1);

updatepid_TAG_send[0]->out1;
updatepid_TAG_send[1]->Discard();

//*****************处理流程**********************
updatepid_TAG_process :: Updatepid_TAG_Process;

FromDevice(h2-eth6) -> [0]updatepid_TAG_process; 

updatepid_TAG_process[0]->Discard();

