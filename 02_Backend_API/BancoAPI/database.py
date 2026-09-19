import pyodbc


def obtener_conexion():

    conexion = pyodbc.connect(
        "DRIVER={SQL Server};"
        "SERVER=DESKTOP-9M494AM\\SQLEXPRESS;" ## esta parte es el nombre de mi servidor de sql , es posbiel que cambie con respecto a cada computador este es el mio pero si es necesario cambiarlo se cambia por el de uno mismo , revisar en base de datos
        "DATABASE=BancoDB;"
        "Trusted_Connection=yes;"
    )

    return conexion


try:
    conexion = obtener_conexion()
    print("Conexion exitosa a SQL Server")

except Exception as error:
    print("Error:", error)
