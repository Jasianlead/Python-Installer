@echo off
title Jani

echo.
echo ===========
echo WILLKOMMEN!                          Version 0.0.4
echo ===========
echo.
echo Die Jani Programme ist eine Sammlung von Tools und Spielen.
echo.
echo Waehrend dieser Installation wird J/N angezeigt.
echo Dies bedeutet JA oder NEIN.
echo.
echo ACHTUNG: Dieses Programm unterstützt zurzeit nur Windows 7.
echo.
echo Taste druecken um fortzufahren.
pause >nul
cls
echo Pythoninstallation wird überprüft...
if exist C:\Python27 goto erfolg
if NOT exist C:\Python27 goto nopy

:nopy
cls
echo.
echo =======================
echo Installation von Python
echo =======================
echo.
echo Eine Internetverbindung wird benoetigt.
echo.
echo Python wird in diesem Vorgang heruntergeladen und der Installer gestartet.
echo Bitte schliesse das Fenster nicht!
echo.
echo Druecke eine Taste um den Vorgang zu starten.
pause >nul

:prepare
echo.
echo Vorbereitung...
echo.
ping www.google.de >nul
if errorlevel 1 goto noweb
color 0f
GOTO not

:not
if exist %USERPROFILE%\Downloads\python-2.7.11.amd64.msi goto 3
if NOT exist %USERPROFILE%\Downloads\python-2.7.11.amd64.msi goto load

:3
if exist C:\Python27 goto erfolg
if NOT exist C:\Python27 goto down

:load
echo Log:
echo Python Installer herunterladen... (1 von 3)
start /wait bitsadmin.exe /transfer "Python wird nun heruntergeladen..." https://www.python.org/ftp/python/2.7.11/python-2.7.11.amd64.msi C:\Users\%USERNAME%\Downloads\python-2.7.11.amd64.msi
echo Python Installer heruntergeladen.
if exist %USERPROFILE%\Downloads\python-2.7.11.amd64.msi goto 2
if NOT exist %USERPROFILE%\Downloads\python-2.7.11.amd64.msi goto keinerfolg

:2
if exist C:\python27 goto erfolg
if NOT exist C:\Python27 goto down

:down
echo Python Installer starten... (2 von 3)
start /wait %USERPROFILE%\Downloads\python-2.7.11.amd64.msi
echo Python Installer ausgefuehrt.
echo Installer loeschen... (3 von 3)
del %USERPROFILE%\Downloads\python-2.7.11.amd64.msi
echo Erfolgreich gelöscht.
goto erfolg

:keinerfolg
cls
echo.
echo ============================
echo Installation manuell starten
echo ============================
echo.
echo Drücke eine Taste und eine Website oeffnet sich, und du kannst Python selber herunterladen und installieren.
pause >nul
start https://www.python.org/ftp/python/2.7.11/python-2.7.11.amd64.msi
timeout /T 10 >nul
echo.
echo Drücke eine Taste, wenn Python installiert wurde.
pause >nul
goto erfolg

:erfolg
cls
echo.
echo =======================================
echo PYTHON WURDE oder IST SCHON INSTALLIERT
echo =======================================
echo.
echo /TEXT hier einfuegen/
echo.
pause
taskkill /f /iM cmd.exe

:noweb
cls
color e0
echo.
echo =========================
echo KEINE INTERNETVERBINDUNG!
echo =========================
echo.
echo Bitte stelle eine Internetverbindung her und druecke dann eine Taste!
pause >nul
GOTO prepare