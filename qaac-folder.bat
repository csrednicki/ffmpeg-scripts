@echo off
REM Inicjalizacja zmiennej liczby plyt
set /a cdcounter=0

SET RESULT=---
SET FORMATS=*.flac *.mpc *.wav *.mp3 *.m4a *.aac

REM Wejscie w tryb
setlocal ENABLEDELAYEDEXPANSION

REM Pobranie nazwy aktualnego katalogu do zmiennej %CurrDirName%
REM parametr %%~nxd rozwija do pelnej nazwy pliku i rozszerzenia
REM Jest to zabezpieczenie na wypadek katalogu z kropka w nazwie
REM Np: Hed Kandi - Disco Kandi 05.02 (2002)
FOR %%d in (.) do set CurrDirName=%%~nxd

FOR /D %%d IN ("CD*") DO (
	SET RESULT=%%d
)

REM Ustawienie katalogu docelowego
set cel=m:\# MUZYKA\# Albumy\%CurrDirName%

echo Utworzenie katalogu docelowego: %cel%
mkdir "%cel%"

SET OPTIONS_QAAC=-c 0 --threading --no-optimize -d "%cel%"

IF EXIST "%RESULT%" (
	GOTO MULTICD
) ELSE (
	GOTO SINGLECD
)

:MULTICD
FOR /D %%c IN ("CD*") DO (
	set /a cdcounter+=1	
	echo Katalog %%c

	for %%v in ("%%c\*.flac", "%%c\*.wav", "%%c\*.mp3", "%%c\*.mpc", "%%c\*.m4a", "%%c\*.aac") do (
		qaac64 %OPTIONS_QAAC% -o "%cel%\!cdcounter!x%%~nv.m4a" "%%v"
	)
		
)
GOTO END

:SINGLECD
echo Sprawdzam czy istnieja w katalogu pliki MP3
IF EXIST *.mp3 (qaac64 %OPTIONS_QAAC% *.mp3)

echo Sprawdzam czy istnieja w katalogu pliki FLAC
IF EXIST *.flac (qaac64 %OPTIONS_QAAC% *.flac)

echo Sprawdzam czy istnieja w katalogu pliki WAV
IF EXIST *.wav (qaac64 %OPTIONS_QAAC% *.wav)

echo Sprawdzam czy istnieja w katalogu pliki MPC
IF EXIST *.mpc (qaac64 %OPTIONS_QAAC% *.mpc)

echo Sprawdzam czy istnieja w katalogu pliki M4A
IF EXIST *.m4a (qaac64 %OPTIONS_QAAC% *.m4a)

echo Sprawdzam czy istnieja w katalogu pliki AAC
IF EXIST *.aac (qaac64 %OPTIONS_QAAC% *.aac)

:END
pause