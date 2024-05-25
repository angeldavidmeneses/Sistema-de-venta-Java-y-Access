-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS sistemaventa;

-- Crear la base de datos
CREATE DATABASE sistemaventa;

-- Seleccionar la base de datos
USE sistemaventa;

-- Crear tabla usuario
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    pass VARCHAR(255) NOT NULL,
    rol VARCHAR(50) NOT NULL
);

-- Crear tabla clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

-- Crear tabla proveedor
CREATE TABLE proveedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ruc VARCHAR(50) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

-- Crear tabla productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    proveedor INT NOT NULL,
    stock INT NOT NULL,
    precio DOUBLE NOT NULL,
    FOREIGN KEY (proveedor) REFERENCES proveedor(id)
);

-- Crear tabla ventas
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente INT NOT NULL,
    vendedor VARCHAR(255) NOT NULL,
    total DOUBLE NOT NULL,
    fecha VARCHAR(255) NOT NULL,
    FOREIGN KEY (cliente) REFERENCES clientes(id)
);

-- Crear tabla config
CREATE TABLE config (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ruc VARCHAR(50) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    mensaje TEXT NOT NULL
);

CREATE TABLE detalle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pro INT NOT NULL,
    cantidad INT NOT NULL,
    precio INT NOT NULL,
    id_venta INT NOT NULL,
    FOREIGN KEY (id_pro) REFERENCES productos(id),
    FOREIGN KEY (id_venta) REFERENCES ventas(id)
)

-- Inserción de datos en la tabla usuario
INSERT INTO usuario (nombre, correo, pass, rol) VALUES
('Juan Perez', 'juan.perez@example.com', 'password123', 'admin'),
('Angel David', 'angel@gmail.com', '12345', 'admin'),
('Carlos Sanchez', 'carlos.sanchez@example.com', 'password789', 'cliente');

-- Inserción de datos en la tabla config
INSERT INTO config (ruc, nombre, telefono, direccion, mensaje) VALUES
('1234567890', 'Empresa Ejemplo', '123-456-7890', '123 Calle Falsa, Ciudad, País', 'Bienvenidos a nuestra empresa. Ofrecemos los mejores productos.');
