function gen_defines(defines)
  filename = strcat("defines_",num2str(defines.testcase),".sv");
  fid = fopen(filename, "w");
  
  fprintf(fid, "`define DIV(N, D) (N%%D==0) ? (N/D) : (N/D+1)\n");
  fprintf(fid,"\n");
  fprintf(fid, "`define P_INP_DATA_W \t%d\n",defines.p_data_width);
  fprintf(fid, "`define P_INTERPOLATION %d\n",defines.p_interpolation_factor);
  fprintf(fid, "`define P_COEFF_L \t%d\n",defines.p_coeff_length);
  fprintf(fid, "`define P_COEFF_W \t%d\n",defines.p_coeff_width);
  fprintf(fid, "`define P_TF_DF \t%d\n",defines.p_tf_df);
  fprintf(fid, "`define P_COMM_CCW_CW \t%d\n",defines.p_comm_ccw);
  fprintf(fid, "`define P_MUL_CCW_CW \t%d\n",defines.p_mul_ccw);
  fprintf(fid, "`define P_COMM_PHA \t%d\n",defines.p_comm_phase);
  fprintf(fid, "`define P_OUP_W     \t(`P_INP_DATA_W+`P_COEFF_W+(`DIV(`P_COEFF_L,`P_INTERPOLATION)))\n");
  fprintf(fid, "\n");
  fprintf(fid, "`define TESTCASE\t%d\n",defines.testcase);
  fprintf(fid, "\n");
  fprintf(fid, "`define NULL \t0");
  
  fclose(fid);
  cmd = strcat("mv defines_",num2str(defines.testcase),".sv ../sim/testcases/stimuli/");
  system(cmd);