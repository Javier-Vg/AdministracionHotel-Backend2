CREATE DATABASE basedata;
USE basedata;

CREATE PROCEDURE crearTablas()
BEGIN

    -- Creación de la tabla usuarios
    CREATE TABLE usuarios (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        correo VARCHAR(50) UNIQUE NOT NULL,
        contrasena VARCHAR(50) NOT NULL
    );

    INSERT INTO usuarios (nombre, apellido, correo, contrasena) VALUES
    ('Carlos', 'Pérez', 'carlos.perez@example.com', 'password123'),
    ('Ana', 'López', 'ana.lopez@example.com', 'securePass!'),
    ('Luis', 'Martínez', 'luis.martinez@example.com', 'luisPass456'),
    ('María', 'García', 'maria.garcia@example.com', 'maria2024');

    -- Creación de la tabla hotel
    CREATE TABLE hotel (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre_hotel VARCHAR(50) NOT NULL,
        num_hotel INT NOT NULL,
        cantidad_reservas INT NOT NULL,
        ubicacion VARCHAR(100) NOT NULL,
        informacion VARCHAR(50) NOT NULL,
        habitantes_totales INT NOT NULL
    );

    INSERT INTO hotel (nombre_hotel, num_hotel, cantidad_reservas, ubicacion, informacion, habitantes_totales) VALUES
    ('Hotel Grand Palace', 101, 25, 'Calle Principal 123, Ciudad A', 'Lujoso y moderno', 500000),
    ('Hotel Blue Lagoon', 102, 15, 'Avenida del Mar 456, Ciudad B', 'Cerca de la playa', 150000),
    ('Hotel Central Park', 103, 30, 'Calle 7, Ciudad C', 'En el centro de la ciudad', 300000),
    ('Hotel Mountain Retreat', 104, 20, 'Ruta de las Montañas, Ciudad D', 'Retiro en la montaña', 80000),
    ('Hotel Urban Stay', 105, 10, 'Avenida de la Cultura 789, Ciudad E', 'Moderno y funcional', 250000);

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
    ('HAB103', 200, 'Habitación con jacuzzi', 3, 2);

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
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
        FOREIGN KEY (codigo_de_habitacion) REFERENCES habitaciones(codigo_habitacion)
    );

    INSERT INTO reservas (habitacion_id, usuario_id, codigo_de_habitacion, fecha_reservacion, fecha_entrada, fecha_salida) VALUES
    (1, 1, 'HAB101', '2024-08-20', '2024-08-25', '2024-08-30'),
    (2, 2, 'HAB102', '2024-08-22', '2024-08-27', '2024-09-02'),
    (3, 3, 'HAB103', '2024-08-23', '2024-08-28', '2024-09-05');

    CREATE INDEX idx_fecha_reservacion ON reservas(fecha_reservacion);

    -- Creación de la tabla disponibilidad_habitaciones
    CREATE TABLE disponibilidad_habitaciones (
        id INT AUTO_INCREMENT PRIMARY KEY,
        habitacion_id INT NOT NULL,
        reservas_id INT NOT NULL,
        status_habitacion BOOL NOT NULL,
        FOREIGN KEY (reservas_id) REFERENCES reservas(id),
        FOREIGN KEY (habitacion_id) REFERENCES habitaciones(id)
    );

    INSERT INTO disponibilidad_habitaciones (habitacion_id, reservas_id, status_habitacion) VALUES
    (1, 1, FALSE),
    (2, 2, FALSE),
    (3, 3, FALSE);

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
    (3, 3, 'HAB103');

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
    ('2024-08-23', 3);

    -- Creación de la tabla reserva_usuario
    CREATE TABLE reserva_usuario (
        id INT AUTO_INCREMENT PRIMARY KEY,
        usuario_id INT NOT NULL,
        reserva_id INT NOT NULL,
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
        FOREIGN KEY (reserva_id) REFERENCES reservas(id)
    );

    INSERT INTO reserva_usuario (usuario_id, reserva_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

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
    (3, 3);

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
    ('HAB103', 3);

END;

-- Llamada al procedimiento
CALL crearTablas();

