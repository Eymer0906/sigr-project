-- ==========================================
-- BASE DE DATOS: SISTEMA RESTAURANTE

-- ==========================================

CREATE DATABASE IF NOT EXISTS restaurante_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE restaurante_db;

-- ==========================================
-- TABLA: usuarios
-- ==========================================
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    rol ENUM('cliente','mesero','administrador') NOT NULL,
    estado BOOLEAN DEFAULT TRUE,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- TABLA: categorias
-- ==========================================
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    estado BOOLEAN DEFAULT TRUE
);

-- ==========================================
-- TABLA: platos
-- ==========================================
CREATE TABLE platos (
    id_plato INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    imagen_url VARCHAR(255),
    tiempo_preparacion INT,
    disponible BOOLEAN DEFAULT TRUE,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_platos_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ==========================================
-- TABLA: mesas
-- ==========================================
CREATE TABLE mesas (
    id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    numero_mesa INT NOT NULL UNIQUE,
    capacidad INT NOT NULL,
    ubicacion VARCHAR(50),
    estado ENUM('disponible','ocupada','reservada') DEFAULT 'disponible'
);

-- ==========================================
-- TABLA: reservas
-- ==========================================
CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_mesa INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    numero_personas INT NOT NULL,
    estado ENUM('pendiente','confirmada','cancelada','completada') DEFAULT 'pendiente',
    notas TEXT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_reserva_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_reserva_mesa
        FOREIGN KEY (id_mesa)
        REFERENCES mesas(id_mesa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ==========================================
-- TABLA: pedidos
-- ==========================================
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_mesa INT NOT NULL,
    id_mesero INT NOT NULL,
    id_cliente INT NULL,
    estado ENUM('pendiente','en_preparacion','listo','servido','cancelado') DEFAULT 'pendiente',
    total DECIMAL(10,2) DEFAULT 0.00,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_cierre DATETIME NULL,

    CONSTRAINT fk_pedido_mesa
        FOREIGN KEY (id_mesa)
        REFERENCES mesas(id_mesa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_pedido_mesero
        FOREIGN KEY (id_mesero)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- ==========================================
-- TABLA: detalle_pedido
-- ==========================================
CREATE TABLE detalle_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_plato INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    notas TEXT,

    CONSTRAINT fk_detalle_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_detalle_plato
        FOREIGN KEY (id_plato)
        REFERENCES platos(id_plato)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ==========================================
-- TABLA: cierres_caja
-- ==========================================
CREATE TABLE cierres_caja (
    id_cierre INT AUTO_INCREMENT PRIMARY KEY,
    id_administrador INT NOT NULL,
    fecha_cierre DATE NOT NULL,
    hora_apertura DATETIME NOT NULL,
    hora_cierre DATETIME NOT NULL,
    total_ventas DECIMAL(12,2) NOT NULL,
    total_pedidos INT NOT NULL,
    efectivo_inicial DECIMAL(10,2) NOT NULL,
    efectivo_final DECIMAL(10,2) NOT NULL,
    observaciones TEXT,

    CONSTRAINT fk_cierre_admin
        FOREIGN KEY (id_administrador)
        REFERENCES usuarios(id_usuario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);