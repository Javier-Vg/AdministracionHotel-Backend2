
--javi

--new -- -- Consulta para encontrar el hotel con la mayor ocupación en el mes anterior

SELECT
    h.id AS hotel_id,
    h.nombre_hotel,
    COUNT(r.id) AS total_reservas
FROM
    reservas r
JOIN
    habitaciones hab ON r.habitacion_id = hab.id
JOIN
    hotel h ON hab.hotel_id = h.id
WHERE
    r.fecha_entrada >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND r.fecha_entrada < CURDATE()
GROUP BY
    h.id, h.nombre_hotel
ORDER BY
    total_reservas DESC
LIMIT 1;

--javi
-- Consulta para contar cuántas habitaciones disponibles hay en un hotel específico en una fecha dada.

SELECT DISTINCT hotel.nombre_hotel, reserva_fecha.fecha_reservacion, hotel.habitaciones_disponibles
FROM hotel
INNER JOIN reserva_fecha
ON reserva_fecha.fecha_reservacion = "2024-08-20" AND hotel.nombre_hotel = "Hotel Urban Stay";

---------------------------------------------------------------------------------------------
--ale
-- Consulta para obtener toda la información de un hotel específico
SELECT 
    *                                    -- Selecciona todas las columnas de la tabla
FROM 
    hotel                              -- Desde la tabla 'hotel'
WHERE 
    nombre_hotel = 'Hotel Grand Palace'; -- Filtra por el nombre del hotel específico

---------------------------------------------------------------------------------------------

--ale
-- Consulta para obtener el total de reservas por hotel
SELECT 
    h.nombre_hotel,                       -- Selecciona el nombre del hotel
    COUNT(r.id) AS total_reservas        -- Cuenta el total de reservas y lo etiqueta como 'total_reservas'
FROM 
    hotel h                              -- Desde la tabla 'hotel' alias 'h'
JOIN 
    habitaciones ha ON h.id = ha.hotel_id  -- Une con la tabla 'habitaciones' a la relación 'hotel_id'
JOIN 
    reservas r ON ha.id = r.habitacion_id   -- Une con la tabla 'reservas' entre 'habitacion_id'
GROUP BY 
    h.id, h.nombre_hotel                 -- Agrupa los resultados por ID del hotel y nombre del hotel
ORDER BY 
    total_reservas DESC;                 -- Ordena los resultados en orden descendente por el total de reservas

---------------------------------------------------------------------------------------------
--javi
-- Consulta para buscar hoteles cuya ubicación comienza con un texto específico.

SELECT hotel.nombre_hotel
FROM hotel
WHERE hotel.nombre_hotel LIKE "Hotel Urban%";

---------------------------------------------------------------------------------------------
--ale
-- Consulta para obtener todos los hoteles en una ubicación específica
SELECT 
    *                                   
FROM 
    hotel                              -- Desde la tabla 'hotel'
WHERE 
    ubicacion LIKE '%Ciudad A';         -- Filtra por hoteles cuya ubicación contiene 'Ciudad A'

-----------------------------------------------------------------------------------------------------------
--javi
-- Consulta para obtener las reservas de un cliente (por email) realizadas en el mes anterior.

SELECT * FROM reservas WHERE usuario_id IN (
    SELECT id FROM clientes WHERE clientes.correo = "maria.garcia@example.com"
) AND reservas.fecha_reservacion < "2024-08-01" AND reservas.fecha_reservacion > "2024-07-01";

------------------------------------------------------------------------------------------------------------
--javi
-- Consulta para listar los hoteles que tienen habitaciones disponibles pero no han sido reservadas en el último mes.

SELECT DISTINCT h.nombre_hotel, h.ubicacion
FROM hotel h                     -- Une con la tabla de habitaciones usando el id del hotel
JOIN habitaciones hb ON h.id = hb.hotel_id   -- Une con la tabla de reservas usando el id de la habitación
JOIN reservas r ON hb.id = r.habitacion_id   -- Une con la tabla de disponibilidad de habitaciones usando el id de la habitación
JOIN disponibilidad_habitaciones dh ON hb.id = dh.habitacion_id   -- Filtra por reservas en el rango de fechas especificado y habitaciones disponibles
WHERE r.fecha_reservacion BETWEEN '2024-07-01' AND '2024-07-31'
  AND dh.status_habitacion = 'disponible'
ORDER BY h.nombre_hotel;   -- Ordena los resultados por el nombre del hotel en orden ascendente

---------------------------------------------------------------------------------------------------------
-- Consulta para calcular el promedio de reservas diarias en un hotel.

--javi

SELECT
    h.nombre_hotel,  -- Nombre del hotel
    AVG(daily_reservations.num_reservas) AS promedio_reservas_diarias  -- Promedio de reservas diarias para cada hotel
FROM
    hotel h
JOIN
    habitaciones hab ON h.id = hab.hotel_id -- Une con la tabla de habitaciones usando el id del hotel
JOIN -- Une con la tabla de reservas usando el id de la habitación
    reservas r ON hab.id = r.habitacion_id
JOIN -- Une con una subconsulta que calcula el número de reservas por fecha
    (
        SELECT -- Subconsulta para contar el número de reservas por fecha
            fecha_reservacion,  -- Fecha de la reserva
            COUNT(*) AS num_reservas  -- Número total de reservas para esa fecha
        FROM
            reservas
        GROUP BY
            fecha_reservacion  -- Agrupa por fecha de reserva
    ) AS daily_reservations ON r.fecha_reservacion = daily_reservations.fecha_reservacion
GROUP BY -- Agrupa los resultados por el nombre del hotel
    h.nombre_hotel;


