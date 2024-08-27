
-- Consultar la disponibilidad de habitaciones por fecha.
CREATE PROCEDURE FechasDisponibilidad(in fechaConsultada date)
BEGIN 

    SELECT reserva_fecha.fecha_reservacion, disponibilidad_habitaciones.status_habitacion, disponibilidad_habitaciones.habitacion_id
    FROM reserva_fecha
    LEFT JOIN disponibilidad_habitaciones
    ON reserva_fecha.fecha_reservacion = fechaConsultada;

END;

DROP TABLE FechasDisponibilidad;

CALL `FechasDisponibilidad`("2024-08-22")


-- Calcular la ocupación de un hotel en un rango de fechas.

