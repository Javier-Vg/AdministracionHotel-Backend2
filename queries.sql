-- Consulta para contar cuántas habitaciones disponibles hay en un hotel específico en una fecha dada.

SELECT DISTINCT hotel.nombre_hotel, reserva_fecha.fecha_reservacion, hotel.capacidad_habitaciones
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
-- Consulta para identificar el hotel con la mayor ocupación en el mes anterior.
