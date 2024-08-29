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

USE basedata;

DROP PROCEDURE IF EXISTS cancelar_reserva;

DELIMITER / /

CREATE PROCEDURE cancelar_reserva(
    IN p_reserva_id INT
)
BEGIN

    UPDATE disponibilidad_habitaciones dh
    JOIN reservas r
    ON dh.habitacion_id = r.habitacion_id AND reservas_id = p_reserva_id
    SET dh.status_habitacion = "disponible"
    WHERE r.id = p_reserva_id;

    -- DELETE FROM codigo_de_reserva 
    -- WHERE id = p_reserva_id;

    -- DELETE FROM reserva_habitacion 
    -- WHERE reserva_id = p_reserva_id;
    
    -- DELETE FROM reserva_usuario 
    -- WHERE reserva_id = p_reserva_id;

    -- DELETE FROM reserva_fecha 
    -- WHERE reserva_id = p_reserva_id;
   
    -- DELETE FROM disponibilidad_habitaciones 
    -- WHERE reservas_id = p_reserva_id;

    -- DELETE FROM info_reserva_hotel 
    -- WHERE reserva_id = p_reserva_id;

    -- DELETE FROM reservas 
    -- WHERE id = p_reserva_id;

END 

DELIMITER;

CALL cancelar_reserva (2);