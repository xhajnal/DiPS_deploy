dtmc 
 
const double p;
const double q1;

module multiparam_bees_2
       // ai - state of agent i:  -1:init 0:total_failure 1:succes 2:failure_after_first_attempt
       a0 : [-1..2] init -1; 
       a1 : [-1..2] init -1; 
       b : [0..1] init 0; 

       //  initial transitions
       // some -1, some 1 transitions
       []   a0 = -1 & a1 = -1 -> p: (a0' = -1) & (a1' = 1) + 1-p: (a0' = -1) & (a1' = 2);
       []   a0 = -1 & a1 = 1 -> p: (a0' = 1) & (a1' = 1) + 1-p: (a0' = 1) & (a1' = 2);

       // some -1, some 2 transitions
       []   a0 = -1 & a1 = 2-> p: (a0' = 1) & (a1' = 2) + 1-p: (a0' = 2) & (a1' = 2);

       // some -1, some 1, some 2 transitions

       // some ones, some zeros transitions
       []   a0 = 0 & a1 = 0 -> (a0'= 0) & (a1'= 0) & (b'=1);
       []   a0 = 1 & a1 = 0 -> (a0'= 1) & (a1'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 -> (a0'= 1) & (a1'= 1) & (b'=1);

       // some ones, some twos transitions
       []   a0 = 1 & a1 = 2 -> q1:(a0'= 1) & (a1'= 1) + 1-q1:(a0'= 1) & (a1'= 0);

       // some ones, some twos, some zeros transitions

       // all twos transition
       []   a0 = 2 & a1 = 2 -> (a0'= 0) & (a1'= 0);
endmodule 

rewards "coin_flips" 
       a0 = 0 & a1 = 0:0;
       a0 = 1 & a1 = 0:1;
       a0 = 1 & a1 = 1:2;
endrewards 
