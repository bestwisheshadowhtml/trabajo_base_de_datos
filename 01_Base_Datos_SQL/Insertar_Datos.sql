USE BancoDB;
GO


INSERT INTO Cliente
(nombre, apellido, rut, telefono, correo, direccion)
VALUES
('Juan','Perez','11111111-1','987654321','juan.perez@gmail.com','Santiago Centro'),

('Maria','Gonzalez','22222222-2','987654322','maria.gonzalez@gmail.com','Providencia'),

('Carlos','Soto','33333333-3','987654323','carlos.soto@gmail.com','Ñuñoa'),

('Ana','Muñoz','44444444-4','987654324','ana.munoz@gmail.com','Maipu'),

('Pedro','Rojas','55555555-5','987654325','pedro.rojas@gmail.com','La Florida');

GO

INSERT INTO Tipo_Cuenta
(nombre_tipo, descripcion)
VALUES
('Cuenta Corriente','Cuenta bancaria principal'),

('Cuenta Vista','Cuenta para operaciones básicas'),

('Cuenta Ahorro','Cuenta destinada al ahorro');

GO

INSERT INTO Tipo_Transaccion
(nombre_tipo, signo)
VALUES
('Deposito',1),

('Retiro',-1),

('Transferencia',-1),

('Pago',-1);

GO

INSERT INTO Sucursal
(nombre, direccion, telefono)
VALUES
('Sucursal Centro','Av. Libertador 100','223344556'),

('Sucursal Providencia','Av. Providencia 500','223344557'),

('Sucursal Maipu','Av. Central 300','223344558');

GO

INSERT INTO Usuario
(nombre_usuario, contraseña, correo, id_cliente)
VALUES
('jperez','123456','juan.perez@gmail.com',1),

('mgonzalez','123456','maria.gonzalez@gmail.com',2),

('csoto','123456','carlos.soto@gmail.com',3),

('amunoz','123456','ana.munoz@gmail.com',4),

('projas','123456','pedro.rojas@gmail.com',5);

GO

INSERT INTO Beneficiario
(nombre, banco, numero_cuenta)
VALUES
('Maria Gonzalez','Banco Chile','200001'),

('Carlos Soto','Banco Estado','200002'),

('Ana Muñoz','Banco Santander','200003');

GO

INSERT INTO Empleado_Banco
(nombre, cargo, correo, id_sucursal)
VALUES
('Luis Ramirez','Ejecutivo Bancario','luis@banco.cl',1),

('Carolina Diaz','Jefa Sucursal','carolina@banco.cl',2),

('Felipe Torres','Ejecutivo Clientes','felipe@banco.cl',3);

GO

INSERT INTO Cuenta
(numero_cuenta, saldo, fecha_creacion, id_cliente, id_tipo_cuenta, id_sucursal)
VALUES

('100001',500000,'2026-01-10',1,1,1),

('100002',250000,'2026-02-15',2,2,2),

('100003',1000000,'2026-03-20',3,1,3),

('100004',75000,'2026-04-05',4,3,1),

('100005',350000,'2026-05-12',5,2,2);

GO

INSERT INTO Transaccion
(fecha, monto, descripcion, id_cuenta, id_tipo_transaccion)
VALUES

('2026-09-01 10:30',100000,'Deposito sueldo',1,1),

('2026-09-02 15:00',50000,'Retiro efectivo',1,2),

('2026-09-03 09:20',200000,'Deposito inicial',2,1),

('2026-09-04 18:10',35000,'Compra supermercado',3,4),

('2026-09-05 12:00',80000,'Pago servicio',4,4);

GO


INSERT INTO Transferencia
(fecha, monto, id_cuenta_origen, id_cuenta_destino, id_beneficiario)
VALUES

('2026-09-06 14:00',50000,1,2,1),

('2026-09-07 16:30',75000,3,5,2),

('2026-09-08 11:15',30000,2,4,3);

GO


INSERT INTO Tarjeta
(numero_tarjeta, tipo_tarjeta, fecha_vencimiento, id_cuenta)
VALUES

('5555444433331111','Debito','2029-12-31',1),

('5555444433332222','Credito','2030-05-31',2),

('5555444433333333','Debito','2028-08-31',3),

('5555444433334444','Credito','2031-10-31',5);

GO


INSERT INTO Prestamo
(monto_total, tasa_interes, estado, id_cliente)
VALUES

(2000000,3.5,'Vigente',1),

(1500000,4.0,'Vigente',2),

(800000,2.8,'Pagado',3);

GO


INSERT INTO Cuota_Prestamo
(numero_cuota, fecha_vencimiento, monto_cuota, estado, id_prestamo)
VALUES

(1,'2026-10-10',150000,'Pendiente',1),

(2,'2026-11-10',150000,'Pendiente',1),

(1,'2026-10-15',120000,'Pagada',2),

(2,'2026-11-15',120000,'Pendiente',2),

(1,'2026-10-20',80000,'Pagada',3);

GO


INSERT INTO Pago_Prestamo
(fecha_pago, monto_pago, id_cuota)
VALUES

('2026-10-15',150000,1),

('2026-10-20',120000,3),

('2026-10-25',80000,5);

GO
