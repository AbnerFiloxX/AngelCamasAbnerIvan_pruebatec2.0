# README - Aplicación de Gestión de Turnos
##Abner Ivan Angel Camas
##Prueba Tecnica #2

**IMPORTANTE:**  
Los archivos estan sobre la rama master
Estos son datos de prueba utilizados en este proyecto:

- **Usuario**: admin@gmail.com
- **Contraseña**: 123456

**Nota:** Estos datos se proporcionan solo para facilidad de quien revise la prueba. No deben usarse en producción.

## Descripción del Proyecto
Esta aplicación web permite a una entidad gubernamental gestionar turnos/citas para diferentes trámites. Los ciudadanos pueden solicitar turnos, los cuales pueden ser filtrados según su estado: "En espera" o "Ya atendido". 

El sistema ha sido desarrollado utilizando **Java + Servlets** para el backend y **JSP** para la interfaz de usuario, con **JPA** para la persistencia de datos en la base de datos MySQL.

## Características Principales
- Agregar nuevos turnos con asociación a ciudadanos.
- Listar turnos por fecha.
- Filtrar turnos por estado ("En espera" o "Ya atendido").
- Implementación de autenticación con usuarios y contraseñas.
- Botones adicionales para mejorar la navegación y experiencia del usuario.
- Sistema de login.

## Requisitos Técnicos
- **Lenguaje**: Java 8+
- **Backend**: Servlets, JPA
- **Frontend**: JSP con Bootstrap
- **Servidor**: Apache Tomcat 9
- **Base de datos**: MySQL (script SQL incluido)
- **Gestor de dependencias**: Maven

## Instalación y Configuración
1. Clonar el repositorio:
   ```sh
   git clone https://github.com/AbnerFiloxX/AngelCamasAbnerIvan_pruebatec2.0.git
   ```
2. Importar el proyecto en NetBeans 17 o un IDE compatible con Java.
3. Configurar la base de datos MySQL:
   - Crear la base de datos **turnero**.(que en este caso solo será importar)
   - Importar el archivo `turnero.sql` en MySQL.(incluido en el repositorio)
     
4. Compilar y ejecutar el proyecto en Apache Tomcat 9.
5. Acceder a la aplicación en `http://localhost:8080/Prueba_Tecnica_02/`.

## Usuarios de Prueba
- **Administrador**: `admin@gmail.com / 123456`
- **Usuario regular**: no cree ninguno pero de ser así debe hacerse directamente en la base de datos(no es lo ideal pero fue lo funcional en este momento)

## Modelo Relacional de la Base de Datos
La base de datos **turnero** está estructurada de la siguiente manera:

### Tablas y Relaciones
- **`ciudadano`**: Contiene información de los ciudadanos que solicitan turnos.
- **`estadoturno`**: Define los estados posibles de un turno ("En espera" o "Ya atendido").
- **`tipotramite`**: Almacena los diferentes tipos de trámites disponibles.
- **`turno`**: Relaciona un ciudadano con un turno y el tipo de trámite solicitado.
- **`usuario`**: Almacena credenciales de acceso.

### Comentario sobre el Modelo Relacional
El diseño de la base de datos refleja la relación **uno a muchos** entre ciudadanos y turnos: un ciudadano puede tener varios turnos, pero cada turno pertenece a un solo ciudadano. Además, cada turno tiene un estado asignado y está vinculado a un tipo de trámite. Se podría mejorar la normalización incluyendo una tabla de auditoría para registrar cambios en el estado de los turnos.

## Supuestos
- Se incluye un **selector en el frontend** para filtrar turnos por estado.
- Los ciudadanos deben registrar **nombre, apellido, teléfono y CURP**.
- Los trámites y ciudadanos se seleccionan mediante un dropdown.
- El estado inicial de un turno es **En espera** y puede cambiar a **Ya atendido**.
- Formato de fecha: **YYYY-MM-DD**.

## Extras Implementados
- Validación de usuarios con autenticación segura.
- Uso de funciones **Lambda y Streams** para optimizar las consultas y la gestión de turnos.
- Botones adicionales en la interfaz para mejorar la experiencia del usuario.




