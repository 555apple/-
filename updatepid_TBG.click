//*****************处理流程********************
updatepid_tbg_process :: Updatepid_TBG_Process;

FromDevice(h4-eth0) -> [0]updatepid_tbg_process; 

out1 :: Queue(200) -> ToDevice(h4-eth2);

updatepid_tbg_process[0]->out1;
updatepid_tbg_process[1]->Discard();

//****************发送流程********************
updatepid_tbg_send:: Updatepid_TBG_Send;

TimedSource(INTERVAL 1,DATA UPDATEPID)->[0]updatepid_tbg_send;

out2 :: Queue(200) -> ToDevice(h4-eth0);

updatepid_tbg_send[0]->out2;
updatepid_tbg_send[1]->Discard();
