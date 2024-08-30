DROP TRIGGER IF EXISTS reserva_insert;

-----------------trigger que resta un espacio en las reservas de un hotel en especifico-------------------

CREATE TRIGGER resta_reservas
AFTER UPDATE ON disponibilidad_habitaciones --Trigger que va a dispararse cuando se actualizen datos a la tabla "disponibilidad_habitaciones".
FOR EACH ROW
BEGIN
    UPDATE hotel
    SET cantidad_reservas = cantidad_reservas - 1  -- Establece la nueva cantidad de reservas reduciendo en 1
    WHERE id = (SELECT hotel_id FROM habitaciones WHERE id = OLD.habitacion_id); --Subconsulta para obtener el hotel_id de la habitación que se está actualizando
    -- Aquí, se está utilizando una subconsulta para encontrar el hotel_id asociado con la habitacion_id que está siendo actualizada.
END;

--------------------------------------------------------------------------------------------------------------

DROP TRIGGER IF EXISTS reservas_insert; -- Borra el trigger

CREATE TRIGGER reserva_insert
AFTER INSERT ON reservas --Trigger que va a dispararse cuando se inserten datos a la tabla "reservas".
FOR EACH ROW
BEGIN

    UPDATE hotel
    SET cantidad_reservas = cantidad_reservas + 1  -- Establece la nueva cantidad de reservas aumentando en 1
    WHERE id = (SELECT hotel_id FROM habitaciones WHERE id = NEW.habitacion_id);
   
    INSERT INTO disponibilidad_habitaciones (habitacion_id, reservas_id, status_habitacion)
    VALUES (NEW.habitacion_id, NEW.id, "ocupado");  -- NEW.id es el ID de la nueva reserva que se está creando.

  
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

    -- son referencias a los valores del nuevo registro en el contexto de un trigger.
END;