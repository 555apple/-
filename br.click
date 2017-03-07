cr  :: CR;
cr1  :: CR1;

FromDevice(h10-eth0) -> [0]cr;
FromDevice(h10-eth1) -> [0]cr1;

out1 :: Queue(200) -> ToDevice(h10-eth1);
out2 :: Queue(200) -> ToDevice(h10-eth0);

cr[0]->out1;
cr1[0]->out2;

