PRAGMA foreign_keys = ON;

-- Ejercicio 01: CineMax SQLite
-- Operaciones adicionales

-- INSERT validos:
INSERT INTO peliculas (titulo, genero, duracion_min, clasificacion)
    VALUES ('Dune Parte Dos', 'ciencia_ficcion', 167, 'B15');

INSERT INTO boletos (id_funcion, asiento, cliente, fecha_compra)
    VALUES (10, 'A2', 'Gabriela Morales', '2026-08-22');

-- UPDATE validos con WHERE:
UPDATE peliculas
    SET precio = 55.00
    WHERE id_pelicula = 1;

UPDATE funciones
    SET precio = 55.00
    WHERE id_sala = 1 AND fecha = '2026-08-23';

-- DELETE controlados con WHERE:
DELETE FROM boletos
    WHERE id_boleto = 12;

DELETE FROM funciones
    WHERE fecha > '2026-08-24' AND id_funcion NOT IN (SELECT id_funcion FROM boletos);

-- Casos que deben fallar por restricciones, dejelos comentados:
-- Viola UNIQUE (asiento ya existe en esa funcion):
-- INSERT INTO boletos (id_funcion, asiento, cliente) VALUES (1, 'A1', 'Nuevo Cliente');

-- Viola CHECK (precio negativo):
-- INSERT INTO funciones (id_pelicula, id_sala, fecha, hora, precio) VALUES (1, 1, '2026-09-01', '10:00', -10.00);
