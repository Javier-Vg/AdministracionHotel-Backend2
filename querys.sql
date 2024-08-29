-- Consulta para encontrar el hotel con la mayor ocupación en el mes anterior
  SELECT 
    h.nombre_hotel,                    -- Selecciona el nombre del hotel
    COUNT(r.id) AS total_reservas      -- Cuenta el total de reservas
FROM 
    reservas r                         -- Desde la tabla 'reservas'
JOIN 
    habitaciones ha ON r.habitacion_id = ha.id  -- Une con 'habitaciones' por 'habitacion_id'
JOIN 
    hotel h ON ha.hotel_id = h.id      -- Une con 'hotel' por 'hotel_id'
WHERE 
    r.fecha_reservacion >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) 
    AND r.fecha_reservacion <= LAST_DAY(DATE_SUB(CURDATE(), INTERVAL 1 MONTH)) -- Filtra reservas del mes anterior
GROUP BY 
    h.nombre_hotel                     -- Agrupa por nombre del hotel
ORDER BY 
    total_reservas DESC                -- Ordena por total de reservas en forma descendente
LIMIT 1;                               -- Limita el resultado al hotel con más reservas
                            -- Limita el resultado al primer registro (hotel con la mayor ocupación)


-- Consulta para contar cuántas habitaciones disponibles hay en un hotel específico en una fecha dada.

SELECT DISTINCT hotel.nombre_hotel, reserva_fecha.fecha_reservacion, hotel.habitaciones_disponibles
FROM hotel
INNER JOIN reserva_fecha
ON reserva_fecha.fecha_reservacion = "2024-08-20" AND hotel.nombre_hotel = "Hotel Urban Stay";

---------------------------------------------------------------------------------------------

-- Consulta para obtener toda la información de un hotel específico
SELECT 
    *                                    -- Selecciona todas las columnas de la tabla
FROM 
    hotel                              -- Desde la tabla 'hotel'
WHERE 
    nombre_hotel = 'Hotel Grand Palace'; -- Filtra por el nombre del hotel específico


---------------------------------------------------------------------------------------------


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

-- Consulta para buscar hoteles cuya ubicación comienza con un texto específico.

SELECT hotel.nombre_hotel
FROM hotel
WHERE hotel.nombre_hotel LIKE "Hotel Urban%";

---------------------------------------------------------------------------------------------


-- Consulta para obtener todos los hoteles en una ubicación específica
SELECT 
    *                                   
FROM 
    hotel                              -- Desde la tabla 'hotel'
WHERE 
    ubicacion LIKE '%Ciudad A';         -- Filtra por hoteles cuya ubicación contiene 'Ciudad A'


-----------------------------------------------------------------------------------------------------------
-- Consulta para obtener las reservas de un cliente (por email) realizadas en el mes anterior.

SELECT * FROM reservas WHERE usuario_id IN (
    SELECT id FROM clientes WHERE clientes.correo = "maria.garcia@example.com"
) AND reservas.fecha_reservacion < "2024-08-01" AND reservas.fecha_reservacion > "2024-07-01";

------------------------------------------------------------------------------------------------------------
-- Consulta para listar los hoteles que tienen habitaciones disponibles pero no han sido reservadas en el último mes.

SELECT DISTINCT h.nombre_hotel, h.ubicacion
FROM hotel h
JOIN habitaciones hb ON h.id = hb.hotel_id
JOIN reservas r ON hb.id = r.habitacion_id
JOIN disponibilidad_habitaciones dh ON hb.id = dh.habitacion_id
WHERE r.fecha_reservacion BETWEEN '2024-07-01' AND '2024-07-31'
  AND dh.status_habitacion = 'disponible'
ORDER BY h.nombre_hotel;

---------------------------------------------------------------------------------------------------------
-- Consulta para calcular el promedio de reservas diarias en un hotel.

SELECT 
h.nombre_hotel,
AVG(daily_reservations.num_reservas) AS promedio_reservas_diarias
FROM 
    hotel h
JOIN 
    habitaciones hab ON h.id = hab.hotel_id
JOIN 
    reservas r ON hab.id = r.habitacion_id
JOIN 
    (
        SELECT 
            fecha_reservacion,
            COUNT(*) AS num_reservas
        FROM 
            reservas
        GROUP BY 
            fecha_reservacion
    ) AS daily_reservations ON r.fecha_reservacion = daily_reservations.fecha_reservacion
GROUP BY 
    h.nombre_hotel;



