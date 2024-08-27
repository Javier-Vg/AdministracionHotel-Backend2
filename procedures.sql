
CREATE PROCEDURE agregar_reserva(
    IN hab_id INT, IN usua_id INT, IN codi_habitacion VARCHAR(50),IN fech_reserva DATE, IN fech_entrada DATE, IN fech_salida DATE)

BEGIN
    INSERT INTO reservas (habitacion_id,usuario_id,codigo_de_habitacion,fecha_reservacion,fecha_entrada,fecha_salida)VALUES 
    (hab_id,usua_id, codi_habitacion,fech_reserva,fech_entrada,fech_salida);

END;

CALL agregar_reserva(
    1,101,'HAB-123','2024-08-26','2024-09-01','2024-09-10'     
);



