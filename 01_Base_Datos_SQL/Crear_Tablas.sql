USE BancoDB;
GO

CREATE TABLE Cliente
(
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    rut VARCHAR(12) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(100)
);

CREATE TABLE Tipo_Cuenta
(
    id_tipo_cuenta INT IDENTITY(1,1) PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100)
);


CREATE TABLE Cuenta
(
    id_cuenta INT IDENTITY(1,1) PRIMARY KEY,
    numero_cuenta VARCHAR(20) UNIQUE NOT NULL,
    saldo DECIMAL(10,2) NOT NULL,
    fecha_creacion DATE NOT NULL,

    id_cliente INT NOT NULL,
    id_tipo_cuenta INT NOT NULL,

    FOREIGN KEY (id_cliente)
    REFERENCES Cliente(id_cliente),

    FOREIGN KEY (id_tipo_cuenta)
    REFERENCES Tipo_Cuenta(id_tipo_cuenta)
);

CREATE TABLE Transaccion
(
    id_transaccion INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATETIME NOT NULL,
    tipo_movimiento VARCHAR(30) NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    descripcion VARCHAR(100),

    id_cuenta INT NOT NULL,

    FOREIGN KEY(id_cuenta)
    REFERENCES Cuenta(id_cuenta)
);


CREATE TABLE Empleado_Banco
(
    id_empleado INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50),
    cargo VARCHAR(50),
    correo VARCHAR(100)
);







