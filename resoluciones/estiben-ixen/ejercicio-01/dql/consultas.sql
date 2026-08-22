.headers on
.mode column

-- Ejercicio 01: CineMax SQLite
-- Autor: Brandon Estiben Ixen

-- 1. Listar todas las funciones programadas
SELECT f.id_funcion, p.titulo, s.numero AS sala, f.fecha, f.hora, f.precio
FROM funciones f
JOIN peliculas p ON f.id_pelicula = p.id_pelicula
JOIN salas s     ON f.id_sala = s.id_sala
ORDER BY f.fecha, f.hora;

-- 2. Mostrar solo titulo y duracion de las peliculas
SELECT titulo, duracion_min AS duracion_minutos
FROM peliculas;

-- 3. Filtrar funciones con precio mayor a 50
SELECT id_funcion, fecha, hora, precio
FROM funciones
WHERE precio > 50.00;

-- 4. Ordenar peliculas alfabeticamente por titulo
SELECT titulo, genero, clasificacion
FROM peliculas
ORDER BY titulo ASC;

-- 5. Top 5 peliculas con mas boletos vendidos
SELECT p.titulo,
       COUNT(b.id_boleto) AS boletos_vendidos
FROM peliculas p
JOIN funciones f ON p.id_pelicula = f.id_pelicula
JOIN boletos   b ON f.id_funcion  = b.id_funcion
GROUP BY p.id_pelicula
ORDER BY boletos_vendidos DESC
LIMIT 5;

-- 6. Contar total de boletos vendidos
SELECT COUNT(*) AS total_boletos
FROM boletos;

-- 7. Precio promedio, minimo y maximo de funciones
SELECT ROUND(AVG(precio), 2) AS precio_promedio,
       MIN(precio)           AS precio_minimo,
       MAX(precio)           AS precio_maximo
FROM funciones;

-- 8. Agrupar boletos vendidos por sala
SELECT s.numero AS sala,
       COUNT(b.id_boleto) AS boletos
FROM salas s
JOIN funciones f ON s.id_sala    = f.id_sala
JOIN boletos   b ON f.id_funcion = b.id_funcion
GROUP BY s.id_sala
ORDER BY boletos DESC;

-- 9. Relacionar peliculas, funciones y salas con JOIN
SELECT p.titulo, s.tipo AS tipo_sala, f.fecha, f.hora, f.precio
FROM funciones f
JOIN peliculas p ON f.id_pelicula = p.id_pelicula
JOIN salas     s ON f.id_sala     = s.id_sala;

-- 10. Boletos vendidos en agosto 2026, ordenados por fecha, limite 5
SELECT b.cliente, p.titulo, f.fecha, f.hora
FROM boletos   b
JOIN funciones f ON b.id_funcion  = f.id_funcion
JOIN peliculas p ON f.id_pelicula = p.id_pelicula
WHERE b.fecha_compra LIKE '2026-08%'
ORDER BY b.fecha_compra DESC
LIMIT 5;

-- 11. Reporte con alias legibles: cartelera del dia
SELECT p.titulo          AS pelicula,
       s.numero          AS numero_sala,
       s.tipo            AS tipo_sala,
       f.fecha           AS fecha_funcion,
       f.hora            AS hora_inicio,
       f.precio          AS precio_entrada
FROM funciones f
JOIN peliculas p ON f.id_pelicula = p.id_pelicula
JOIN salas     s ON f.id_sala     = s.id_sala
WHERE f.fecha = '2026-08-22'
ORDER BY f.hora;

-- 12. Decision de negocio: peliculas menos vistas (candidatas a cancelar)
SELECT p.titulo,
       COUNT(b.id_boleto)                                   AS boletos_vendidos,
       SUM(f.precio * (SELECT COUNT(*) FROM boletos b2
                        WHERE b2.id_funcion = f.id_funcion)) AS ingresos_estimados
FROM peliculas p
LEFT JOIN funciones f ON p.id_pelicula = f.id_pelicula
LEFT JOIN boletos   b ON f.id_funcion  = b.id_funcion
GROUP BY p.id_pelicula
ORDER BY boletos_vendidos ASC;
