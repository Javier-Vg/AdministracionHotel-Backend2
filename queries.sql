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
-- Consulta para identificar el hotel con la mayor ocupación en el mes anterior.

SELECT nombre_hotel
FROM hotel, reservas
WHERE reserva_fecha.fecha_reservacion < "2024-08-01" and hotel.nombre_hotel = "Hotel Urban Stay";

SELECT nombre_hotel
FROM hotel
WHERE 

----------------------------------------------------------------------------------------------------------------

SELECT
    hotel.id,
    COUNT(reservas.id) AS Cantidad_reserva
FROM
    reservas
INNER JOIN
    habitaciones hab ON reservas.habitacion_id = hab.id
INNER JOIN
    hotel ON hab.hotel_id = hotel.id
WHERE
    MONTH(reservas.fecha_salida) = MONTH(CURDATE() - INTERVAL 1 MONTH)
    AND YEAR(reservas.fecha_salida) = YEAR(CURDATE() - INTERVAL 1 MONTH)
GROUP BY
    hotel.id
ORDER BY
    Cantidad_reserva DESC
LIMIT 1;


---------------------------------------------------------------------------------------------------------
-- Consulta para calcular el promedio de reservas diarias en un hotel.

SELECT AVG(VacationHours)AS 'Average vacation hours',
    SUM(SickLeaveHours) AS 'Total sick leave hours'
FROM HumanResources.Employee
WHERE JobTitle LIKE 'Vice President%';