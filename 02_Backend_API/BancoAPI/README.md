# API Banco

Backend desarrollado con FastAPI y Python.

## Tecnologías

- Python 3.11
- FastAPI
- SQL Server
- PyODBC


## Ejecución

Instalar dependencias:

pip install -r requirements.txt


Ejecutar servidor:

python -m uvicorn main:app --reload


## Documentación API

Abrir:

http://127.0.0.1:8000/docs
para esta parte una ves que le dan click a la parte de visualstudio code, lo que tienen que hacer es ir cambiando, al final del enlace los distintos endspoitns
para ver su funcionamiento y ver lo que proporcionaria digamos entre la base de datos y la informacion recolectada en el fronend

ejemplos para abrir y extraer los datos :


## para la parte de los endspoints para ver todos los endspoints como interfaz solo con el comando de docs ya se pueden visualizar todos http://127.0.0.1:8000/docs 
## Endpoints actuales
GET /
GET /clientes
GET /cuentas
GET /transacciones
GET /prestamos
GET /tarjetas

estos son los endspoints actuales de los cuales estan listos, solo falta ver su fucnionamineot y la pagina 
main.py

│
├── importaciones
│
├── creación de API
│
├── endpoint inicio /
│
├── endpoint clientes
│
├── endpoint cuentas
│
├── endpoint transacciones
│
├── endpoint prestamos
│
└── endpoint tarjetas
