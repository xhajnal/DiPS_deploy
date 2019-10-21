dtmc 
 
const double p;
const double q;

module bees_3
       // ai - state of agent i:  -1:init 0:total_failure 1:succes 2:failure_after_first_attempt
       a0 : [-1..2] init -1; 
       a1 : [-1..2] init -1; 
       a2 : [-1..2] init -1; 
       b : [0..1] init 0; 

       //  initial transition
       []   a0 = -1 & a1 = -1  & a2 = -1 -> 1.0*p*p*p: (a0'=1) & (a1'=1) & (a2'=1) + 3.0*p*p*(1-p): (a0'=1) & (a1'=1) & (a2'=2) + 3.0*p*(1-p)*(1-p): (a0'=1) & (a1'=2) & (a2'=2) + 1.0*(1-p)*(1-p)*(1-p): (a0'=2) & (a1'=2) & (a2'=2);

       // some ones, some zeros transitions
       []   a0 = 0 & a1 = 0 & a2 = 0 -> (a0'= 0) & (a1'= 0) & (a2'= 0) & (b'=1);
       []   a0 = 1 & a1 = 0 & a2 = 0 -> (a0'= 1) & (a1'= 0) & (a2'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 0 -> (a0'= 1) & (a1'= 1) & (a2'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 -> (a0'= 1) & (a1'= 1) & (a2'= 1) & (b'=1);

       // some ones, some twos transitions
       []   a0 = 1 & a1 = 2 & a2 = 2 -> q:(a0'= 1) & (a1'= 1) & (a2'= 2) + 1-q:(a0'= 1) & (a1'= 2) & (a2'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 2 -> q:(a0'= 1) & (a1'= 1) & (a2'= 1) + 1-q:(a0'= 1) & (a1'= 1) & (a2'= 0);

       // some ones, some twos, some zeros transitions
       []   a0 = 1 & a1 = 2 & a2 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 0) + 1-q: (a0' = 1) & (a1'= 0) & (a2'= 0);

       // all twos transition
       []   a0 = 2 & a1 = 2  & a2 = 2 -> (a0'= 0) & (a1'= 0) & (a2'= 0);
endmodule 

rewards "coin_flips" 
       a0 = 0 & a1 = 0 & a2 = 0:0;
       a0 = 1 & a1 = 0 & a2 = 0:1;
       a0 = 1 & a1 = 1 & a2 = 0:2;
       a0 = 1 & a1 = 1 & a2 = 1:3;
endrewards 
