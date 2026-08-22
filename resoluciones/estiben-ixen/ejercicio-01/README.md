# == CineMax ==
**Autor:** Brandon Estiben Ixen  
**Fecha:** 22 de agosto de 2026

> **CineMax** es una empresa dedicada al entretenimiento cinematográfico. Disfruta tus mejores momentos con nosotros, comparte en familia.

**Problema detectado y planteado por el cliente:** Actualmente CineMax tiene la necesidad de innovar su forma de recopilar los datos, ya que estos se manejan manualmente mediante hojas sueltas impidiendo la fluidez de generación de reportes. Registra manualmente películas, salas, funciones y boletos, lo que provoca duplicidad, errores de captura y dificultad para generar reportes.

La base de datos **cinemax** con el objetivo de resolver la mala gestión de programación de funciones y venta de boletos, cuenta con cuatro tablas principales que a continuación se detallaran.

tablas:

> **peliculas** En esta tabla se registran todas las películas disponibles en el cine, guardando su título de forma obligatoria y única, el género, la duración en minutos y la clasificación. Cada película recibe un **id** autoincrementable.

> **salas** Aquí se registran todas las salas del cine, con su número único, capacidad máxima y tipo (estándar, VIP o IMAX). Cada sala recibe un **id** autoincrementable.

> **funciones** Esta tabla almacena la programación de funciones, relacionando película y sala con su fecha, hora y precio. Tiene llaves foráneas hacia **peliculas** y **salas**, garantizando integridad referencial.

> **boletos** Almacena los boletos vendidos, registrando la función, asiento, nombre del cliente y fecha de compra. Tiene una restricción UNIQUE compuesta sobre (id_funcion, asiento) para evitar duplicados de asiento en la misma función.

---
---

## Datos de prueba

Los datos de prueba representan 5 películas, 5 salas, 10 funciones y 12 boletos. Las funciones relacionan películas y salas mediante sus identificadores, y los boletos relacionan clientes con funciones específicas.

### Películas registradas

| ID | Título | Género | Duración (min) | Clasificación |
| --- | --- | --- | --- | --- |
| 1 | Avengers Endgame | accion | 181 | B |
| 2 | El Rey Lion | animacion | 118 | A |
| 3 | It | terror | 135 | C |
| 4 | Interstellar | ciencia_ficcion | 169 | B15 |
| 5 | La La Land | comedia | 128 | A |

### Salas registradas

| ID | Número | Capacidad | Tipo |
| --- | --- | --- | --- |
| 1 | 1 | 100 | estándar |
| 2 | 2 | 150 | estándar |
| 3 | 3 | 60 | VIP |
| 4 | 4 | 200 | IMAX |
| 5 | 5 | 80 | estándar |

### Funciones programadas

| ID | Película | Sala | Fecha | Hora | Precio |
| --- | --- | --- | --- | --- | --- |
| 1 | Avengers Endgame | 1 | 2026-08-22 | 14:00 | Q45.00 |
| 2 | Avengers Endgame | 4 | 2026-08-22 | 17:30 | Q80.00 |
| 3 | El Rey Lion | 2 | 2026-08-22 | 15:00 | Q40.00 |
| ... | ... | ... | ... | ... | ... |

## Relaciones entre tablas

- `funciones` es la tabla central que relaciona `peliculas` y `salas` mediante sus llaves foráneas `id_pelicula` e `id_sala`.
- `boletos` es la tabla transaccional que relaciona clientes con `funciones` mediante `id_funcion`.
- La restricción UNIQUE compuesta en `boletos(id_funcion, asiento)` garantiza que no se venda el mismo asiento dos veces en la misma función.

## Restricciones aplicadas

- Cada tabla tiene una llave primaria autoincrementable.
- `peliculas.titulo` es obligatorio y único mediante `NOT NULL` y `UNIQUE`.
- `peliculas.genero` valida el valor con `CHECK (genero IN (...))`.
- `funciones.precio` valida que sea positivo con `CHECK (precio > 0)`.
- `salas.capacidad` valida que sea positiva con `CHECK (capacidad > 0)`.
- Las llaves foráneas en `funciones` y `boletos` evitan referencias a registros inexistentes.
- `PRAGMA foreign_keys = ON` activa la integridad referencial en SQLite.

## Consultas y reportes

El archivo `dql/consultas.sql` contiene las consultas solicitadas para revisar la información de la base de datos:

1. Lista todas las funciones programadas con película, sala, fecha y precio.
2. Muestra solo título y duración de las películas.
3. Filtra funciones con precio mayor a Q50.
4. Ordena las películas alfabéticamente por título.
5. Muestra las 5 películas con más boletos vendidos.
6. Cuenta el total de boletos vendidos.
7. Calcula el precio promedio, mínimo y máximo de las funciones.
8. Agrupa los boletos vendidos por sala.
9. Relaciona películas, funciones y salas con JOIN.
10. Boletos vendidos en agosto 2026, ordenados por fecha, límite 5.
11. Reporte legible de la cartelera del día con alias.
12. Películas menos vistas (candidatas a cancelar) para toma de decisiones.

## Archivos de la solución

- `ddl/schema.sql`: creación de las tablas con todas las restricciones.
- `dml/inserts.sql`: inserción de películas, salas, funciones y boletos.
- `dml/operaciones.sql`: operaciones adicionales INSERT, UPDATE y DELETE.
- `dql/consultas.sql`: consultas de análisis y reportes.
- `diagramas/`: carpeta reservada para el diagrama entidad-relación.

## Como ejecutar

Desde la raíz de la solución:

```bash
sqlite3 ejercicio-01.db < ddl/schema.sql
sqlite3 ejercicio-01.db < dml/inserts.sql
sqlite3 ejercicio-01.db < dml/operaciones.sql
sqlite3 ejercicio-01.db < dql/consultas.sql
```

No subir archivos `.db`, `.sqlite` ni `.sqlite3`.