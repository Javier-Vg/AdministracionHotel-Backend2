
CREATE View vista_reservas_hoy AS
SELECT id, habitacion_id, usuario_id, fecha_reservacion, fecha_entrada, fecha_salida
FROM reservas
WHERE reservas.fecha_reservacion = CURDATE(); -- CURDATE es para obtener el dia actual.

SELECT * FROM vista_reservas_hoy; --Selecciona la vista.




