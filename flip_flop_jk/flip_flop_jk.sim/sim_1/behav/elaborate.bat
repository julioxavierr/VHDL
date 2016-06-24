@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 8e1e0c24e8f84610b97af2b7543e34fc -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot CFG_TB_behav xil_defaultlib.CFG_TB -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
