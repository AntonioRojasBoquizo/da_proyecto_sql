# 🗄️ DataProject | Lógica: Consultas de SQL


## 📖 Descripción 

Este proyecto resuelve una serie de consultas de SQL planteadas sobre una base de datos de una tienda de películas ficticia (`BBDD_Proyecto_shakila_sinuser.sql`). El objetivo es poner en práctica los conocimientos adquiridos en el **Módulo 5: SQL** del máster **Data & Analytics V3** de **thePower**.

Las consultas pueden abordarse desde distintos enfoques para alcanzar los mismos resultados. Sin embargo, para cumplir con los requisitos del proyecto, es necesario demostrar los siguientes conocimientos:

- Manejo de la herramienta DBeaver.
- Creación del esquema de la BBDD.
- Manejo de las consultas con una sola tabla de la BBDD.
- Manejo de las relaciones entre tablas.
- Manejo de las subconsultas.
- Manejo de vistas.
- Manejo de estructuras de datos temporales.
- Uso de buenas prácticas, especialmente:
   - Escribir los comandos en mayúsculas.
   - Finalizar las consultas con “;”.
   - Utilizar comillas dobles para nombres de tablas y columnas.
   - Evitar el uso de `*` en SELECT de forma generalizada, especificando únicamente las columnas necesarias.
   - Incluir comentarios en el código que faciliten su comprensión. **Dado el carácter académico de este proyecto, se ha puesto especial énfasis en este punto.** 
- Entendimiento del resultado de las consultas.
- Correcta entrega en GitHub, incluyendo un archivo README cuya elaboración se recomienda realizar siguiendo las indicaciones de la “guía para escribir un buen README en nuestros proyectos” (`guia_readme.pdf`).


## 🗂️ Estructura del Proyecto
```
├── data/                                         # Carpeta con la base de datos del proyecto
│    └── BBDD_Proyecto_shakila_sinuser.sql          # Base de datos del proyecto
│
├── queries/                                      # Carpeta con los resultados principales del proyecto
│    └── da_proyecto_sql_arb.sql                    # Archivo con todas las consultas SQL resueltas  
│
├── schema/                                       # Carpeta con el modelo entidad relación de la base de datos
│    ├── esquema_er_shakila.erd                     # Archivo .erd con el modelo entidad relación de la base de datos
│    └── esquema_er_shakila.png                     # Archivo .png con el modelo entidad relación de la base de datos
│
├── docs/                                         # Carpeta con la documentación adicional del proyecto
│    ├── EnunciadoDataProject_SQL.Lógica.pdf        # Enunciado del proyecto
│    └── guia_readme.pdf                            # Guía con indicaciones para redactar un archivo README  
│
└── README.md                                     # Descripción del proyecto
```


## 🛠️ Instalación y requisitos

### Requisitos previos

Para poder ejecutar este proyecto es necesario contar con las siguientes herramientas y archivos:
- PostgreSQL.
- DBeaver.
- Base de datos: `BBDD_Proyecto_shakila_sinuser.sql`
- Enunciado del proyecto: `EnunciadoDataProject_SQL.Lógica.pdf`

### Instalación y configuración

1. Abrir DBeaver, seleccionar "postgres" e introducir la contraseña para realizar la conexión (el icono de postgres debe quedar marcado con un tic verde).
2. Importar la base de datos sobre la que se va a trabajar haciendo uso del archivo `BBDD_Proyecto_shakila_sinuser.sql` y seleccionarla con la opción "Establecer por defecto" (el nombre de la base de datos debe quedar destacado en negrita).

Tras completar estos pasos, el entorno estará listo para abrir los archivos del proyecto y ejecutar las consultas propuestas.


## 📊 Resultados y conclusiones

A lo largo del desarrollo del proyecto se han implementado con éxito las consultas de SQL planteadas, aplicando para ello los conceptos y técnicas descritos en la formación.

Entre los principales resultados logrados destacan:
-	La comprensión de los fundamentos de las bases de datos relacionales. 
-	El conocimiento y manejo de PostgreSQL y DBeaver.
-	La capacidad de plantear y elaborar consultas, desde un nivel básico hasta aquellas que precisan de un código más complejo para su resolución.
-	La posibilidad de abordar un mismo problema desde múltiples enfoques. 
-	El uso de buenas prácticas en la escritura de código SQL para mejorar su legibilidad y facilitar su comprensión.
-	La puesta en valor de la importancia de estructurar correctamente las consultas y documentar el código, especialmente en contextos académicos o colaborativos, donde la claridad es un aspecto fundamental.


## 🔄 Próximos pasos

El proyecto cumple con los requisitos establecidos. No obstante, considerando el contexto formativo en el que se enmarca, se sugieren las siguientes líneas de ampliación que podrían desarrollarse en el futuro:
-	Optimizar algunas consultas para mejorar su rendimiento.
-	Explorar diferentes enfoques para resolver una misma consulta y comparar su eficiencia. 
-	Ampliar el análisis de la base de datos con nuevas consultas no contempladas en el enunciado.  


## 🤝 Contribuciones

El presente proyecto ha sido desarrollado como parte de un ejercicio académico, por lo que no se esperan contribuciones externas.

Sin embargo, las propuestas de mejora son bienvenidas. Si deseas mejorar el proyecto, por favor abre un pull request o una issue. 


## ✒️ Autores y agradecimientos

**Autor:** Antonio Rojas Boquizo
