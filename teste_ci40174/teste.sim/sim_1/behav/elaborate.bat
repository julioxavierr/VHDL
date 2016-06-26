@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto b53300a852ed477989ff50c35d1a701f -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot ci40174_tb_behav xil_defaultlib.ci40174_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
