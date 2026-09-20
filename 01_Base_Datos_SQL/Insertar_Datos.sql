USE BancoDB;
GO


-- =========================================
-- INSERTAR CLIENTES
-- =========================================

INSERT INTO Cliente
(nombre, apellido, rut, telefono, correo, direccion)
VALUES
('Juan','Perez','11111111-1','987654321','juan.perez@gmail.com','Santiago Centro'),
('Maria','Gonzalez','22222222-2','987654322','maria.gonzalez@gmail.com','Providencia'),
('Carlos','Soto','33333333-3','987654323','carlos.soto@gmail.com','Ñuñoa'),
('Ana','Muñoz','44444444-4','987654324','ana.munoz@gmail.com','Maipu'),
('Pedro','Rojas','55555555-5','987654325','pedro.rojas@gmail.com','La Florida');



-- =========================================
-- INSERTAR TIPOS DE CUENTA
-- =========================================

INSERT INTO Tipo_Cuenta
(nombre_tipo, descripcion)
VALUES
('Cuenta Corriente','Cuenta bancaria para operaciones diarias'),
('Cuenta Vista','Cuenta para depósitos y retiros'),
('Cuenta Ahorro','Cuenta destinada al ahorro');



-- =========================================
-- INSERTAR SUCURSALES
-- =========================================

INSERT INTO Sucursal
(nombre, direccion, telefono)
VALUES
('Sucursal Centro','Av. Libertador 100','223344556'),
('Sucursal Providencia','Av. Providencia 500','223344557'),
('Sucursal Maipu','Av. Central 300','223344558');



-- =========================================
-- INSERTAR EMPLEADOS BANCO
-- =========================================

INSERT INTO Empleado_Banco
(nombre, cargo, correo, id_sucursal)
VALUES	
('Luis Ramirez','Ejecutivo Bancario','luis@banco.cl',1),
('Carolina Diaz','Jefa Sucursal','carolina@banco.cl',2),
('Felipe Torres','Ejecutivo Clientes','felipe@banco.cl',3),
('Sofia Perez','Analista Credito','sofia@banco.cl',1);



-- =========================================
-- INSERTAR CUENTAS
-- =========================================

INSERT INTO Cuenta
(numero_cuenta, saldo, fecha_creacion, id_cliente, id_tipo_cuenta, id_sucursal)
VALUES
('100001',500000,'2026-01-10',1,1,1),
('100002',250000,'2026-02-15',2,2,2),
('100003',1000000,'2026-03-20',3,1,3),
('100004',75000,'2026-04-05',4,3,1),
('100005',350000,'2026-05-12',5,2,2);



-- =========================================
-- INSERTAR TRANSACCIONES
-- =========================================

INSERT INTO Transaccion
(fecha, tipo_movimiento, monto, descripcion, id_cuenta)
VALUES
('2026-09-01 10:30','Deposito',100000,'Deposito sueldo',1),
('2026-09-02 15:00','Retiro',50000,'Retiro efectivo',1),
('2026-09-03 09:20','Deposito',200000,'Transferencia recibida',2),
('2026-09-04 18:10','Compra',35000,'Compra supermercado',3),
('2026-09-05 12:00','Pago',80000,'Pago servicio',4);



-- =========================================
-- INSERTAR TRANSFERENCIAS
-- =========================================

INSERT INTO Transferencia
(fecha, monto, id_cuenta_origen, id_cuenta_destino)
VALUES
('2026-09-06 14:00',50000,1,2),
('2026-09-07 16:30',75000,3,5),
('2026-09-08 11:15',30000,2,4);



-- =========================================
-- INSERTAR TARJETAS
-- =========================================

INSERT INTO Tarjeta
(numero_tarjeta, tipo_tarjeta, fecha_vencimiento, id_cuenta)
VALUES
('5555444433331111','Debito','2029-12-31',1),
('5555444433332222','Credito','2030-05-31',2),
('5555444433333333','Debito','2028-08-31',3),
('5555444433334444','Credito','2031-10-31',5);



-- =========================================
-- INSERTAR PRESTAMOS
-- =========================================

INSERT INTO Prestamo
(monto_total, tasa_interes, estado, id_cliente)
VALUES
(2000000,3.5,'Vigente',1),
(1500000,4.0,'Vigente',2),
(800000,2.8,'Pagado',3);



-- =========================================
-- INSERTAR PAGOS PRESTAMO
-- =========================================

INSERT INTO Pago_Prestamo
(fecha_pago, monto_pago, id_prestamo)
VALUES
('2026-09-10',150000,1),
('2026-09-15',200000,1),
('2026-09-12',100000,2),
('2026-09-20',800000,3);



GO
