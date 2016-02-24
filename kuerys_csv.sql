-- carrera
SELECT * FROM Libro INTO OUTFILE '/tmp/libros.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- libros
SELECT * FROM Carrera INTO OUTFILE '/tmp/carreras.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- materia
SELECT * FROM Materia INTO OUTFILE '/tmp/materias.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- fecha_prestamo
SELECT fecha_prestamo FROM Prestamo INTO OUTFILE '/tmp/fecha_prestamo.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
