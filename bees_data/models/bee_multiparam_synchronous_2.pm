dtmc 
 
const double r_0;
const double r_1;

module multi_param_bee_agents_2
       // ai - state of agent i: 3:init 1:success -j: failure when j amount of pheromone present 
       a0 : [-1..3] init 3; 
       a1 : [-1..3] init 3; 
       b : [0..1] init 0; 

       //  initial transition
       []   a0 = 3 & a1 = 3 & b = 0 -> 1.0*r_0*r_0: (a0'=1) & (a1'=1) + 2.0*r_0*(1-r_0): (a0'=1) & (a1'=0) + 1.0*(1-r_0)*(1-r_0): (a0'=0) & (a1'=0);

       // some ones, some nonpositive final transitions
       []   a0 = 0 & a1 = 0 & b = 0  -> (a0'= 0) & (a1'= 0) & (b'=1);
       []   a0 = 1 & a1 = -1 & b = 0  -> (a0'= 1) & (a1'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & b = 0  -> (a0'= 1) & (a1'= 1) & (b'=1);

       // some ones, some nonpositive transitions
       []   a0 = 1 & a1 = 0 & b = 0  -> 1.0*(1-(r_1 - r_0)/(1 - r_0)): (a0'=1) & (a1'=-1) + 1.0* ((r_1 - r_0)/(1 - r_0)): (a0'=1) & (a1'=1);
endmodule 

rewards "mean" 
       a0 = 0 & a1 = 0:0;
       a0 = 1 & a1 = -1:1;
       a0 = 1 & a1 = 1:2;
endrewards 
rewards "mean_squared" 
       a0 = 0 & a1 = 0:0;
       a0 = 1 & a1 = -1:1;
       a0 = 1 & a1 = 1:4;
endrewards 
