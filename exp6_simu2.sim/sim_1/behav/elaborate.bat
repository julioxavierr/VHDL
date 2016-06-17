@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto 92e691a81ecc40d3841b4cfa1c5b8c22 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot main_behav xil_defaultlib.main -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
