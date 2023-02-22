/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para alphaone_intranet
CREATE DATABASE IF NOT EXISTS `alphaone_intranet` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `alphaone_intranet`;

-- Volcando estructura para tabla alphaone_intranet.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_paquete_internet` int(11) NOT NULL,
  `id_promotor` int(11) NOT NULL,
  `id_ubicacion` int(11) NOT NULL DEFAULT '1',
  `id_medio` int(11) NOT NULL DEFAULT '8',
  `id_mk` varchar(8) NOT NULL,
  `folio` varchar(64) NOT NULL,
  `nombre` varchar(256) DEFAULT NULL,
  `direccion` varchar(256) DEFAULT NULL,
  `telefono` varchar(256) DEFAULT NULL,
  `referencia_ubicacion` varchar(256) DEFAULT NULL,
  `lat` varchar(256) DEFAULT NULL,
  `lon` varchar(256) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `ine` varchar(256) DEFAULT NULL,
  `curp` varchar(256) DEFAULT NULL,
  `rfc` varchar(256) DEFAULT NULL,
  `img_ine_frente` varchar(256) DEFAULT NULL,
  `img_ine_reverso` varchar(256) DEFAULT NULL,
  `img_fachada` varchar(256) DEFAULT NULL,
  `comprobante` varchar(256) DEFAULT NULL,
  `observaciones` text,
  `fecha_instalacion` date DEFAULT NULL,
  `fecha_instalacion_confirmada` date DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_cliente`),
  KEY `FK_clientes_paquetes_internet` (`id_paquete_internet`),
  KEY `FK_clientes_usuarios` (`id_promotor`),
  KEY `FK_clientes_ubicacion` (`id_ubicacion`),
  KEY `FK_clientes_medios` (`id_medio`),
  CONSTRAINT `FK_clientes_medios` FOREIGN KEY (`id_medio`) REFERENCES `medios` (`id_medio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_clientes_paquetes_internet` FOREIGN KEY (`id_paquete_internet`) REFERENCES `paquetes_internet` (`id_paquete_internet`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_clientes_ubicacion` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_clientes_usuarios` FOREIGN KEY (`id_promotor`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2195 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene la información de los clientes que se registren o preregistren.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla alphaone_intranet.inventarios
CREATE TABLE IF NOT EXISTS `inventarios` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) DEFAULT NULL,
  `nombre` varchar(512) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_ultima` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_inventario`),
  KEY `FK_inventarios_sucursales` (`id_sucursal`),
  CONSTRAINT `FK_inventarios_sucursales` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Sistema de almacenes de las sucursales';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla alphaone_intranet.medios
CREATE TABLE IF NOT EXISTS `medios` (
  `id_medio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(256) NOT NULL,
  PRIMARY KEY (`id_medio`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='Tabla con los medios de marketing donde se enteraron de la empresa.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla alphaone_intranet.movimientos_alamecenes
CREATE TABLE IF NOT EXISTS `movimientos_alamecenes` (
  `id_movimiento` int(11) NOT NULL,
  `id_sucursal_origen` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `id_sucursal_destino` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='sistema de movimientos entre almacenes';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla alphaone_intranet.paquetes_internet
CREATE TABLE IF NOT EXISTS `paquetes_internet` (
  `id_paquete_internet` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(256) DEFAULT NULL,
  `mb_bajada` int(11) DEFAULT NULL,
  `mb_subida` int(11) DEFAULT NULL,
  `costo` float(8,2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_paquete_internet`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene la información de los paquetes de internet disponibles.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla alphaone_intranet.referencias
CREATE TABLE IF NOT EXISTS `referencias` (
  `id_referencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `nombre1` varchar(256) DEFAULT NULL,
  `direccion1` text,
  `telefono1` varchar(32) DEFAULT NULL,
  `nombre2` varchar(256) DEFAULT NULL,
  `direccion2` text,
  `telefono2` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_referencia`),
  KEY `FK_referencias_clientes` (`id_cliente`),
  CONSTRAINT `FK_referencias_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1393 DEFAULT CHARSET=latin1 COMMENT='Tabla con la información de las referencias personales de los clientes.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla alphaone_intranet.reporte_comisiones
CREATE TABLE IF NOT EXISTS `reporte_comisiones` (
  `id_reporte_comision` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_partida` date DEFAULT NULL,
  `fecha_reporte` date DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `clientes_comisionados` int(11) DEFAULT NULL,
  `total_comisiones` float(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_reporte_comision`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene la información de las comisiones';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla alphaone_intranet.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(256) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene los roles de los usuarios del sistema';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla alphaone_intranet.sucursales
CREATE TABLE IF NOT EXISTS `sucursales` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `direccción` varchar(128) NOT NULL,
  `telefono` varchar(16) NOT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Sitios en donde se tienen sucursales de 3NETMX';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla alphaone_intranet.ubicacion
CREATE TABLE IF NOT EXISTS `ubicacion` (
  `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id_ubicacion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla alphaone_intranet.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `username` varchar(64) NOT NULL,
  `pwd` varchar(64) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  KEY `FK_usuarios_roles` (`id_rol`),
  CONSTRAINT `FK_usuarios_roles` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COMMENT='Tabla que contiene la informacion de los usuarios';

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
