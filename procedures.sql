-- Agregar una reserva nueva.
DROP PROCEDURE IF EXISTS agregar_reserva;

CREATE PROCEDURE agregar_reserva(
    IN hab_id INT, 
    IN usua_id INT, 
    IN codi_habitacion VARCHAR(50),
    IN fech_reserva DATE, 
    IN fech_entrada DATE, 
    IN fech_salida DATE
)
BEGIN
   
    INSERT INTO reservas (habitacion_id, usuario_id, codigo_de_habitacion, fecha_reservacion, fecha_entrada, fecha_salida)
    VALUES (hab_id, usua_id, codi_habitacion, fech_reserva, fech_entrada, fech_salida);
END;

-------------------------------------------------------------------------------------------

-- Cancelar reserva:
DELIMITER //
CREATE PROCEDURE cancelar_reserva(
    IN p_reserva_id INT
)
BEGIN

    -- Se hace un JOIN entre las tablas disponibilidad_habitaciones (dh) y reservas (r) utilizando 
    -- la columna habitacion_id como referencia. Luego, se actualiza el status_habitacion de la tabla
    -- disponibilidad_habitaciones cuando el id de la reserva coincide con p_reserva_id.

    UPDATE disponibilidad_habitaciones dh
    JOIN reservas r
    ON dh.habitacion_id = r.habitacion_id AND reservas_id = p_reserva_id
    SET dh.status_habitacion = "disponible"
    WHERE r.id = p_reserva_id;

END 
DELIMITER;

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

DELIMITER;

-------------------------------------------------------------------------------------------

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

-------------------------------------------------------------------------------------------

CALL cancelar_reserva (11); -- se pasa el id de la reserva para que elimine.

CALL FechasRangosDisponibilidad("2024-06-12", "2024-07-30");  -- Se pasan fechas entre un rango.

CALL ConsultarDisponibilidad("2024-08-20"); -- Se pasa una fecha para consultar disponibilidad.

DROP PROCEDURE IF EXISTS cancelar_reserva; -- Borra un procedure.

-- Se ingresa una reserva nueva enviandole el id de la habitacion y el codigo de habitacion de esa habitacion
CALL agregar_reserva(
    43, 5, 'HAB-13', '2024-010-13', '2024-10-23', '2024-010-29'
);