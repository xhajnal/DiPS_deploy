dtmc 
 
const double p;
const double q1;
const double q2;
const double q3;
const double q4;

module bees_5
       // ai - state of agent i:  -1:init 0:total_failure 1:succes 2:failure_after_first_attempt
       a0 : [-1..2] init -1; 
       a1 : [-1..2] init -1; 
       a2 : [-1..2] init -1; 
       a3 : [-1..2] init -1; 
       a4 : [-1..2] init -1; 
       b : [0..1] init 0; 

       //  initial transition
       []   a0 = -1 & a1 = -1  & a2 = -1  & a3 = -1  & a4 = -1 -> 1.0*p*p*p*p*p: (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=1) + 5.0*p*p*p*p*(1-p): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=2) + 10.0*p*p*p*(1-p)*(1-p): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=2) & (a4'=2) + 10.0*p*p*(1-p)*(1-p)*(1-p): (a0'=1) & (a1'=1) & (a2'=2) & (a3'=2) & (a4'=2) + 5.0*p*(1-p)*(1-p)*(1-p)*(1-p): (a0'=1) & (a1'=2) & (a2'=2) & (a3'=2) & (a4'=2) + 1.0*(1-p)*(1-p)*(1-p)*(1-p)*(1-p): (a0'=2) & (a1'=2) & (a2'=2) & (a3'=2) & (a4'=2);

       // some ones, some zeros transitions
       []   a0 = 0 & a1 = 0 & a2 = 0 & a3 = 0 & a4 = 0 -> (a0'= 0) & (a1'= 0) & (a2'= 0) & (a3'= 0) & (a4'= 0) & (b'=1);
       []   a0 = 1 & a1 = 0 & a2 = 0 & a3 = 0 & a4 = 0 -> (a0'= 1) & (a1'= 0) & (a2'= 0) & (a3'= 0) & (a4'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 0 & a3 = 0 & a4 = 0 -> (a0'= 1) & (a1'= 1) & (a2'= 0) & (a3'= 0) & (a4'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 0 & a4 = 0 -> (a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 0) & (a4'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 0 -> (a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 -> (a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (b'=1);

       // some ones, some twos transitions
       []   a0 = 1 & a1 = 2 & a2 = 2 & a3 = 2 & a4 = 2 -> 1.0*(1-q1)*(1-q1)*(1-q1)*(1-q1): (a0'=1) & (a1'=0) & (a2'=0) & (a3'=0) & (a4'=0) + 4.0*q1*(1-q1)*(1-q1)*(1-q1): (a0'=1) & (a1'=1) & (a2'=0) & (a3'=0) & (a4'=0) + 6.0*q1*q1*(1-q1)*(1-q1): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=0) & (a4'=0) + 4.0*q1*q1*q1*(1-q1): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=0) + 1.0*q1*q1*q1*q1: (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=1);
       []   a0 = 1 & a1 = 1 & a2 = 2 & a3 = 2 & a4 = 2 -> 1.0*(1-q2)*(1-q2)*(1-q2): (a0'=1) & (a1'=1) & (a2'=0) & (a3'=0) & (a4'=0) + 3.0*q2*(1-q2)*(1-q2): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=0) & (a4'=0) + 3.0*q2*q2*(1-q2): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=0) + 1.0*q2*q2*q2: (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 2 & a4 = 2 -> 1.0*(1-q3)*(1-q3): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=0) & (a4'=0) + 2.0*q3*(1-q3): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=0) + 1.0*q3*q3: (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 2 -> 1.0*(1-q4): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=0) + 1.0*q4: (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=1);

       // all twos transition
       []   a0 = 2 & a1 = 2  & a2 = 2  & a3 = 2  & a4 = 2 -> (a0'= 0) & (a1'= 0) & (a2'= 0) & (a3'= 0) & (a4'= 0);
endmodule 

rewards "coin_flips" 
       a0 = 0 & a1 = 0 & a2 = 0 & a3 = 0 & a4 = 0:0;
       a0 = 1 & a1 = 0 & a2 = 0 & a3 = 0 & a4 = 0:1;
       a0 = 1 & a1 = 1 & a2 = 0 & a3 = 0 & a4 = 0:2;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 0 & a4 = 0:3;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 0:4;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1:5;
endrewards 
