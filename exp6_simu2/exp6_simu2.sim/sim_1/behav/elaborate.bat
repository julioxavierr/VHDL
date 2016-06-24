@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto fc03d7e379064f5fa2c967dd094966f4 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot main_tb_behav xil_defaultlib.main_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
