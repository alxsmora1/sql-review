# Instalar sqlfluff en windows Server 2019

## Instalar python

Para correr sqlfluff desde Windows Server 2019 debemos tener instalado python 3.9.4 el cual puedes descargar desde su [pagina oficial](https://www.python.org/downloads/).

Una vez lo tengamos instalado vamos a actualizar pip la libreria de paquetes oficial de python desde la linea de comandos.

```shell
$ python -m pip install --upgrade pip
```

## Instalar sqlfluff
[Documentación oficial](https://docs.sqlfluff.com/en/stable/)

Una vez actualizado pip vamos a ejecutar el siguiente comando:

```shell
$ pip install sqlfluff
```

Una vez instalado el paquete sqlfluff, podremos ejecutarlo desde consola o python.

## Ejecutar pruebas con sqlfluff

Para ejecutar un escaneo de los ficheros sql individualmente usaremos el siguiente comando:

```shell
$ sqlfluff lint test.sql --dialect tsql
```

Para ejecutar un escaneo en todos los archivos de un directorio por su extensión debemos ejecutar el siguiente comando:

```shell
$ sqlfluff lint path/to/my/sqlfiles --dialect tsql
```