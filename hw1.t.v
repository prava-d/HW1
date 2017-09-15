`include "hw1.v"

module demorgan_test ();

  // Instantiate device/module under test
  reg A, B;                // Primary test inputs
  wire nA, nB, nAandnB, nAorB;    // Test outputs (for demorgan1, ~A~B = ~(A+B))
  wire nAornB, n_AandB;		  // (for demorgan2, ~A+~B = ~(AB)) --> also don't have to refine wires from before

  demorgan1 dut1(A, B, nA, nB, nAandnB, n_AorB);  // Module to be tested
  demorgan2 dut2(A, B, nA, nB, nAornB, n_AandB);  // have to use different duts for testing
  

  // Run sequence of test stimuli
  initial begin
    $display("A B | ~A ~B || ~A~B | ~(A+B) || ~A+~B | ~(AB)");            // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  %b ||   %b  |    %b   ||   %b   |   %b", A,B, nA, nB, nAandnB, n_AorB, nAornB, n_AandB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b  %b ||   %b  |    %b   ||   %b   |   %b", A,B, nA, nB, nAandnB, n_AorB, nAornB, n_AandB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b ||   %b  |    %b   ||   %b   |   %b", A,B, nA, nB, nAandnB, n_AorB, nAornB, n_AandB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b ||   %b  |    %b   ||   %b   |   %b", A,B, nA, nB, nAandnB, n_AorB, nAornB, n_AandB);
  end
endmodule    // End demorgan_test
