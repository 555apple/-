addpid :: AddPID;
addpid1 :: AddPID1;
sendTBG :: SendTBG;
register :: Register;
fault_handing :: FAULT_HANDING;

FromDevice(h3-eth0)->[0]sendTBG;
FromDevice(h3-eth0) -> [0]addpid; 
FromDevice(h3-eth1) -> [0]addpid1;
FromDevice(h3-eth0)->[0]fault_handing; 

out1 :: Queue(200) -> ToDevice(h3-eth1);
out2 :: Queue(200) -> ToDevice(h3-eth0);

addpid[0]->out1;
addpid1[0]->out2;
sendTBG[0]->out2;
fault_handing[0]->out2;
