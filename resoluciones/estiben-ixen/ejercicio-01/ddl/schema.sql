PRAGMA foreign_keys = ON;

-- Ejercicio 01: CineMax SQLite
-- Autor: Brandon Estiben Ixen
-- Fecha: 2026-08-22

CREATE TABLE IF NOT EXISTS peliculas (
    id_pelicula   INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo        TEXT    NOT NULL UNIQUE,
    genero        TEXT    NOT NULL CHECK (genero IN ('accion','comedia','drama','terror','animacion','ciencia_ficcion')),
    duracion_min  INTEGER NOT NULL CHECK (duracion_min > 0),
    clasificacion TEXT    NOT NULL DEFAULT 'A' CHECK (clasificacion IN ('A','B','B15','C','D'))
);

CREATE TABLE IF NOT EXISTS salas (
    id_sala    INTEGER PRIMARY KEY AUTOINCREMENT,
    numero     INTEGER NOT NULL UNIQUE,
    capacidad  INTEGER NOT NULL CHECK (capacidad > 0),
    tipo       TEXT    NOT NULL DEFAULT 'estandar' CHECK (tipo IN ('estandar','vip','imax'))
);

CREATE TABLE IF NOT EXISTS funciones (
    id_funcion   INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pelicula  INTEGER NOT NULL,
    id_sala      INTEGER NOT NULL,
    fecha        TEXT    NOT NULL,
    hora         TEXT    NOT NULL,
    precio       REAL    NOT NULL CHECK (precio > 0),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula),
    FOREIGN KEY (id_sala)     REFERENCES salas(id_sala)
);

CREATE TABLE IF NOT EXISTS boletos (
    id_boleto   INTEGER PRIMARY KEY AUTOINCREMENT,
    id_funcion  INTEGER NOT NULL,
    asiento     TEXT    NOT NULL,
    cliente     TEXT    NOT NULL,
    fecha_compra TEXT   NOT NULL DEFAULT (date('now')),
    UNIQUE (id_funcion, asiento),
    FOREIGN KEY (id_funcion) REFERENCES funciones(id_funcion)
);
