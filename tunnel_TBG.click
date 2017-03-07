
//***************解封装处理************
tunnel_tbg::  TBG_CoLoR_Decapsulation;

FromDevice(h4-eth2) -> [0]tunnel_tbg;

out1 :: Queue(200) -> ToDevice(h4-eth1);

tunnel_tbg[0]->out1;
tunnel_tbg[1]->Discard();
//**************封装处理*************
tunnel_tbg1 :: TBG_CoLoR_Encapsulation;

FromDevice(h4-eth1) -> [0]tunnel_tbg1;

out2 :: Queue(200) -> ToDevice(h4-eth2);

tunnel_tbg1[0]->out2;

//*******************************更新部分********************************
//*****************处理流程*******************
updatepid_tbg_process :: Updatepid_TBG_Process;

FromDevice(h4-eth0) -> [0]updatepid_tbg_process; 

updatepid_tbg_process[0]->out2;
updatepid_tbg_process[1]->Discard();

//****************发送流程********************
updatepid_tbg_send:: Updatepid_TBG_Send;

TimedSource(INTERVAL 1,DATA UPDATEPID)->[0]updatepid_tbg_send;

out3 :: Queue(200) -> ToDevice(h4-eth0);

updatepid_tbg_send[0]->out3;
updatepid_tbg_send[1]->Discard();

/*
//************隧道维护模块**********
tbg_maint :: TBG_MAINT;

FromDevice(h4-eth2)->[0]tbg_maint;

tbg_maint[0] -> out2;
*/