PRAGMA foreign_keys = ON;

-- Ejercicio 01: CineMax SQLite
-- Datos base

-- Peliculas (5 registros)
INSERT INTO peliculas (titulo, genero, duracion_min, clasificacion) VALUES
    ('Avengers Endgame',   'accion',         181, 'B'),
    ('El Rey Leon',        'animacion',      118, 'A'),
    ('It',                 'terror',         135, 'C'),
    ('Interstellar',       'ciencia_ficcion',169, 'B15'),
    ('La La Land',         'comedia',        128, 'A');

-- Salas (5 registros)
INSERT INTO salas (numero, capacidad, tipo) VALUES
    (1, 100, 'estandar'),
    (2, 150, 'estandar'),
    (3,  60, 'vip'),
    (4, 200, 'imax'),
    (5,  80, 'estandar');

-- Funciones (10 registros)
INSERT INTO funciones (id_pelicula, id_sala, fecha, hora, precio) VALUES
    (1, 1, '2026-08-22', '14:00', 45.00),
    (1, 4, '2026-08-22', '17:30', 80.00),
    (2, 2, '2026-08-22', '15:00', 40.00),
    (3, 1, '2026-08-22', '20:00', 50.00),
    (4, 3, '2026-08-23', '16:00', 70.00),
    (5, 2, '2026-08-23', '18:00', 40.00),
    (1, 1, '2026-08-23', '14:00', 45.00),
    (2, 5, '2026-08-23', '11:00', 35.00),
    (3, 4, '2026-08-24', '21:00', 80.00),
    (4, 3, '2026-08-24', '14:30', 70.00);

-- Boletos (12 registros)
INSERT INTO boletos (id_funcion, asiento, cliente, fecha_compra) VALUES
    (1, 'A1', 'Maria Lopez',   '2026-08-20'),
    (1, 'A2', 'Carlos Perez',  '2026-08-20'),
    (1, 'B1', 'Ana Garcia',    '2026-08-21'),
    (2, 'A1', 'Luis Mendez',   '2026-08-21'),
    (2, 'B3', 'Sofia Ruiz',    '2026-08-22'),
    (3, 'C1', 'Pedro Juarez',  '2026-08-22'),
    (4, 'D2', 'Laura Flores',  '2026-08-22'),
    (5, 'A5', 'Diego Torres',  '2026-08-22'),
    (6, 'B2', 'Elena Vasquez', '2026-08-22'),
    (7, 'A3', 'Roberto Lima',  '2026-08-22'),
    (8, 'A1', 'Carmen Diaz',   '2026-08-22'),
    (9, 'A1', 'Jose Herrera',  '2026-08-22');
