
CREATE DATABASE BancoSimulacion;
GO


USE BancoSimulacion;
GO

CREATE TABLE Cliente
(
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    rut VARCHAR(12) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(100),
    direccion VARCHAR(100)
);

CREATE TABLE Tipo_Cuenta
(
    id_tipo_cuenta INT IDENTITY(1,1) PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100)
);

CREATE TABLE Sucursal
(
    id_sucursal INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(15)
);

CREATE TABLE Tipo_Transaccion
(
    id_tipo_transaccion INT IDENTITY(1,1) PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL, 
    signo INT NOT NULL                
);


CREATE TABLE Usuario
(
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    clave_hash VARCHAR(255) NOT NULL,
    estado VARCHAR(20) DEFAULT 'Activo',
    ultimo_acceso DATETIME,
    
    id_cliente INT NOT NULL UNIQUE,

    FOREIGN KEY(id_cliente) 
    REFERENCES Cliente(id_cliente)
);

CREATE TABLE Beneficiario
(
    id_contacto INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rut VARCHAR(12) NOT NULL,
    banco_destino VARCHAR(50) NOT NULL,
    numero_cuenta VARCHAR(20) NOT NULL,
    
    id_cliente INT NOT NULL,

    FOREIGN KEY(id_cliente) 
    REFERENCES Cliente(id_cliente)
);

CREATE TABLE Empleado_Banco
(
    id_empleado INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    cargo VARCHAR(50),
    correo VARCHAR(100),

    id_sucursal INT NOT NULL,

    FOREIGN KEY(id_sucursal)
    REFERENCES Sucursal(id_sucursal)
);

CREATE TABLE Prestamo
(
    id_prestamo INT IDENTITY(1,1) PRIMARY KEY,
    monto_total DECIMAL(10,2) NOT NULL,
    tasa_interes DECIMAL(5,2),
    estado VARCHAR(30),

    id_cliente INT NOT NULL,

    FOREIGN KEY(id_cliente)
    REFERENCES Cliente(id_cliente)
);



CREATE TABLE Cuenta
(
    id_cuenta INT IDENTITY(1,1) PRIMARY KEY,
    numero_cuenta VARCHAR(20) UNIQUE NOT NULL,
    saldo DECIMAL(10,2) NOT NULL,
    fecha_creacion DATE NOT NULL,
    estado VARCHAR(20) DEFAULT 'Activa', 
    moneda VARCHAR(3) DEFAULT 'CLP',     
    id_cliente INT NOT NULL,
    id_tipo_cuenta INT NOT NULL,
    id_sucursal INT NOT NULL,

    FOREIGN KEY(id_cliente)
    REFERENCES Cliente(id_cliente),

    FOREIGN KEY(id_tipo_cuenta)
    REFERENCES Tipo_Cuenta(id_tipo_cuenta),

    FOREIGN KEY(id_sucursal)
    REFERENCES Sucursal(id_sucursal)
);



CREATE TABLE Transaccion
(
    id_transaccion INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATETIME NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    descripcion VARCHAR(100),

    id_cuenta INT NOT NULL,
    id_tipo_transaccion INT NOT NULL, 

    FOREIGN KEY(id_cuenta)
    REFERENCES Cuenta(id_cuenta),

    FOREIGN KEY(id_tipo_transaccion)
    REFERENCES Tipo_Transaccion(id_tipo_transaccion)
);

CREATE TABLE Transferencia
(
    id_transferencia INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATETIME NOT NULL,
    monto DECIMAL(10,2) NOT NULL,

    id_cuenta_origen INT NOT NULL,
    id_cuenta_destino INT NOT NULL,

    FOREIGN KEY(id_cuenta_origen)
    REFERENCES Cuenta(id_cuenta),

    FOREIGN KEY(id_cuenta_destino)
    REFERENCES Cuenta(id_cuenta)
);

CREATE TABLE Tarjeta
(
    id_tarjeta INT IDENTITY(1,1) PRIMARY KEY,
    numero_tarjeta VARCHAR(20) UNIQUE NOT NULL,
    tipo_tarjeta VARCHAR(30),
    fecha_vencimiento DATE NOT NULL,
    cvv VARCHAR(4) NOT NULL,              
    estado VARCHAR(20) DEFAULT 'Activa',   
    limite_credito DECIMAL(10,2),          

    id_cuenta INT NOT NULL,

    FOREIGN KEY(id_cuenta)
    REFERENCES Cuenta(id_cuenta)
);

CREATE TABLE Cuota_Prestamo
(
    id_cuota INT IDENTITY(1,1) PRIMARY KEY,
    numero_cuota INT NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    monto_capital DECIMAL(10, 2) NOT NULL,
    monto_interes DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) DEFAULT 'Pendiente',

    id_prestamo INT NOT NULL,

    FOREIGN KEY(id_prestamo) 
    REFERENCES Prestamo(id_prestamo)
);



CREATE TABLE Pago_Prestamo
(
    id_pago INT IDENTITY(1,1) PRIMARY KEY,
    fecha_pago DATE NOT NULL,
    monto_pago DECIMAL(10,2) NOT NULL,

    id_prestamo INT NOT NULL,
    id_cuota INT NOT NULL, 
    FOREIGN KEY(id_prestamo)
    REFERENCES Prestamo(id_prestamo),

    FOREIGN KEY(id_cuota)
    REFERENCES Cuota_Prestamo(id_cuota)
);
