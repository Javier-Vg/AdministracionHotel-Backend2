
-- Consultar la disponibilidad de habitaciones por fecha.
DELIMITER //

CREATE PROCEDURE ConsultarDisponibilidad(IN fecha DATE)
BEGIN
    SELECT DISTINCT hotel.nombre_hotel, reservas.fecha_reservacion, reservas.id as reserva_id, disponibilidad_habitaciones.status_habitacion
    FROM reservas 
    INNER JOIN habitaciones 
    ON reservas.habitacion_id = habitaciones.id
    INNER JOIN hotel 
    ON habitaciones.hotel_id = hotel.id
    INNER JOIN disponibilidad_habitaciones 
    ON reservas.id = disponibilidad_habitaciones.reservas_id
    WHERE reservas.fecha_reservacion = fecha;
END //

DELIMITER ;

CALL ConsultarDisponibilidad("2024-08-20");

--------------------------------------------------------------------------------------------------------------------------
-- Calcular la ocupación de un hotel en un rango de fechas.
DELIMITER ;
CREATE PROCEDURE FechasRangosDisponibilidad(IN rango1 DATE, IN rango2 DATE)
BEGIN
    SELECT DISTINCT hotel.nombre_hotel, reservas.fecha_reservacion, reservas.id AS reserva_id, disponibilidad_habitaciones.status_habitacion
    FROM reservas 
    INNER JOIN habitaciones ON reservas.habitacion_id = habitaciones.id
    INNER JOIN hotel ON habitaciones.hotel_id = hotel.id
    INNER JOIN disponibilidad_habitaciones ON reservas.id = disponibilidad_habitaciones.reservas_id
    WHERE reservas.fecha_reservacion >= rango1 AND reservas.fecha_reservacion <= rango2;
END //


CALL FechasRangosDisponibilidad("2024-06-12", "2024-07-30");



SELECT * FROM reserva_fecha WHERE fecha_reservacion = '2024-08-20';