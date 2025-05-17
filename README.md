# Sistema de Identificación de Aves con Red Semántica en Prolog

## Descripción

Este proyecto implementa un sistema experto en **Prolog** basado en una **red semántica** para la identificación de aves a partir de preguntas. El sistema guía al usuario mediante una serie de preguntas clave sobre las características observadas del ave. Con base en las respuestas, el sistema evalúa los nodos de la red semántica y determina la especie de ave que corresponde.

Además, se integra una base de datos **SQL Server** para registrar el **nombre del usuario** que realiza cada consulta, permitiendo así llevar un control de uso del sistema.

## Características

- ✅ Sistema experto en Prolog usando una red semántica.
- ✅ Evaluación lógica de características de aves.
- ✅ Registro automático de los usuarios que realizan consultas.
- ✅ Conexión a base de datos SQL Server vía ODBC.
- ✅ Botón de información que explica el funcionamiento de la red semántica.

## Funcionamiento General

1. El usuario abre la interfaz del sistema.
2. Se le solicita su nombre.
3. El sistema realiza una serie de preguntas.
4. Las respuestas son evaluadas en la red semántica.
5. Se muestra la especie de ave más probable.
6. El nombre del usuario y la fecha de consulta se registran automáticamente en la base de datos.
7. Se puede acceder a un botón de "Información" para leer una breve explicación sobre qué es una red semántica y cómo se usa en el sistema.

## Tecnologías Utilizadas

- **Lenguaje:** Prolog (SWI-Prolog)
- **Base de datos:** SQL Server
- **Conexión:** ODBC (`odbc_connect/3`)
- **Modelo de conocimiento:** Red semántica

## Requisitos

- [SWI-Prolog](https://www.swi-prolog.org/)
- ODBC configurado para conectarse a la base de datos de SQL Server
- SQL Server con una tabla configurada, por ejemplo:

```sql
CREATE TABLE aves_consultas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    fecha_consulta DATETIME DEFAULT GETDATE()
);

