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


## Endpoints actuales

GET /

Verifica funcionamiento de API.


GET /clientes

Obtiene lista de clientes desde SQL Server.
