@echo off
REM close existing image windows
powershell -NoProfile -command "Get-Process | Where-Object {$_.ProcessName -like 'Photos*'} | Stop-Process -Force"

rem Step 1: copy output.nc to output1.nc (overwrite without asking)
copy /Y output.nc output1.nc

rem Step 2: run the model
gotm_sp1_2_2.exe

"C:\Program Files\R\R-4.2.1\bin\x64\Rscript.exe" "C:\Users\mestr\OneDrive - IOLR\MEWS\R_codes\PO4_model_fit00.R" 
"C:\Program Files\R\R-4.2.1\bin\x64\Rscript.exe" "C:\Users\mestr\OneDrive - IOLR\MEWS\R_codes\Phyto_model_fit00.R" 
"C:\Program Files\R\R-4.2.1\bin\x64\Rscript.exe" "C:\Users\mestr\OneDrive - IOLR\MEWS\R_codes\Zoop_model_fit00.R" 
"C:\Program Files\R\R-4.2.1\bin\x64\Rscript.exe" "C:\Users\mestr\OneDrive - IOLR\MEWS\R_codes\N_model_fit00.R" 
"C:\Program Files\R\R-4.2.1\bin\x64\Rscript.exe" "C:\Users\mestr\OneDrive - IOLR\MEWS\R_codes\O2_model_fit00.R" 
"C:\Program Files\R\R-4.2.1\bin\x64\Rscript.exe" "C:\Users\mestr\OneDrive - IOLR\MEWS\R_codes\H2S_model_fit00.R" 


@echo 
pause