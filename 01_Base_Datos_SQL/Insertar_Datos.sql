USE BancoDB;
GO


INSERT INTO Cliente
(nombre, apellido, rut, telefono, correo)
VALUES
('Juan','Perez','11111111-1','987654321','juan@gmail.com'),
('Maria','Gonzalez','22222222-2','912345678','maria@gmail.com'),
('Carlos','Soto','33333333-3','998877665','carlos@gmail.com');


INSERT INTO Tipo_Cuenta
(nombre_tipo, descripcion)
VALUES
('Cuenta Corriente','Cuenta bancaria para operaciones diarias'),
('Cuenta Ahorro','Cuenta destinada al ahorro'),
('Cuenta Vista','Cuenta básica sin línea de crédito');


INSERT INTO Cuenta
(numero_cuenta, saldo, fecha_creacion, id_cliente, id_tipo_cuenta)
VALUES
('100001',500000,'2026-09-18',1,1),
('100002',250000,'2026-09-18',2,2),
('100003',100000,'2026-09-18',3,3);


INSERT INTO Transaccion
(fecha, tipo_movimiento, monto, descripcion, id_cuenta)
VALUES
(GETDATE(),'Deposito',100000,'Abono inicial',1),
(GETDATE(),'Retiro',50000,'Retiro efectivo',1),
(GETDATE(),'Deposito',20000,'Transferencia recibida',2);


INSERT INTO Empleado_Banco
(nombre,cargo,correo)
VALUES
('Pedro Ramirez','Ejecutivo Bancario','pedro@banco.cl'),
('Ana Torres','Administrador','ana@banco.cl');
