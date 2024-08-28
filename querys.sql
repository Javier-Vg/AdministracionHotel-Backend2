-- Llamada al procedimiento para crear las tablas e insertar datos
CALL crearTablas();

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




-- Consulta para obtener toda la información de un hotel específico
SELECT 
    *                                    -- Selecciona todas las columnas de la tabla
FROM 
    hotel                              -- Desde la tabla 'hotel'
WHERE 
    nombre_hotel = 'Hotel Grand Palace'; -- Filtra por el nombre del hotel específico





-- Consulta para obtener todos los hoteles en una ubicación específica
SELECT 
    *                                   
FROM 
    hotel                              -- Desde la tabla 'hotel'
WHERE 
    ubicacion LIKE '%Ciudad A';         -- Filtra por hoteles cuya ubicación contiene 'Ciudad A'








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












