
DROP TRIGGER IF EXISTS reservas_insert;

CREATE TRIGGER reservas_insert
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN

    UPDATE hotel
    SET cantidad_reservas = cantidad_reservas + 1
    WHERE id = (SELECT hotel_id FROM habitaciones WHERE id = NEW.habitacion_id);

    INSERT INTO disponibilidad_habitaciones (habitacion_id, reservas_id, status_habitacion)
    VALUES (NEW.habitacion_id, NEW.id, "ocupado");

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

END;

CALL agregar_reserva(
    34, 7, 'HAB-07', '2008-06-17', '2024-08-25', '2024-09-10'
);

-- triger nuevo----------------------------------

CREATE TRIGGER after_reserva_delete
AFTER UPDATE ON disponibilidad_habitaciones
FOR EACH ROW
BEGIN

    UPDATE hotel
    SET cantidad_reservas = cantidad_reservas - 1
    WHERE id = (SELECT hotel_id FROM habitaciones WHERE id = OLD.habitacion_id);

END;

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

END //
DELIMITER;

CALL cancelar_reserva (3); -- se pasa el id de la reserva para que elimine

---------------------------------------------------------------------
