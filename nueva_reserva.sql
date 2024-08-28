
DROP TRIGGER IF EXISTS after_reserva_insert;

CREATE TRIGGER after_reserva_insert
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
    INSERT INTO disponibilidad_habitaciones (habitacion_id, reservas_id, status_habitacion)
    VALUES (NEW.habitacion_id, NEW.id, FALSE);

    INSERT INTO info_reserva_hotel (reserva_id, id_de_habitacion, codigo_habitacion)
    VALUES (NEW.id, NEW.habitacion_id, NEW.codigo_de_habitacion);

    INSERT INTO reserva_fecha (fecha_reservacion, reserva_id)
    VALUES (NEW.fecha_reservacion, NEW.id);

    INSERT INTO reserva_usuario (usuario_id, reserva_id)
    VALUES (NEW.usuario_id, NEW.id);

    INSERT INTO reserva_habitacion (reserva_id, id_de_habitacion)
    VALUES (NEW.id, NEW.habitacion_id);

    INSERT INTO codigo_de_reserva (codigo_habitacion, reserva_id)
    VALUES (NEW.codigo_de_habitacion, NEW.id);

    UPDATE hotel
    SET columna = valor1, columna2 = valor2
    WHERE condicionnnn

END;

CALL agregar_reserva(
    1, 1, 'HAB105', '2024-09-27', '2024-08-25', '2024-09-10'
);

---------------------------------------------------------

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
DELIMITER //
CREATE PROCEDURE cancelar_reserva(
    IN p_reserva_id INT,
    IN codigo VARCHAR(50),
    IN usuario_id INT
)
BEGIN
    DELETE FROM codigo_de_reserva
    WHERE id = p_reserva_id;

    DELETE FROM reserva_habitacion
    WHERE reserva_id = p_reserva_id;

    DELETE FROM reserva_usuario
    WHERE reserva_id = p_reserva_id;

    DELETE FROM reserva_fecha
    WHERE reserva_id = p_reserva_id;

    DELETE FROM disponibilidad_habitaciones
    WHERE reservas_id = p_reserva_id;

    DELETE FROM info_reserva_hotel
    WHERE reserva_id = p_reserva_id;

    DELETE FROM reservas
    WHERE id = p_reserva_id;
END //
DELIMITER;
CALL cancelar_reserva (1, 'HAB101', 1);

---------------------------------------------------------------------
UPDATE hotel
SET habitaciones_disponibles = NOW.habitaciones_disponibles -= 1
WHERE id
