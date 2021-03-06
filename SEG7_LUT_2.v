module SEG7_LUT_2 ( oSEG0,oSEG0_DP,oSEG1,oSEG1_DP,iDIG);
input [7:0] iDIG;
output [6:0] oDEG0,oSEG1;
output		 oSEG0_DP,oSEG1_DP;

SEG7_LUT u0 ( oSEG0,oSEG0_DP,iDIG[3:0] );
SEG7_LUT u1 ( oSEG1,oSEG1_DP,iDIG[7:4] );

endmodule
