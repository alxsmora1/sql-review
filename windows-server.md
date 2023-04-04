Instalación sqlfluff en Windows Server

install python
python.exe -m pip install --upgrade pip

$ pip install sqlfluff
$ echo "  SELECT a  +  b FROM tbl;  " > test.sql
$ sqlfluff lint test.sql --dialect ansi