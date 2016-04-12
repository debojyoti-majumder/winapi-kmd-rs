call vcvars14
@set KIND=debug
@set NAME=urandom

cargo build

set LFLAGS=/NOLOGO /INCREMENTAL:NO /MANIFEST:NO /NODEFAULTLIB /SUBSYSTEM:NATIVE /DRIVER /RELEASE /DEBUG /NXCOMPAT /DYNAMICBASE /FIXED:No
set LLIBS=ntoskrnl.lib hal.lib
set RFLAGS=/OPT:REF,ICF
rem cpu-specific
set LPATH=/LIBPATH:"F:\DDK\7600\lib\win7\i386"
set LFLAGS=%LFLAGS% /MACHINE:X86 /entry:DriverEntry@8
set TDIR=target\i686-sys-windows-msvc\%KIND%
link.exe %LFLAGS% %RFLAGS% %LPATH% %LLIBS% %TDIR%\%NAME%.lib /OUT:%TDIR%\%NAME%.sys
@pause
