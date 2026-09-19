from fastapi import FastAPI
from database import obtener_conexion

app = FastAPI()


@app.get("/")
def inicio():
    return {
        "mensaje": "API Banco funcionando"
    }


@app.get("/clientes")
def obtener_clientes():

    conexion = obtener_conexion()

    cursor = conexion.cursor()

    cursor.execute("""
        SELECT 
            id_cliente,
            nombre,
            apellido,
            rut,
            telefono,
            correo,
            direccion
        FROM Cliente
    """)

    clientes = []

    for fila in cursor.fetchall():

        clientes.append({
            "id_cliente": fila.id_cliente,
            "nombre": fila.nombre,
            "apellido": fila.apellido,
            "rut": fila.rut,
            "telefono": fila.telefono,
            "correo": fila.correo,
            "direccion": fila.direccion
        })


    conexion.close()

    return clientes



@app.get("/cuentas")
def obtener_cuentas():

    conexion = obtener_conexion()

    cursor = conexion.cursor()


    cursor.execute("""
        SELECT
            id_cuenta,
            numero_cuenta,
            saldo,
            fecha_creacion,
            id_cliente,
            id_tipo_cuenta
        FROM Cuenta
    """)


    cuentas = []


    for fila in cursor.fetchall():

        cuentas.append({

            "id_cuenta": fila[0],
            "numero_cuenta": fila[1],
            "saldo": fila[2],
            "fecha_creacion": str(fila[3]),
            "id_cliente": fila[4],
            "id_tipo_cuenta": fila[5]

        })


    conexion.close()

    return cuentas


@app.get("/transacciones")
def obtener_transacciones():

    conexion = obtener_conexion()

    cursor = conexion.cursor()


    cursor.execute("""
        SELECT
            id_transaccion,
            fecha,
            tipo_movimiento,
            monto,
            descripcion,
            id_cuenta
        FROM Transaccion
    """)


    transacciones=[]


    for fila in cursor.fetchall():

        transacciones.append({

            "id_transaccion":fila[0],
            "fecha":str(fila[1]),
            "tipo_movimiento":fila[2],
            "monto":fila[3],
            "descripcion":fila[4],
            "id_cuenta":fila[5]

        })


    conexion.close()

    return transacciones


@app.get("/prestamos")
def obtener_prestamos():

    conexion = obtener_conexion()

    cursor = conexion.cursor()


    cursor.execute("""
        SELECT
            id_prestamo,
            monto_total,
            tasa_interes,
            estado,
            id_cliente
        FROM Prestamo
    """)


    prestamos=[]


    for fila in cursor.fetchall():

        prestamos.append({

            "id_prestamo":fila[0],
            "monto_total":fila[1],
            "tasa_interes":fila[2],
            "estado":fila[3],
            "id_cliente":fila[4]

        })


    conexion.close()

    return prestamos


@app.get("/tarjetas")
def obtener_tarjetas():

    conexion = obtener_conexion()

    cursor = conexion.cursor()


    cursor.execute("""
        SELECT
            id_tarjeta,
            numero_tarjeta,
            tipo_tarjeta,
            fecha_vencimiento,
            id_cuenta
        FROM Tarjeta
    """)


    tarjetas=[]


    for fila in cursor.fetchall():

        tarjetas.append({

            "id_tarjeta":fila[0],
            "numero_tarjeta":fila[1],
            "tipo_tarjeta":fila[2],
            "fecha_vencimiento":str(fila[3]),
            "id_cuenta":fila[4]

        })


    conexion.close()

    return tarjetas
