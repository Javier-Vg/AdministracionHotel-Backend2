
-- Consultar la disponibilidad de habitaciones por fecha.
CREATE PROCEDURE FechasDisponibilidad(in fechaConsultada date)
BEGIN 

    SELECT reserva_fecha.fecha_reservacion as "Fecha de reservas", disponibilidad_habitaciones.status_habitacion as "Disponibilidad"
    FROM reserva_fecha
    LEFT JOIN disponibilidad_habitaciones
    ON reserva_fecha.reserva_id = disponibilidad_habitaciones.habitacion_id
    WHERE reserva_fecha.fecha_reservacion = fechaConsultada;

END;

DROP TABLE FechasDisponibilidad;

use basedata

drop Procedure `FechasDisponibilidad`;

CALL `FechasDisponibilidad`("2024-08-23");

-- Calcular la ocupación de un hotel en un rango de fechas.

CREATE PROCEDURE FechasDisponibilidadRangoFechas(in rango1 date, in rango2 date)
BEGIN 

    SELECT reserva_fecha.fecha_reservacion as "Fecha de reservas", disponibilidad_habitaciones.status_habitacion as "Disponibilidad"
    FROM reserva_fecha
    LEFT JOIN disponibilidad_habitaciones
    ON reserva_fecha.reserva_id = disponibilidad_habitaciones.habitacion_id
    LEFT JOIN 
        reservas
    ON 
        reserva_fecha.reserva_id = reservas.id
    WHERE 
        reservas.fecha_entrada >= rango1 AND reservas.fecha_salida <= rango2;

END;

DROP TABLE FechasDisponibilidadRangoFechas;

use basedata

drop Procedure `FechasDisponibilidadRangoFechas`;

CALL `FechasDisponibilidadRangoFechas`("2024-08-23", "2024-09-30");
