-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Usuario'
-- 
-- ---

DROP TABLE IF EXISTS `Usuario`;
		
CREATE TABLE `Usuario` (
  `clave_usuario` CHAR(9) NOT NULL DEFAULT 'NULL',
  `nombre` VARCHAR(150) NOT NULL DEFAULT 'juan',
  `sexo` CHAR(1) NULL DEFAULT NULL,
  `generacion` CHAR(5) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`clave_usuario`)
);

-- ---
-- Table 'Carrera'
-- 
-- ---

DROP TABLE IF EXISTS `Carrera`;
		
CREATE TABLE `Carrera` (
  `clave_carrera` CHAR(3) NOT NULL DEFAULT 'NUL',
  `nombre` VARCHAR(150) NOT NULL DEFAULT 'NULL',
  `plan` CHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`clave_carrera`)
);

-- ---
-- Table 'Cursar'
-- 
-- ---

DROP TABLE IF EXISTS `Cursar`;
		
CREATE TABLE `Cursar` (
  `usuario` CHAR(9) NOT NULL DEFAULT 'NULL',
  `carrera` CHAR(3) NOT NULL DEFAULT 'NUL',
  PRIMARY KEY (`usuario`, `carrera`)
);

-- ---
-- Table 'Libro'
-- 
-- ---

DROP TABLE IF EXISTS `Libro`;
		
CREATE TABLE `Libro` (
  `clave_libro` CHAR(15) NOT NULL DEFAULT 'NULL',
  `ejemplar` INTEGER NOT NULL DEFAULT 0,
  `titulo` VARCHAR(200) NOT NULL DEFAULT 'NULL',
  `paginas` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`clave_libro`, `ejemplar`)
);

-- ---
-- Table 'Autor'
-- 
-- ---

DROP TABLE IF EXISTS `Autor`;
		
CREATE TABLE `Autor` (
  `clave_autor` CHAR(5) NOT NULL DEFAULT 'NULL',
  `nombre` VARCHAR(150) NOT NULL DEFAULT 'Nombre',
  `sexo` CHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`clave_autor`)
);

-- ---
-- Table 'Escribir'
-- 
-- ---

DROP TABLE IF EXISTS `Escribir`;
		
CREATE TABLE `Escribir` (
  `autor` CHAR(5) NOT NULL DEFAULT 'NULL',
  `libro` CHAR(15) NOT NULL DEFAULT 'NULL',
  `ejemplar` INTEGER NOT NULL,
  PRIMARY KEY (`autor`, `libro`, `ejemplar`)
);

-- ---
-- Table 'Prestamo'
-- 
-- ---

DROP TABLE IF EXISTS `Prestamo`;
		
CREATE TABLE `Prestamo` (
  `usuario` CHAR(9) NOT NULL DEFAULT 'NULL',
  `libro` CHAR(15) NOT NULL DEFAULT 'NULL',
  `ejemplar` INTEGER NOT NULL DEFAULT 0,
  `fecha_prestamo` DATE NOT NULL,
  `fecha_devolucion` DATE NOT NULL,
  `fecha_entrega_real` DATE NULL,
  PRIMARY KEY (`usuario`, `libro`, `ejemplar`, `fecha_prestamo`)
);

-- ---
-- Table 'Materia'
-- 
-- ---

DROP TABLE IF EXISTS `Materia`;
		
CREATE TABLE `Materia` (
  `clave_materia` CHAR(3) NOT NULL DEFAULT 'NUL',
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`clave_materia`)
);

-- ---
-- Table 'Tratar'
-- 
-- ---

DROP TABLE IF EXISTS `Tratar`;
		
CREATE TABLE `Tratar` (
  `libro` CHAR(15) NOT NULL DEFAULT 'NULL',
  `ejemplar` INTEGER NOT NULL DEFAULT 0,
  `materia` CHAR(3) NOT NULL DEFAULT 'NUL',
  PRIMARY KEY (`libro`, `ejemplar`, `materia`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Cursar` ADD FOREIGN KEY (usuario) REFERENCES `Usuario` (`clave_usuario`);
ALTER TABLE `Cursar` ADD FOREIGN KEY (carrera) REFERENCES `Carrera` (`clave_carrera`);
ALTER TABLE `Escribir` ADD FOREIGN KEY (autor) REFERENCES `Autor` (`clave_autor`);
ALTER TABLE `Escribir` ADD FOREIGN KEY (libro,ejemplar) REFERENCES `Libro` (`clave_libro`,ejemplar);
--ALTER TABLE `Escribir` ADD FOREIGN KEY (ejemplar) REFERENCES `Libro` (`ejemplar`);
ALTER TABLE `Prestamo` ADD FOREIGN KEY (usuario) REFERENCES `Usuario` (`clave_usuario`);
ALTER TABLE `Prestamo` ADD FOREIGN KEY (libro,ejemplar) REFERENCES `Libro` (`clave_libro`,ejemplar);
--ALTER TABLE `Prestamo` ADD FOREIGN KEY (ejemplar) REFERENCES `Libro` (`ejemplar`);
ALTER TABLE `Tratar` ADD FOREIGN KEY (libro,ejemplar) REFERENCES `Libro` (`clave_libro`,ejemplar);
--ALTER TABLE `Tratar` ADD FOREIGN KEY (ejemplar) REFERENCES `Libro` (`ejemplar`);
ALTER TABLE `Tratar` ADD FOREIGN KEY (materia) REFERENCES `Materia` (`clave_materia`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Usuario` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Carrera` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Cursar` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Libro` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Autor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Escribir` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Prestamo` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Materia` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Tratar` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Usuario` (`clave_usuario`,`nombre`,`sexo`,`generacion`,`fecha_nacimiento`) VALUES
-- ('','','','','');
-- INSERT INTO `Carrera` (`clave_carrera`,`nombre`,`plan`) VALUES
-- ('','','');
-- INSERT INTO `Cursar` (`usuario`,`carrera`) VALUES
-- ('','');
-- INSERT INTO `Libro` (`clave_libro`,`ejemplar`,`titulo`,`paginas`) VALUES
-- ('','','','');
-- INSERT INTO `Autor` (`clave_autor`,`nombre`,`sexo`) VALUES
-- ('','','');
-- INSERT INTO `Escribir` (`autor`,`libro`,`ejemplar`) VALUES
-- ('','','');
-- INSERT INTO `Prestamo` (`usuario`,`libro`,`ejemplar`,`fecha_prestamo`,`fecha_devolucion`,`fecha_entrega_real`) VALUES
-- ('','','','','','');
-- INSERT INTO `Materia` (`clave_materia`,`nombre`) VALUES
-- ('','');
-- INSERT INTO `Tratar` (`libro`,`ejemplar`,`materia`) VALUES
-- ('','','');
