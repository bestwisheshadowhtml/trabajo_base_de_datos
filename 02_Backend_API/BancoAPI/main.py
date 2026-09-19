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
