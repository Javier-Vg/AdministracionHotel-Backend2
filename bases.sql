
CREATE DATABASE basedata;

use basedata;

CREATE PROCEDURE crearTablas()
BEGIN 
    
CREATE Table usuarios(
id INT  AUTO_INCREMENT PRIMARY KEY,
nombre  VARCHAR (50) NOT NULL,
apellido VARCHAR (50) NOT NULL,
correo VARCHAR  (50) UNIQUE NOT NULL,
contrasena  VARCHAR (50) NOT NULL
);

INSERT INTO usuarios (nombre, apellido, correo, contrasena) VALUES
('Carlos', 'Pérez', 'carlos.perez@example.com', 'password123'),
('Ana', 'López', 'ana.lopez@example.com', 'securePass!'),
('Luis', 'Martínez', 'luis.martinez@example.com', 'luisPass456'),
('María', 'García', 'maria.garcia@example.com', 'maria2024');


create table hotel(
    id int auto_increment primary key ,
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
('Hotel Urban Stay', 105, 10, 'Avenida de la Cultura 789, Ciudad E', 'Moderno y funcional', 250000);

CREATE Table habitaciones(
id INT  AUTO_INCREMENT PRIMARY KEY,
codigo_habitacion VARCHAR (50) UNIQUE NOT NULL,
precio  int NOT NULL,
informacion_habitaciones VARCHAR (50) NOT NULL ,
tipo_de_habitacion  INT  NOT NULL,
hotel_id INT NOT NULL,
FOREIGN KEY (hotel_id) REFERENCES hotel(id)
);

INSERT INTO habitaciones (codigo_habitacion, precio, informacion_habitaciones, tipo_de_habitacion, hotel_id) VALUES
('HAB101', 100, 'Vista al mar, 2 camas dobles', 1, 1),
('HAB102', 150, 'Suite con balcón privado', 2, 1),
('HAB103', 200, 'Habitación con jacuzzi', 3, 2);

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

   INSERT INTO reservas (habitacion_id, usuario_id, codigo_de_habitacion, fecha_reservacion, fecha_entrada, fecha_salida) VALUES 
   (1, 1, 'HAB101', '2024-08-20', '2024-08-25', '2024-08-30'), 
   (2, 2, 'HAB102', '2024-08-22', '2024-08-27', '2024-09-02'), 
   (3, 3, 'HAB103', '2024-08-23', '2024-08-28', '2024-09-05');

    CREATE INDEX idx_fecha_reservacion ON reservas(fecha_reservacion);

CREATE Table disponibilidad_habitaciones(
id INT  AUTO_INCREMENT PRIMARY KEY,
habitacion_id int NOT NULL,
reservas_id int NOT NULL,
status_habitacion bool NOT NULL,
FOREIGN KEY (reservas_id) REFERENCES reservas(id),
FOREIGN KEY (habitacion_id) REFERENCES habitaciones(id)
);

INSERT INTO disponibilidad_habitaciones(habitacion_id, reservas_id, status_habitacion) VALUES
(1,1,FALSE),
(2,2,FALSE),
(3,3,FALSE);

CREATE Table info_reserva_hotel (
id INT  AUTO_INCREMENT PRIMARY KEY,
 reserva_id INT NOT NULL,
 id_de_habitacion INT NOT NULL,
 codigo_habitacion  VARCHAR(50) NOT NULL,
 Foreign Key (reserva_id) REFERENCES reservas(id),
 Foreign Key (id_de_habitacion) REFERENCES reservas(habitacion_id),
 Foreign Key (codigo_habitacion ) REFERENCES reservas(codigo_de_habitacion)
);

INSERT INTO info_reserva_hotel(reserva_id, id_de_habitacion, codigo_habitacion) VALUES
(1,1,"HAB101"),
(2,2,"HAB102"),
(3,3,"HAB103");

CREATE Table reserva_fecha(
    id INT  AUTO_INCREMENT PRIMARY KEY,
    fecha_reservacion DATE NOT NULL,
    reserva_id int NOT NULL,
    FOREIGN KEY (fecha_reservacion) REFERENCES reservas(fecha_reservacion),
    FOREIGN KEY (reserva_id) REFERENCES reservas(id)
);

INSERT INTO reserva_fecha(fecha_reservacion, reserva_id) VALUES
("2024-08-20",1),
("2024-08-22",2),
("2024-08-23",3);


CREATE Table reserva_usuario (
id INT  AUTO_INCREMENT PRIMARY KEY,
 usuario_id INT NOT NULL,
 Foreign Key (usuario_id) REFERENCES reservas(usuario_id)
);

INSERT INTO reserva_usuario(usuario_id) VALUES(1),(2),(3);

CREATE Table reserva_habitacion(
    id INT  AUTO_INCREMENT PRIMARY KEY,
    reserva_id int NOT NULL,
    id_de_habitacion int NOT NULL,
    FOREIGN KEY (reserva_id) REFERENCES info_reserva_hotel(reserva_id),
    FOREIGN KEY (id_de_habitacion) REFERENCES info_reserva_hotel(id_de_habitacion)
);

INSERT INTO reserva_habitacion(reserva_id, id_de_habitacion) VALUES
(1,1),
(2,2),
(3,3);

CREATE Table codigo_de_reserva(
    id INT  AUTO_INCREMENT PRIMARY KEY,
    codigo_habitacion VARCHAR(100) NOT NULL,
    FOREIGN KEY (codigo_habitacion) REFERENCES info_reserva_hotel(codigo_habitacion)
);

INSERT INTO codigo_de_reserva(codigo_habitacion) VALUES
("HAB101"),
("HAB102"),
("HAB103");

END;






DROP Table codigo_de_reserva

DROP Table disponibilidad_habitaciones

DROP Table habitaciones

DROP Table hotel

DROP Table info_reserva_hotel

DROP Table reserva_fecha

DROP Table reserva_habitacion

DROP Table reserva_usuario

DROP Table reservas

DROP Table usuarios

DROP Procedure `crearTablas`

CALL crearTablas(); --Crea las tablas
