//*************·判断用户类型 向RM请求TBG**********
requst_tbg :: REQUST_TBG;

FromDevice(h2-eth0)-> [0]requst_tbg;

out7 :: Queue(200) -> ToDevice(h2-eth1); //向RM请求TBG信息

requst_tbg[0] -> out7;

//**************接收RM的回送***********
recv_tbg :: RECV_TBG;

FromDevice(h2-eth1)->[0]recv_tbg;

recv_tbg[0]->Discard;

//*******************************更新部分********************************
//****************控制启动/关闭模块****************
updatepid_TAG_control :: Updatepid_TAG_Control;

FromDevice(h2-eth1) -> [0]updatepid_TAG_control;

updatepid_TAG_control[0] -> Discard();