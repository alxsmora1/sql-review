@echo off

title Runner scan tsql files

:: Ubicación del directorio con los ficheros sql
set TSQL_FOLDER=

rem Step 1 pip upgrade
:pip_upgrade
python -m pip install --upgrade pip

rem Step 2 install sqlfluff
:sqlfluff_install
pip install sqlfluff

rem Step 3 scan tsql files
:scan_sql
sqlfluff lint %TSQL_FOLDER% --dialect tsql

:finish_proccess_by_error
echo Ha ocurrido un error durante el escaneo de codigo
EXIT