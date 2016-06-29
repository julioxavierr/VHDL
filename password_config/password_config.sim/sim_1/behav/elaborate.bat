@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto abc768b3cec34fd6b72e7f3a8656a93e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot password_config_tb_behav xil_defaultlib.password_config_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
