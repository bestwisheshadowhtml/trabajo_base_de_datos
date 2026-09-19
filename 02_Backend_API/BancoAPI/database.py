import pyodbc


def obtener_conexion():

    conexion = pyodbc.connect(
        "DRIVER={SQL Server};"
        "SERVER=DESKTOP-9M494AM\\SQLEXPRESS;"
        "DATABASE=BancoDB;"
        "Trusted_Connection=yes;"
    )

    return conexion


try:
    conexion = obtener_conexion()
    print("Conexion exitosa a SQL Server")

except Exception as error:
    print("Error:", error)
