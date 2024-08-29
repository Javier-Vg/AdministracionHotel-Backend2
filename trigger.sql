
DROP TRIGGER IF EXISTS reserva_insert;


-- triger nuevo----------------------------------
CREATE TRIGGER resta_reservas
AFTER UPDATE ON disponibilidad_habitaciones
FOR EACH ROW
BEGIN
    UPDATE hotel
    SET cantidad_reservas = cantidad_reservas - 1
    WHERE id = (SELECT hotel_id FROM habitaciones WHERE id = OLD.habitacion_id);

END;

--------------------------------------------------
DROP TRIGGER reserva_insert 

CREATE TRIGGER reserva_insert
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
    74, 5, 'HAB-14', '2024-09-13', '2024-08-23', '2024-09-10'
);

-- Aquí debrían poner un CURDATE() para que la fecha de reseva se meta automaticamente a la de hhoy, y si preguntan, en la tabla deberán meter un DEFAULT DATE. ;)

