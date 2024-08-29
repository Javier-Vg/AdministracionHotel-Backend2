CREATE DATABASE basedata;

use basedata;
CREATE PROCEDURE crearTablas()
BEGIN
    -- Creacion tabla administradores:
    CREATE TABLE administradores (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        correo VARCHAR(50) UNIQUE NOT NULL,
        contrasena VARCHAR(50) NOT NULL
    );
    INSERT INTO administradores (nombre, apellido, correo, contrasena) VALUES
    ('Javier', 'Guzmán', 'jvargas@fwdcostarica.com', 'javier34500'),
    ("Alexia", "Cahil", "acahil@fwdcostarica.com", "ale123");

    -- Creación de la tabla usuarios
    CREATE TABLE clientes (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        correo VARCHAR(50) UNIQUE NOT NULL,
        contrasena VARCHAR(50) NOT NULL
    );
    INSERT INTO clientes (nombre, apellido, correo, contrasena) VALUES
    ('Carlos', 'Pérez', 'carlos.perez@example.com', 'password123'),
    ('Ana', 'López', 'ana.lopez@example.com', 'securePass!'),
    ('Luis', 'Martínez', 'luis.martinez@example.com', 'luisPass456'),
    ('María', 'García', 'maria.garcia@example.com', 'maria2024'),
    ('Javier', 'Vargas', 'javior2000@gmail.com', 'javier0880'),
    ('Lucas', 'Gutierrez', 'lucas@gmail.com', 'lucasjaja2'),
    ('Manuel', 'Garcia', 'manuel@gmail.com', 'manuel3400'),
    ('Ernesto', 'Vargas', 'ernesto@gmail.com', 'ErnestoFG23'),
    ('Leonel', 'Messi', 'messi@gmail.com', 'messi10'),
    ('Cristiano', 'Ronaldo', 'ronaldo@gmail.com', 'ronaldo7');

    -- Creación de la tabla hotel
    CREATE TABLE hotel (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre_hotel VARCHAR(50) NOT NULL,
        num_hotel INT NOT NULL,
        cantidad_reservas INT NOT NULL,
        ubicacion VARCHAR(100) NOT NULL,
        informacion VARCHAR(50) NOT NULL,
        habitaciones_disponibles INT NOT NULL
    );
    INSERT INTO hotel (nombre_hotel, num_hotel, cantidad_reservas, ubicacion, informacion,  habitaciones_disponibles) VALUES
    ('Hotel Grand Palace', 101, 19, 'Calle Principal 123, Ciudad A', 'Lujoso y moderno', 15),
    ('Hotel Blue Lagoon', 102, 4, 'Avenida del Mar 456, Ciudad B', 'Cerca de la playa', 15),
    ('Hotel Central Park', 103, 1, 'Calle 7, Ciudad C', 'En el centro de la ciudad', 15),
    ('Hotel Mountain Retreat', 104, 3, 'Ruta de las Montañas, Ciudad D', 'Retiro en la montaña', 15),
    ('Hotel Urban Stay', 105, 3, 'Avenida de la Cultura 789, Ciudad E', 'Moderno y funcional', 15);
    
    -- Creación de la tabla habitaciones
    CREATE TABLE habitaciones (
        id INT AUTO_INCREMENT PRIMARY KEY,
        codigo_habitacion VARCHAR(50) NOT NULL,
        precio INT NOT NULL,
        informacion_habitaciones VARCHAR(50) NOT NULL,
        tipo_de_habitacion INT NOT NULL,
        hotel_id INT NOT NULL,
        FOREIGN KEY (hotel_id) REFERENCES hotel(id)
    );

    -- Crear un índice en la columna 'codigo_habitacion'
    CREATE INDEX idx_codigo_habitacion ON habitaciones(codigo_habitacion);

    -- Creacion de las habitaciones con su codigo 
    INSERT INTO habitaciones (codigo_habitacion, precio, informacion_habitaciones, tipo_de_habitacion, hotel_id) VALUES
    ('HAB-01', 100, 'Vista al mar, 2 camas dobles', 1, 1),
    ('HAB-02', 150, 'Suite con balcón privado', 2, 1),
    ('HAB-03', 120, 'Vista al jardín, 1 cama queen', 3, 1),
    ('HAB-04', 180, 'Suite, vista a la piscina, 1 cama king', 4, 1),
    ('HAB-05', 200, 'Suite presidencial, 2 camas queen, jacuzzi', 5, 1),
    ('HAB-06', 110, 'Vista a la ciudad, 2 camas individuales', 1, 1),
    ('HAB-07', 140, 'Vista a la piscina, 1 cama queen', 2, 1),
    ('HAB-08', 160, 'Vista al mar, 2 camas dobles', 4, 1),
    ('HAB-09', 220, 'Penthouse, vista panorámica, 1 cama king', 5, 1),
    ('HAB-10', 115, 'Vista al jardín, 1 cama individual', 1, 1),
    ('HAB-11', 145, 'Vista a la ciudad, 1 cama queen', 2, 1),
    ('HAB-12', 175, 'Vista al mar, 1 cama king', 4, 1),
    ('HAB-13', 130, 'Vista a la piscina, 2 camas individuales', 3, 1),
    ('HAB-14', 160, 'Vista al jardín, 2 camas dobles', 4, 1),
    ('HAB-15', 190, 'Suite con balcón privado', 5, 1),
    ('HAB-01', 100, 'Vista al mar, 2 camas dobles', 1, 2),
    ('HAB-02', 150, 'Suite con balcón privado', 2, 2),
    ('HAB-03', 120, 'Vista al jardín, 1 cama queen', 3, 2),
    ('HAB-04', 180, 'Suite, vista a la piscina, 1 cama king', 4, 2),
    ('HAB-05', 200, 'Suite presidencial, 2 camas queen, jacuzzi', 5, 2),
    ('HAB-06', 110, 'Vista a la ciudad, 2 camas individuales', 1, 2),
    ('HAB-07', 140, 'Vista a la piscina, 1 cama queen', 2, 2),
    ('HAB-08', 160, 'Vista al mar, 2 camas dobles', 4, 2),
    ('HAB-09', 220, 'Penthouse, vista panorámica, 1 cama king', 5, 2),
    ('HAB-10', 115, 'Vista al jardín, 1 cama individual', 1, 2),
    ('HAB-11', 145, 'Vista a la ciudad, 1 cama queen', 2, 2),
    ('HAB-12', 175, 'Vista al mar, 1 cama king', 4, 2),
    ('HAB-13', 130, 'Vista a la piscina, 2 camas individuales', 3, 2),
    ('HAB-14', 160, 'Vista al jardín, 2 camas dobles', 4, 2),
    ('HAB-15', 190, 'Suite con balcón privado', 5, 2),
    ('HAB-01', 100, 'Vista al mar, 2 camas dobles', 1, 3),
    ('HAB-02', 150, 'Suite con balcón privado', 2, 3),
    ('HAB-03', 120, 'Vista al jardín, 1 cama queen', 3, 3),
    ('HAB-04', 180, 'Suite, vista a la piscina, 1 cama king', 4, 3),
    ('HAB-05', 200, 'Suite presidencial, 2 camas queen, jacuzzi', 5, 3),
    ('HAB-06', 110, 'Vista a la ciudad, 2 camas individuales', 1, 3),
    ('HAB-07', 140, 'Vista a la piscina, 1 cama queen', 2, 3),
    ('HAB-08', 160, 'Vista al mar, 2 camas dobles', 4, 3),
    ('HAB-09', 220, 'Penthouse, vista panorámica, 1 cama king', 5, 3),
    ('HAB-10', 115, 'Vista al jardín, 1 cama individual', 1, 3),
    ('HAB-11', 145, 'Vista a la ciudad, 1 cama queen', 2, 3),
    ('HAB-12', 175, 'Vista al mar, 1 cama king', 4, 3),
    ('HAB-13', 130, 'Vista a la piscina, 2 camas individuales', 3, 3),
    ('HAB-14', 160, 'Vista al jardín, 2 camas dobles', 4, 3),
    ('HAB-15', 190, 'Suite con balcón privado', 5, 3),
    ('HAB-01', 100, 'Vista al mar, 2 camas dobles', 1, 4),
    ('HAB-02', 150, 'Suite con balcón privado', 2, 4),
    ('HAB-03', 120, 'Vista al jardín, 1 cama queen', 3, 4),
    ('HAB-04', 180, 'Suite, vista a la piscina, 1 cama king', 4, 4),
    ('HAB-05', 200, 'Suite presidencial, 2 camas queen, jacuzzi', 5, 4),
    ('HAB-06', 110, 'Vista a la ciudad, 2 camas individuales', 1, 4),
    ('HAB-07', 140, 'Vista a la piscina, 1 cama queen', 2, 4),
    ('HAB-08', 160, 'Vista al mar, 2 camas dobles', 4, 4),
    ('HAB-09', 220, 'Penthouse, vista panorámica, 1 cama king', 5, 4),
    ('HAB-10', 115, 'Vista al jardín, 1 cama individual', 1, 4),
    ('HAB-11', 145, 'Vista a la ciudad, 1 cama queen', 2, 4),
    ('HAB-12', 175, 'Vista al mar, 1 cama king', 4, 4),
    ('HAB-13', 130, 'Vista a la piscina, 2 camas individuales', 3, 4),
    ('HAB-14', 160, 'Vista al jardín, 2 camas dobles', 4, 4),
    ('HAB-15', 190, 'Suite con balcón privado', 5, 4),
    ('HAB-01', 100, 'Vista al mar, 2 camas dobles', 1, 5),
    ('HAB-02', 150, 'Suite con balcón privado', 2, 5),
    ('HAB-03', 120, 'Vista al jardín, 1 cama queen', 3, 5),
    ('HAB-04', 180, 'Suite, vista a la piscina, 1 cama king', 4, 5),
    ('HAB-05', 200, 'Suite presidencial, 2 camas queen, jacuzzi', 5, 5),
    ('HAB-06', 110, 'Vista a la ciudad, 2 camas individuales', 1, 5),
    ('HAB-07', 140, 'Vista a la piscina, 1 cama queen', 2, 5),
    ('HAB-08', 160, 'Vista al mar, 2 camas dobles', 4, 5),
    ('HAB-09', 220, 'Penthouse, vista panorámica, 1 cama king', 5, 5),
    ('HAB-10', 115, 'Vista al jardín, 1 cama individual', 1, 5),
    ('HAB-11', 145, 'Vista a la ciudad, 1 cama queen', 2, 5),
    ('HAB-12', 175, 'Vista al mar, 1 cama king', 4, 5),
    ('HAB-13', 130, 'Vista a la piscina, 2 camas individuales', 3, 5),
    ('HAB-14', 160, 'Vista al jardín, 2 camas dobles', 4, 5),
    ('HAB-15', 190, 'Suite con balcón privado', 5, 5);

    -- Creación de la tabla reservas
    CREATE TABLE reservas (
        id INT AUTO_INCREMENT PRIMARY KEY,
        habitacion_id INT NOT NULL,
        usuario_id INT NOT NULL,
        codigo_de_habitacion VARCHAR(50) NOT NULL,
        fecha_reservacion DATE NOT NULL,
        fecha_entrada DATE NOT NULL,
        fecha_salida DATE NOT NULL,
        FOREIGN KEY (habitacion_id) REFERENCES habitaciones(id),
        FOREIGN KEY (usuario_id) REFERENCES clientes(id),
        FOREIGN KEY (codigo_de_habitacion) REFERENCES habitaciones(codigo_habitacion)
    );

    INSERT INTO reservas (habitacion_id, usuario_id, codigo_de_habitacion, fecha_reservacion, fecha_entrada, fecha_salida) VALUES
    (1, 1, 'HAB-01', '2024-08-20', '2024-08-25', '2024-08-30'),
    (67, 2, 'HAB-02', '2024-08-22', '2024-08-27', '2024-09-02'),
    (3, 3, 'HAB-03', '2024-09-23', '2024-09-28', '2024-10-05'),
    (70, 7, 'HAB-01', '2024-08-24', '2024-08-28', '2024-09-05'),
    (2, 2, 'HAB-02', '2024-05-22', '2024-06-27', '2024-07-02'),
    (3, 3, 'HAB-03', '2024-08-23', '2024-08-28', '2024-09-05'),
    (4, 4, 'HAB-04', '2024-08-24', '2024-08-29', '2024-09-03'),
    (48, 5, 'HAB-05', '2024-06-25', '2024-07-30', '2024-08-06'),
    (4, 6, 'HAB-06', '2024-08-26', '2024-08-31', '2024-09-07'),
    (2, 7, 'HAB-14', '2024-08-27', '2024-09-01', '2024-09-08'),
    (5, 8, 'HAB-08', '2024-07-28', '2024-08-02', '2024-08-09'),
    (4, 9, 'HAB-09', '2024-08-29', '2024-09-03', '2024-09-10'),
    (3, 10, 'HAB-10', '2024-08-30', '2024-09-12', '2024-09-17'),
    (3, 10, 'HAB-10', '2024-08-30', '2024-09-05', '2024-09-10'),
    (59, 5, 'HAB-11', '2024-08-31', '2024-09-07', '2024-09-12'),
    (5, 2, 'HAB-12', '2024-09-01', '2024-09-08', '2024-09-13'),
    (3, 3, 'HAB-13', '2024-09-02', '2024-09-09', '2024-09-14'),
    (19, 4, 'HAB-14', '2024-09-03', '2024-09-10', '2024-09-15'),
    (2, 5, 'HAB-15', '2024-09-04', '2024-09-11', '2024-09-16'),
    (56, 6, 'HAB-13', '2024-09-05', '2024-09-12', '2024-09-17'),
    (1, 7, 'HAB-12', '2024-09-06', '2024-09-13', '2024-09-18'),
    (5, 8, 'HAB-05', '2024-09-07', '2024-09-14', '2024-09-19'),
    (17, 9, 'HAB-01', '2024-09-08', '2024-09-15', '2024-09-20'),
    (24, 2, 'HAB-13', '2024-09-09', '2024-09-16', '2024-09-21'),
    (71, 2, 'HAB-09', '2024-09-10', '2024-09-17', '2024-09-22'),
    (24, 8, 'HAB-09', '2024-09-11', '2024-09-18', '2024-09-23'),
    (3, 8, 'HAB-07', '2024-09-12', '2024-09-19', '2024-09-24'),
    (5, 3, 'HAB-11', '2024-10-13', '2024-010-20', '2024-10-25'),
    (43, 1, 'HAB-10', '2024-05-13', '2024-05-20', '2024-05-25'),
    (1, 4, 'HAB-10', '2024-07-13', '2024-07-20', '2024-07-25');


    CREATE INDEX idx_fecha_reservacion ON reservas(fecha_reservacion);

    -- Creación de la tabla disponibilidad_habitaciones
    CREATE TABLE disponibilidad_habitaciones (
        id INT AUTO_INCREMENT PRIMARY KEY,
        habitacion_id INT NOT NULL,
        reservas_id INT NOT NULL,
        status_habitacion VARCHAR(50) NOT NULL,
        FOREIGN KEY (reservas_id) REFERENCES reservas(id),
        FOREIGN KEY (habitacion_id) REFERENCES habitaciones(id)
    );
    INSERT INTO disponibilidad_habitaciones (habitacion_id, reservas_id, status_habitacion) VALUES
    (1, 1, "ocupado"),
    (67, 2, "ocupado"),
    (3, 3, "ocupado"),
    (70, 4, "ocupado"),
    (2, 5, "ocupado"),
    (3, 6, "ocupado"),
    (4, 7, "ocupado"),
    (48, 8, "ocupado"),
    (4, 9, "ocupado"),
    (2, 10, "ocupado"),
    (5, 11, "ocupado"),
    (4, 12, "ocupado"),
    (3, 13, "ocupado"),
    (3, 14, "ocupado"),
    (59, 15, "ocupado"),
    (5, 16, "ocupado"),
    (3, 17, "ocupado"),
    (19, 18, "ocupado"),
    (2, 19, "ocupado"),
    (56, 20, "ocupado"),
    (1, 21, "ocupado"),
    (5, 22, "ocupado"),
    (17, 23, "ocupado"),
    (24, 24, "ocupado"),
    (71, 25, "ocupado"),
    (24, 26, "ocupado"),
    (3, 27, "ocupado"),
    (5, 28, "ocupado"),
    (43, 29, "ocupado"),
    (1, 30, "ocupado");

    -- Creación de la tabla info_reserva_hotel
    CREATE TABLE info_reserva_hotel (
        id INT AUTO_INCREMENT PRIMARY KEY,
        reserva_id INT NOT NULL,
        id_de_habitacion INT NOT NULL,
        codigo_habitacion VARCHAR(50) NOT NULL,
        FOREIGN KEY (reserva_id) REFERENCES reservas(id),
        FOREIGN KEY (id_de_habitacion) REFERENCES habitaciones(id),
        FOREIGN KEY (codigo_habitacion) REFERENCES habitaciones(codigo_habitacion)
    );

    INSERT INTO info_reserva_hotel (reserva_id, id_de_habitacion, codigo_habitacion) VALUES
    (1, 1 , 'HAB-01' ),
    (2, 67 , 'HAB-02'),
    (3, 3 ,  'HAB-03'),
    (4, 70 , 'HAB-01'),
    (5, 2 ,  'HAB-02'),
    (6, 3 , 'HAB-03'),
    (7, 4 , 'HAB-04'),
    (8, 48 ,  'HAB-05'),
    (9, 4 , 'HAB-06'),
    (10, 2 , 'HAB-14'),
    (11, 5 , 'HAB-08'),
    (12, 4 , 'HAB-09'),
    (13, 3 , 'HAB-10'),
    (14, 3 , 'HAB-10'),
    (15, 59 ,  'HAB-11'),
    (16, 5 , 'HAB-12'),
    (17, 3 , 'HAB-13'),
    (18,1  , 'HAB-14'),
    (19, 2 , 'HAB-15'),
    (20, 56 , 'HAB-13'),
    (21, 1 , 'HAB-12'),
    (22, 5 , 'HAB-05'),
    (23, 17 ,  'HAB-01'),
    (24, 24 , 'HAB-13'),
    (25, 71 , 'HAB-09'),
    (26, 24 ,  'HAB-09'),
    (27, 3 , 'HAB-07'),
    (28, 5 , 'HAB-11'),
    (29, 43 , 'HAB-10'),
    (30, 1 , 'HAB-10');

    -- Creación de la tabla reserva_fecha
    CREATE TABLE reserva_fecha (
        id INT AUTO_INCREMENT PRIMARY KEY,
        fecha_reservacion DATE NOT NULL,
        reserva_id INT NOT NULL,
        FOREIGN KEY (reserva_id) REFERENCES reservas(id)
    );
    
    INSERT INTO reserva_fecha (fecha_reservacion, reserva_id) VALUES
    ('2024-08-20', 1),
    ('2024-08-22', 2),
    ('2024-09-23', 3),
    ('2024-08-24', 4),
    ('2024-05-22', 5),
    ('2024-08-23', 6),
    ('2024-08-24', 7),
    ('2024-06-25', 8),
    ('2024-08-26', 9),
    ('2024-08-27', 10),
    ('2024-07-28', 11),
    ('2024-08-29', 12),
    ('2024-08-30', 13),
    ('2024-08-30', 14),
    ('2024-08-31', 15),
    ('2024-09-01', 16),
    ('2024-09-02', 17),
    ('2024-09-03', 18),
    ('2024-09-04', 19),
    ('2024-09-05', 20),
    ('2024-09-06', 21),
    ('2024-09-07', 22),
    ('2024-09-08', 23),
    ('2024-09-09', 24),
    ('2024-09-10', 25),
    ('2024-09-11', 26),
    ('2024-09-12', 27),
    ('2024-10-13', 28),
    ('2024-05-13', 29),
    ('2024-07-13', 30);

    -- Creación de la tabla reserva_usuario
     CREATE TABLE reserva_usuario (
        id INT AUTO_INCREMENT PRIMARY KEY,
        usuario_id INT NOT NULL,
        reserva_id INT NOT NULL,
        FOREIGN KEY (usuario_id) REFERENCES clientes(id),
        FOREIGN KEY (reserva_id) REFERENCES reservas(id)
    );

    INSERT INTO reserva_usuario (usuario_id, reserva_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (7, 4),
    (2, 5),
    (3, 6),
    (4, 7),
    (5, 8),
    (6, 9),
    (7, 10),
    (8, 11),
    (9, 12),
    (10, 13),
    (10, 14),
    (5, 15),
    (2, 16),
    (3, 17),
    (4, 18),
    (5, 19),
    (6, 20),
    (7, 21),
    (8, 22),
    (9, 23),
    (2, 24),
    (2, 25),
    (8, 26),
    (8, 27),
    (3, 28),
    (1, 29),
    (4,30);

    -- Creación de la tabla reserva_habitacion
    CREATE TABLE reserva_habitacion (
        id INT AUTO_INCREMENT PRIMARY KEY,
        reserva_id INT NOT NULL,
        id_de_habitacion INT NOT NULL,
        FOREIGN KEY (reserva_id) REFERENCES reservas(id),
        FOREIGN KEY (id_de_habitacion) REFERENCES habitaciones(id)
    );
    INSERT INTO reserva_habitacion (reserva_id, id_de_habitacion) VALUES
    (1, 1),
    (2, 67),
    (3, 3),
    (4, 70),
    (5, 2),
    (6, 3),
    (7, 4),
    (8, 48),
    (9, 4),
    (10, 2),
    (11, 5),
    (12, 4),
    (13, 3),
    (14, 3),
    (15, 59),
    (16, 5),
    (17, 3),
    (18, 1),
    (19, 2),
    (20, 56),
    (21, 1),
    (22, 5),
    (23, 17),
    (24, 24),
    (25, 71),
    (26, 24),
    (27, 3),
    (28, 5),
    (29, 43),
    (30, 1);


  -- Creación de la tabla codigo_de_reserva
    CREATE TABLE codigo_de_reserva (
        id INT AUTO_INCREMENT PRIMARY KEY,
        codigo_habitacion VARCHAR(100) NOT NULL,
        reserva_id INT NOT NULL,
        FOREIGN KEY (codigo_habitacion) REFERENCES habitaciones(codigo_habitacion),
        FOREIGN KEY (reserva_id) REFERENCES reservas(id)
    );

    INSERT INTO codigo_de_reserva (codigo_habitacion, reserva_id) VALUES
    ('HAB-01',1),
    ('HAB-02',2),
    ('HAB-03',3),
    ('HAB-01',4),
    ('HAB-02',5),
    ('HAB-03',6),
    ('HAB-04',7),
    ('HAB-05',8),
    ('HAB-06',9),
    ('HAB-14',10),
    ('HAB-08',11),
    ('HAB-09',12),
    ('HAB-10',13),
    ('HAB-10',14),
    ('HAB-11',15),
    ('HAB-12',16),
    ('HAB-13',17),
    ('HAB-14',18),
    ('HAB-15',19),
    ('HAB-13',20),
    ('HAB-12',21),
    ('HAB-05',22),
    ('HAB-01',23),
    ('HAB-13',24),
    ('HAB-09',25),
    ('HAB-09',26),
    ('HAB-07',27),
    ('HAB-11',28),
    ('HAB-10',29),
    ('HAB-10',30);

END;
-- Llamada al procedimiento
CALL crearTablas();--Crea las tablas



