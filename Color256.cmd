:: filename:     Color256.cmd
:: author:       Nivigor
:: date:         2026-01-30 ; Initial release
:: purpose:      View all 256 terminal colors

@echo off
:: Enable ANSI colors (if not enabled)
::reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f > nul 2>&1
cls
:: Get ESC-symbol for ANSI codes
for /f %%a in ('echo prompt $E ^| cmd') do set E=%%a
set fg=%E%[38;05;
set bg=%E%[48;05;
set reset=%E%[0m
set "N=0" & set "N2=52"

set "z= "
for /L %%i in (0,1,7) do ( set "t=    %%i" & set "z=!z!!t:~-5!" )
echo %z%
for /L %%j in (0,1,1) do (
  set "z=   !N!" & set z=!z:~-3!
  for /L %%i in (0,1,7) do (
    set "z=!z!%bg%!N!m     "
    set /A N+=1
  )
  echo !z!%reset%
)

for /L %%k in (0,1,2) do (
  set "z= "
  for /L %%i in (0,1,5) do ( set "t=    %%i" & set "z=!z!!t:~-5!" )
  set "z=!z!    "
  for /L %%i in (0,1,5) do ( set "t=    %%i" & set "z=!z!!t:~-5!" )
  echo !z!
  for /L %%j in (0,1,5) do (
    set "z=   !N!" & set "z=!z:~-3!"
    for /L %%i in (0,1,5) do (
      set "z=!z!%bg%!N!m     "
      set /A N+=1
    )
    set "z2=    !N2!" & set "z2=!z2:~-4!"
    for /L %%i in (0,1,5) do (
      set "z2=!z2!%bg%!N2!m     "
      set /A N2+=1
    )
    echo !z!%reset%!z2!%reset%
  )
  set /A N+=36 & set /A N2+=36
)

set "z= "
for /L %%i in (0,1,11) do ( set "t=    %%i" & set "z=!z!!t:~-5!" )
echo %z%
for /L %%j in (0,1,1) do (
  set "z=   !N!" & set z=!z:~-3!
  for /L %%i in (0,1,11) do (
    set "z=!z!%bg%!N!m     "
    set /A N+=1
  )
  echo !z!%reset%
)

pause