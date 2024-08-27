-- Consulta para contar cuántas habitaciones disponibles hay en un hotel específico en una fecha dada.

CREATE PROCEDURE consulta_recuento_habitaciones_disponibles(in fecha date)
BEGIN 

SELECT id FROM codigo_de_reserva WHERE id IN(
    SELECT COUNT(status_habitacion) 
    FROM disponibilidad_habitaciones
    WHERE disponibilidad_habitaciones.status_habitacion = 1 AND codigo_de_reserva.codigo_habitacion = fecha
);
END;

CALL consulta_recuento_habitaciones_disponibles("2024-08-20");












