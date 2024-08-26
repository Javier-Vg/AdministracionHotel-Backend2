CREATE DATABASE basedata;

USE basedata 

CREATE Table usuarios(
id INT  AUTO_INCREMENT PRIMARY KEY,
nombre  VARCHAR (50) NOT NULL,
apellido VARCHAR (50) NOT NULL,
correo   VARCHAR  (50) UNIQUE NOT NULL,
contrasena  VARCHAR (50) NOT NULL
)

INSERT INTO usuarios (nombre, apellido, correo, contrasena) VALUES
('Carlos', 'Pérez', 'carlos.perez@example.com', 'password123'),
('Ana', 'López', 'ana.lopez@example.com', 'securePass!'),
('Luis', 'Martínez', 'luis.martinez@example.com', 'luisPass456'),
('María', 'García', 'maria.garcia@example.com', 'maria2024')



 create table hotel(
        id int primary key auto_increment,
        nombre_hotel varchar(50) not null,
        num_hotel int not null,
        cantidad_reservas int not null,
        ubicacion varchar(100) not null,
        informacion varchar(50) not null,
        habitantes_totales int not null
    );

INSERT INTO hotel (nombre_hotel, num_hotel, cantidad_reservas, ubicacion, informacion, habitantes_totales) VALUES
('Hotel Grand Palace', 101, 25, 'Calle Principal 123, Ciudad A', 'Lujoso y moderno', 500000),
('Hotel Blue Lagoon', 102, 15, 'Avenida del Mar 456, Ciudad B', 'Cerca de la playa', 150000),
('Hotel Central Park', 103, 30, 'Calle 7, Ciudad C', 'En el centro de la ciudad', 300000),
('Hotel Mountain Retreat', 104, 20, 'Ruta de las Montañas, Ciudad D', 'Retiro en la montaña', 80000),
('Hotel Urban Stay', 105, 10, 'Avenida de la Cultura 789, Ciudad E', 'Moderno y funcional', 250000)

CREATE Table habitaciones(
id INT  AUTO_INCREMENT PRIMARY KEY,
codigo_habitacion  VARCHAR (50) UNIQUE NOT NULL,
precio  int NOT NULL,
informacion_habitaciones VARCHAR (50) NOT NULL ,
tipo_de_habitacion  INT  NOT NULL,
hotel_id INT NOT NULL,
FOREIGN KEY (hotel_id) REFERENCES hotel(id)
)

DROP TABLE habitaciones

INSERT INTO habitaciones (codigo_habitacion, precio, informacion_habitaciones, tipo_de_habitacion, hotel_id) VALUES
('HAB101', 100, 'Vista al mar, 2 camas dobles', 1, 1),
('HAB102', 150, 'Suite con balcón privado', 2, 1),
('HAB103', 200, 'Habitación con jacuzzi', 3, 2)
   




create table reservas(
        id int primary key auto_increment,
        habitacion_id INT not null,
        usuario_id int not null,
        codigo_de_habitacion VARCHAR(50) not null,
        fecha_reservacion DATE not null,
        fecha_entrada DATE not null, 
        fecha_salida DATE not null,
        FOREIGN KEY (habitacion_id) REFERENCES hotel(id),
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
        FOREIGN KEY (codigo_de_habitacion) REFERENCES habitaciones(codigo_habitacion)
    );

    DROP TABLE reservas


INSERT INTO reservas (habitacion_id, usuario_id, codigo_de_habitacion, fecha_reservacion, fecha_entrada, fecha_salida) VALUES
(1, 1, 'HAB101', '2024-08-20', '2024-08-25', '2024-08-30'),
(2, 2, 'HAB102', '2024-08-22', '2024-08-27', '2024-09-02'),
(3, 3, 'HAB103', '2024-08-23', '2024-08-28', '2024-09-05');



CREATE Table codigo_habitacion (
id INT  AUTO_INCREMENT PRIMARY KEY,
 habitacion_hotel_id INT NOT NULL,
 habitacion_hotel_codigo VARCHAR(50)  NOT NULL,
 Foreign Key (habitacion_hotel_id) REFERENCES habitaciones(id),
 Foreign Key (habitacion_hotel_codigo) REFERENCES habitaciones(codigo_habitacion)
);

CREATE Table info_reserva_hotel (
id INT  AUTO_INCREMENT PRIMARY KEY,
 reserva_id INT NOT NULL,
 id_de_habitacion INT NOT NULL,
 codigo_habitacion  VARCHAR(50) NOT NULL,
 Foreign Key (reserva_id) REFERENCES reservas(id),
 Foreign Key (id_de_habitacion) REFERENCES reservas(id),
 Foreign Key (codigo_habitacion ) REFERENCES reservas(codigo_de_habitacion)
);

DROP Table info_reserva_hotel

CREATE Table reserva_usuario (
id INT  AUTO_INCREMENT PRIMARY KEY,
 usuario_id INT NOT NULL,
 Foreign Key (usuario_id) REFERENCES reservas(id)
); 
DROP TABLE reserva_usuario