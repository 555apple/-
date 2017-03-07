//************隧道维护模块**********
tbg_maint :: TBG_MAINT;

FromDevice(h4-eth2)->[0]tbg_maint;

out1 :: Queue(200) -> ToDevice(h4-eth2); 

tbg_maint[0] -> out1;