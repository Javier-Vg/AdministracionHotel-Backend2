-- Consulta para contar cuántas habitaciones disponibles hay en un hotel específico en una fecha dada.

SELECT DISTINCT hotel.nombre_hotel, reserva_fecha.fecha_reservacion, hotel.habitaciones_disponibles
FROM hotel
INNER JOIN reserva_fecha
ON reserva_fecha.fecha_reservacion = "2024-08-20" AND hotel.nombre_hotel = "Hotel Urban Stay";

----------------------------------------------------------------------------------------------------------
-- Consulta para buscar hoteles cuya ubicación comienza con un texto específico.

SELECT hotel.nombre_hotel
FROM hotel
WHERE hotel.nombre_hotel LIKE "Hotel Urban%";

-----------------------------------------------------------------------------------------------------------
-- Consulta para obtener las reservas de un cliente (por email) realizadas en el mes anterior.

SELECT * FROM reservas WHERE usuario_id IN (
    SELECT id FROM clientes WHERE clientes.correo = "javior2000@gmail.com"
) AND reservas.fecha_reservacion < "2024-08-01";

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





