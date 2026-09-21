SELECT 
    id_cliente,
    nombre,
    apellido,
    rut,
    correo
FROM Cliente;
------------------
SELECT
    c.nombre,
    c.apellido,
    cu.numero_cuenta,
    cu.saldo,
    cu.estado
FROM Cliente c
INNER JOIN Cuenta cu
ON c.id_cliente = cu.id_cliente;
---------------------
SELECT
    cu.numero_cuenta,
    t.fecha,
    t.monto,
    t.descripcion
FROM Cuenta cu
INNER JOIN Transaccion t
ON cu.id_cuenta = t.id_cuenta;
