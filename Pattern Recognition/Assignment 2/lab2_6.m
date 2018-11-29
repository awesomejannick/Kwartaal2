clear all;
close all;
format long;

ps = [0.005, 0.0003];
pns = [0.0001, 0.000004];
isspam(ps,pns);

ps = [0.00015, 0.0007];
pns = [0.00025, 0.00014];
isspam(ps,pns);