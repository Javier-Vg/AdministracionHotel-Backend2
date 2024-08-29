

CREATE View vista_reservas_hoy AS
SELECT id, habitacion_id, usuario_id, codigo_de_habitacion, fecha_reservacion, fecha_entrada, fecha_salida
FROM reservas
WHERE reservas.fecha_reservacion = "2024-08-30"


SELECT * FROM vista_reservas_hoy;




