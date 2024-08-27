
DROP TRIGGER IF EXISTS after_reserva_insert;





CREATE TRIGGER after_reserva_insert
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
  
    INSERT INTO disponibilidad_habitaciones (habitacion_id, reservas_id, status_habitacion)
    VALUES (NEW.habitacion_id, NEW.id, FALSE);


    INSERT INTO info_reserva_hotel ( id_de_habitacion, codigo_habitacion)
    VALUES ( NEW.habitacion_id, NEW.codigo_de_habitacion);

 
    INSERT INTO reserva_fecha (fecha_reservacion, reserva_id)
    VALUES (NEW.fecha_reservacion, NEW.id);

   
    INSERT INTO reserva_usuario (usuario_id)
    VALUES (NEW.usuario_id);

   
    INSERT INTO reserva_habitacion (reserva_id, id_de_habitacion)
    VALUES (NEW.id, NEW.habitacion_id);

    
    INSERT INTO codigo_de_reserva (codigo_habitacion)
    VALUES (NEW.codigo_de_habitacion);
END;




CALL agregar_reserva(
    1, 1, 'HAB103', '2024-08-27', '2024-08-25', '2024-09-10'
);

