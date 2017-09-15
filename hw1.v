// this module proves the part of De Morgan's law that asserts ~A~B = ~(A+B)
module demorgan1
(
  input  A,          // Single bit inputs
  input  B,
  output nA,         // Output intermediate complemented inputs
  output nB,
  output nAandnB,    // Single bit outputs, ~A~B
  output n_AorB	     // ~(A+B)
);

  wire nA;
  wire nB;
  not Ainv(nA, A);   // Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);
  and andgate(nAandnB, nA, nB); 	// AND gate produces nAandnB from nA and nB
  nor norgate(n_AorB, A, B);		// NOR gate produces n_AorB from A and B

endmodule


// this module proves the part of De Morgan's law that asserts ~A+~B = ~(AB)
// I know that since this overlaps very well with the previous module, I could have just added the extra single bit outputs and the extra gates to above --> but I kind of wanted to see how one would implement multiple modules (and I did learn through the process, but apologies if it is kind of redundant!)
module demorgan2
(
  input  A,      
  input  B,
  output nA,         
  output nB,
  output nAornB,      // ~A+~B
  output n_AandB      // ~(AB)
);

  wire nA;
  wire nB;
  not Ainv(nA, A);  	
  not Binv(nB, B);
  or orgate(nAornB, nA, nB);            // OR gate produces nAornB from nA and nB
  and andgate(nAandnB, nA, nB); 	
  nand nandgate(n_AandB, A, B);		// NAND gate produces n_AandB from A and B

endmodule
