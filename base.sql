
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
    ('Javier', 'Guzmán', 'jvargas@fwdcostarica.com', 'javier34500');
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
    ('Hotel Grand Palace', 101, 25, 'Calle Principal 123, Ciudad A', 'Lujoso y moderno', 55),
    ('Hotel Blue Lagoon', 102, 15, 'Avenida del Mar 456, Ciudad B', 'Cerca de la playa', 40),
    ('Hotel Central Park', 103, 30, 'Calle 7, Ciudad C', 'En el centro de la ciudad', 50),
    ('Hotel Mountain Retreat', 104, 20, 'Ruta de las Montañas, Ciudad D', 'Retiro en la montaña', 25),
    ('Hotel Urban Stay', 105, 10, 'Avenida de la Cultura 789, Ciudad E', 'Moderno y funcional',5 );

    -- Creación de la tabla habitaciones
    CREATE TABLE habitaciones (
        id INT AUTO_INCREMENT PRIMARY KEY,
        codigo_habitacion VARCHAR(50) UNIQUE NOT NULL,
        precio INT NOT NULL,
        informacion_habitaciones VARCHAR(50) NOT NULL,
        tipo_de_habitacion INT NOT NULL,
        hotel_id INT NOT NULL,
        FOREIGN KEY (hotel_id) REFERENCES hotel(id)
    );

    INSERT INTO habitaciones (codigo_habitacion, precio, informacion_habitaciones, tipo_de_habitacion, hotel_id) VALUES
    ('HAB101', 100, 'Vista al mar, 2 camas dobles', 1, 1),
    ('HAB102', 150, 'Suite con balcón privado', 2, 1),
    ('HAB103', 200, 'Habitación con jacuzzi', 3, 2),
    ('HAB104', 150, 'Suite, vista al mar, 1 cama king', 4, 2),
    ('HAB105', 200, 'Suite presidencial, 1 cama king, jacuzzi', 5, 2),
    ('HAB106', 80, 'Vista a la ciudad, 1 cama queen', 1, 3),
    ('HAB107', 130, 'Vista al mar, 2 camas dobles, balcón', 2, 3),
    ('HAB108', 75, 'Vista a la piscina, 1 cama individual', 3, 4),
    ('HAB109', 180, 'Suite ejecutiva, 1 cama king, escritorio', 4, 4),
    ('HAB110', 220, 'Penthouse, vista panorámica, 2 camas king', 5, 5),
    ('HAB111', 90, 'Vista a la piscina, 2 camas individuales', 3, 1),
    ('HAB112', 90, 'Vista a la piscina, 2 camas individuales', 3, 1),
    ('HAB113', 95, 'Vista al jardín, 1 cama individual', 3, 2),
    ('HAB114', 160, 'Suite, vista a la ciudad, 1 cama king', 4, 2),
    ('HAB115', 210, 'Suite presidencial, 2 camas queen, jacuzzi', 5, 3),
    ('HAB116', 85, 'Vista a la piscina, 2 camas individuales', 1, 3),
    ('HAB117', 135, 'Vista al mar, 1 cama king, balcón', 2, 4),
    ('HAB118', 70, 'Vista a la ciudad, 1 cama individual', 3, 4),
    ('HAB119', 175, 'Suite ejecutiva, 2 camas queen, escritorio', 4, 5),
    ('HAB120', 225, 'Penthouse, vista al mar, 1 cama king, jacuzzi', 5, 5),
    ('HAB121', 100, 'Vista al jardín, 2 camas dobles', 1, 1),
    ('HAB122', 140, 'Vista a la piscina, 1 cama queen, balcón', 2, 1);
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
    (1, 1, 'HAB101', '2024-08-20', '2024-08-25', '2024-08-30'),
    (2, 2, 'HAB102', '2024-08-22', '2024-08-27', '2024-09-02'),
    (3, 3, 'HAB103', '2024-09-23', '2024-09-28', '2024-10-05'),
    (1, 1, 'HAB101', '2024-08-20', '2024-08-25', '2024-08-30'),
    (2, 2, 'HAB102', '2024-05-22', '2024-06-27', '2024-07-02'),
    (3, 3, 'HAB103', '2024-08-23', '2024-08-28', '2024-09-05'),
    (4, 4, 'HAB104', '2024-08-24', '2024-08-29', '2024-09-03'),
    (5, 5, 'HAB105', '2024-06-25', '2024-07-30', '2024-08-06'),
    (4, 6, 'HAB106', '2024-08-26', '2024-08-31', '2024-09-07'),
    (2, 7, 'HAB119', '2024-08-27', '2024-09-01', '2024-09-08'),
    (5, 8, 'HAB108', '2024-07-28', '2024-08-02', '2024-08-09'),
    (4, 9, 'HAB109', '2024-08-29', '2024-09-03', '2024-09-10'),
    (3, 10, 'HAB110', '2024-08-30', '2024-09-12', '2024-09-17');
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
    (1, 1, "disponible"),
    (2, 2, "disponible"),
    (3, 3, "disponible"),
    (1, 4, "disponible"),
    (2, 5, "disponible"),
    (3, 6, "disponible"),
    (4, 7, "disponible"),
    (5, 8, "disponible"),
    (4, 9, "disponible"),
    (2, 10, "disponible"),
    (5, 11, "disponible"),
    (4, 12, "disponible"),
    (3, 13, "disponible");

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
    (1, 1, 'HAB101'),
    (2, 2, 'HAB102'),
    (3, 3, 'HAB103'),
    (4, 1, 'HAB101'),
    (5, 2, 'HAB102'),
    (6, 3, 'HAB103'),
    (7, 4, 'HAB104'),
    (8, 5, 'HAB105'),
    (9, 4, 'HAB106'),
    (10, 2, 'HAB119'),
    (11, 5, 'HAB108'),
    (12, 4, 'HAB109'),
    (13, 3, 'HAB110');
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
    ('2024-08-20', 4),
    ('2024-05-22', 5),
    ('2024-08-23', 6),
    ('2024-08-24', 7),
    ('2024-06-25', 8),
    ('2024-08-26', 9),
    ('2024-08-27', 10),
    ('2024-07-28', 11),
    ('2024-08-29', 12),
    ('2024-08-30', 13);
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
    (1, 4),
    (2, 5),
    (3, 6),
    (4, 7),
    (5, 8),
    (6, 9),
    (7, 10),
    (8, 11),
    (9, 12),
    (10, 13);
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
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2),
    (6, 3),
    (7, 4),
    (8, 5),
    (9, 4),
    (10, 2),
    (11, 5),
    (12, 4),
    (13, 3);

    -- Creación de la tabla codigo_de_reserva
    CREATE TABLE codigo_de_reserva (
        id INT AUTO_INCREMENT PRIMARY KEY,
        codigo_habitacion VARCHAR(100) NOT NULL,
        reserva_id INT NOT NULL,
        FOREIGN KEY (codigo_habitacion) REFERENCES habitaciones(codigo_habitacion),
        FOREIGN KEY (reserva_id) REFERENCES reservas(id)
    );
    INSERT INTO codigo_de_reserva (codigo_habitacion, reserva_id) VALUES
    ('HAB101', 1),
    ('HAB102', 2),
    ('HAB103', 3),
    ('HAB101', 4),
    ('HAB102', 5),
    ('HAB103', 6),
    ('HAB104', 7),
    ('HAB105', 8),
    ('HAB106', 9),
    ('HAB119', 10),
    ('HAB108', 11),
    ('HAB109', 12),
    ('HAB110', 13);
END;
-- Llamada al procedimiento
CALL crearTablas();--Crea las tablas









