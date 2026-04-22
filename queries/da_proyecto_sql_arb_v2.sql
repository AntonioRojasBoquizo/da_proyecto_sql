/*
========================================
DATA & ANALYTICS V3
MÓDULO 5 | SQL
  
DataProject: Lógica. Consultas SQL
 
Autor: Antonio Rojas Boquizo
========================================
*/


/*
========================================
CONSULTA 01
  
Crea el esquema de la BBDD.
========================================
 
Para crear el esquema de la base de datos deben seguirse los siguientes pasos:
	- En el área "Files-General", hacer click derecho sobre "Diagrams" y seleccionar "Crear Nuevo Diagrama".
 	- Escribir el nombre deseado en "Name" (en este caso, "esquema_er_shakila.erd")
 	- Seguir la secuencia: "postgres / Bases de Datos / shakila / Esquemas / public / Tablas", marcar "Tablas" y finalizar. 
 
El archivo "esquema_er_shakila", tanto en formato .erd como en .png, está incluido en el repositorio de este proyecto. 
*/


/* 
========================================
CONSULTA 02
 
Muestra los nombres de todas las películas con una clasificación por edades de ‘Rʼ.
========================================
*/
SELECT	"title" 		AS "titulo_pelicula",					-- Esta consulta selecciona las columnas que contienenen el título 
		"rating" 		AS "clasificacion_edad"						-- y la clasificación por edad 
FROM 	"film"													-- de las películas de la tabla "film"
WHERE 	"rating" = 'R';											-- y filtra los datos para considerar solo las películas con una clasificación por edad de 'R'.


/*
========================================
CONSULTA 03
 
Encuentra los nombres de los actores que tengan un “actor_idˮ entre 30 y 40.
========================================
*/
SELECT 	"first_name"	AS "nombre_actor",						-- Esta consulta selecciona las columnas que contienen el nombre,
		"last_name"		AS "apellido_actor",						-- el apellido
		"actor_id"		AS "id_actor"								-- y el identificador
FROM	"actor"													-- de los actores de la tabla "actor"
WHERE 	"actor_id" BETWEEN 30 AND 40;							-- y filtra los datos para considerar solo los actores con un identificador entre 30 y 40, ambos inclusive.


/*
========================================
CONSULTA 04
 
Obtén las películas cuyo idioma coincide con el idioma original.
========================================
*/
SELECT 	"title"					AS "titulo_pelicula",			-- Esta consulta selecciona las columnas que contienen el título, 
		"language_id" 			AS "id_idioma_pelicula",			-- el identificador de idioma
		"original_language_id" 	AS "id_idioma_original_pelicula"	-- y el identificador de idioma original
FROM	"film"													-- de las películas de la tabla "film"
WHERE 	"language_id" = "original_language_id";					-- y filtra los datos para considerar solo las películas cuyo idioma coincide con su idioma original.


																-- La consulta realizada no muestra ningún resultado porque todos los registros de la columna "original_language_id" son nulos. 


/*
========================================
CONSULTA 05
 
Ordena las películas por duración de forma ascendente.
========================================
*/
SELECT 		"title"			AS "titulo_pelicula",				-- Esta consulta selecciona las columnas que contienen el título, 
			"length"		AS "duracion_pelicula"					-- y la duración
FROM 		"film"												-- de las películas de la tabla "film"
ORDER BY 	"length" ASC;										-- y ordena los resultados por duración de forma ascendente.


																-- ORDER BY ordena los resultados de forma ascendente por defecto, 
																-- por lo que, en este caso, podría omitirse ASC. 


/*
========================================
CONSULTA 06
 
Encuentra el nombre y apellido de los actores que tengan ‘Allenʼ en su apellido.
========================================
*/
SELECT 		"first_name"	AS "nombre_actor",					-- Esta consulta selecciona las columnas que contienen el nombre
			"last_name"		AS "apellido_actor"						-- y el apellido
FROM		"actor"												-- de los actores de la tabla "actor"
WHERE 		LOWER("last_name") = LOWER('Allen');				-- y filtra los datos para considerar solo los actores cuyo apellido es 'Allen'.
																

																-- Se ha hecho uso de LOWER para convertir a minúsculas todos los caracteres de las cadenas de texto implicadas (strings)
																-- y evitar así posibles problemas de identificación derivados de la presencia de mayúsculas y minúsculas. 


/*
========================================
CONSULTA 07
 
Encuentra la cantidad total de películas en cada clasificación de la tabla “filmˮ y muestra la clasificación junto con el recuento.
========================================
*/
SELECT 		"rating" 			AS "clasificacion_edad", 		-- Esta consulta selecciona las diferentes clasificaciones por edad,  
			COUNT("film_id") 	AS "cantidad_peliculas"				-- y calcula la cantidad total de películas en cada categoría 
FROM		"film"												-- de las películas de la tabla "film".
GROUP BY	"rating";											-- Se agrupan los datos según la clasificación por edad. 
										

/*
========================================
CONSULTA 08
 
Encuentra el título de todas las películas que son ‘PG-13ʼ o tienen una duración mayor a 3 horas en la tabla film.
========================================
*/
SELECT 		"title" 			AS "titulo_pelicula",			-- Esta consulta selecciona las columnas que contienenen el título,
			"rating" 			AS "clasificacion_edad",			-- la clasificación por edad, 
			"length" 			AS "duracion_pelicula"				-- y la duración
FROM		"film"												-- de las películas de la tabla "film"
WHERE 		"rating" = 'PG-13'									-- y filtra los datos para considerar solo las películas con una clasificación por edad de 'PG-13'
	OR		"length" > 180;											-- o con una duración superior a 180 minutos (3 horas).
																		

/*
========================================
CONSULTA 09
 
Encuentra la variabilidad de lo que costaría reemplazar las películas.
========================================
*/
SELECT 		VARIANCE("replacement_cost") AS "variabilidad_reemplazo_peliculas"		-- Esta consulta calcula la varianza del coste de reemplazo
FROM		"film";																	-- de las películas de la tabla "film".
	

/*
========================================
CONSULTA 10
 
Encuentra la mayor y menor duración de una película de nuestra BBDD.
========================================
*/
SELECT 		MAX("length") 	AS "mayor_duracion", 				-- Esta consulta calcula el valor máximo de la columna longitud
			MIN("length") 	AS "menor_duracion"						-- y el valor mínimo de la columna longitud
FROM		"film";												-- de las películas de la tabla "film".
	

/*
========================================
CONSULTA 11
 
Encuentra lo que costó el antepenúltimo alquiler ordenado por día.
========================================
*/
SELECT		"amount" 		AS "coste_alquiler", 				-- Esta consulta selecciona las columnas que contienen el coste de alquiler 
			"payment_date" 	AS "fecha"								-- y la fecha de pago
FROM		"payment"											-- de la tabla "payment",
ORDER BY 	"payment_date" DESC									-- ordena los resultados por fecha de pago de forma descendente,
LIMIT 		1													-- muestra los resultados de una única fila
OFFSET		2;													-- y omite las 2 primeras filas para mostrar el antepenúltimo resultado. 
	
	
/*
========================================
CONSULTA 12
 
Encuentra el título de las películas en la tabla “filmˮ que no sean ni 'NC-17' ni 'G' en cuanto a su clasificación.
========================================
*/
SELECT 		"title"			AS "titulo_pelicula", 				-- Esta consulta selecciona las columnas que contienen el título
			"rating"		AS "clasificacion_edad"					-- y la clasificación por edad
FROM		"film"												-- de las películas de la tabla "film"
WHERE   	"rating" NOT IN ('NC-17','G');						-- y filtra los datos para considerar solo las peliculas cuya clasificación no es ni 'NC-17' ni 'G'.										
	
	
/*
========================================
CONSULTA 13
 
Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
========================================
*/
SELECT 		"rating" 		AS "clasificacion_edad", 			-- Esta consulta selecciona las diferentes clasificaciones por edad,
			AVG("length") 	AS "promedio_duracion"					-- y calcula el promedio de duración en cada categoría
FROM    	"film"												-- de las películas de la tabla "film".
GROUP BY 	"rating";											-- Se agrupan los datos según la clasificación por edad. 


/*
========================================
CONSULTA 14
 
Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.
========================================
*/
SELECT 		"title" 		AS "titulo_pelicula", 				-- Esta consulta selecciona las columnas que contienen el título 
			"length" 		AS "duracion_pelicula"					-- y la duración
FROM		"film"												-- de las películas de la tabla "film"
WHERE 		"length" > 180;										-- y filtra los datos para considerar solo las peliculas cuya duración supere los 180 min.


/*
========================================
CONSULTA 15
 
¿Cuánto dinero ha generado en total la empresa?
========================================
*/
SELECT 		SUM("amount") 	AS "dinero_generado_total"			-- Esta consulta calcula la suma de todos los valores de la columna "amount" (cantidad)
FROM		"payment";											-- de la tabla "payment" (pagos).


/*
========================================
CONSULTA 16

Muestra los 10 clientes con mayor valor de id.
========================================
*/
SELECT 		"customer_id" 	AS "id_cliente",					-- Esta consulta selecciona las columnas que contienen el identificador de cliente, 
			"first_name" 	AS "nombre_cliente", 					-- el nombre
			"last_name" 	AS "apellido_cliente"					-- y el apellido 
FROM		"customer"											-- de los clientes de la tabla "customer",									
ORDER BY 	"customer_id" DESC									-- ordena los resultados por identificador de cliente de forma descendente 
LIMIT 		10;													-- y únicamente muestra los resultados de las 10 primeras filas. 


/*
========================================
CONSULTA 17

Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igbyʼ.
========================================
*/
SELECT 		a."first_name" 	AS "nombre_actor",					-- Esta consulta selecciona las columnas que contienen el nombre de los actores de la tabla "actor",
			a."last_name"	AS "apellido_actor",					-- el apellido de los actores de la tabla "actor"
			f."title"		AS "titulo_pelicula"					-- y el título de las películas de la tabla "film".
FROM 		"actor" 			AS a							-- Se trabaja con la tabla que resulta de la intersección de la tabla "actor"
INNER JOIN 	"film_actor" 		AS fa								-- con la tabla "film_actor"
	ON		a."actor_id" = fa."actor_id"							-- relacionando la columna "actor_id" de la tabla "actor" y la columna "actor_id" de la tabla "film_actor"
INNER JOIN	"film" 				AS f								-- más la intersección con la tabla "film"
	ON 		fa."film_id" = f."film_id"								-- relacionando la columna "film_id" de la tabla "film_actor" y la columna "film_id" de la tabla "film".
WHERE		LOWER(f."title") = LOWER('Egg Igby');				-- Se filtran los datos para considera solo aquellos asociados a la película cuyo título es 'Egg Igby'.


																-- Se ha hecho uso de LOWER para convertir a minúsculas todos los caracteres de las cadenas de texto implicadas (strings)
																-- y evitar así posibles problemas de identificación derivados de la presencia de mayúsculas y minúsculas. 															


/*
========================================
CONSULTA 18

Selecciona todos los nombres de las películas únicos.
======================================== 
*/
SELECT DISTINCT	"title" 	AS "nombre_pelicula_unico"			-- Esta consulta selecciona los resultados únicos (no duplicados) de la columna que contiene el título
FROM			"film";											-- de las películas de la tabla "film".


/*
========================================
CONSULTA 19

Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla “filmˮ.
========================================
*/
SELECT 	 	f."title" 		AS "titulo_pelicula",				-- Esta consulta selecciona las columnas que contienen el título de las películas de la tabla "film", 
			c."name" 		AS "categoria_pelicula",				-- la categoría de las películas de la tabla "category"
			f."length"		AS "duracion_pelicula"					-- y la duración de las películas de la tabla "film".
FROM 		"film" 				AS f							-- Se trabaja con la tabla que resulta de la intersección de la tabla "film"							
INNER JOIN 	"film_category" 	AS fc								-- con la tabla "film_category"						
	ON		f."film_id" = fc."film_id"								-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "film_category"
INNER JOIN	"category" 			AS c								-- más la intersección con la tabla "category"			
	ON 		fc."category_id" = c."category_id"						-- relacionando la columna "category_id" de la tabla "film_category" y la columna "category_id" de la tabla "category".				
WHERE 		LOWER(c."name") = LOWER('Comedy')					-- Se filtran los datos para considera solo aquellos asociados a películas cuya categoría es comedia
	AND 	f."length" > 180;										-- y cuya duración supera los 180 min.

	
																-- Se ha hecho uso de LOWER para convertir a minúsculas todos los caracteres de las cadenas de texto implicadas (strings)
																-- y evitar así posibles problemas de identificación derivados de la presencia de mayúsculas y minúsculas. 

													
/*
========================================
CONSULTA 20

Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos y muestra el nombre de la categoría junto con el promedio de duración.
========================================
*/
SELECT  	c."name" 		AS "categoria_pelicula",			-- Esta consulta selecciona la columna que contiene la categoría de las películas de la tabla "category" 
			AVG(f."length") AS "promedio_duracion"					-- y calcula el promedio de duracción de cada categoría
FROM 		"film" 				AS f							-- Se trabaja con la tabla que resulta de la intersección de la tabla "film"							
INNER JOIN 	"film_category" 	AS fc								-- con la tabla "film_category"						
	ON		f."film_id" = fc."film_id"								-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "film_category"
INNER JOIN	"category" 			AS c								-- más la intersección con la tabla "category"			
	ON 		fc."category_id" = c."category_id"						-- relacionando la columna "category_id" de la tabla "film_category" y la columna "category_id" de la tabla "category".		
GROUP BY 	c."name"											-- Se agrupan los datos según las categorías de las películas 
HAVING		AVG(f."length") > 110;								-- y se filtran los grupos (categorías de película) para considerar solo aquellas categorías cuya duración promedio supera los 110 minutos.


/*
========================================
CONSULTA 21

¿Cuál es la media de duración del alquiler de las películas?
========================================
*/
SELECT 		AVG("rental_duration") AS "media_duracion_alquiler"	-- Esta consulta calcula la media de duración del alquiler
FROM		"film";												-- de las películas de la tabla "film".


/*
========================================
CONSULTA 22

Crea una columna con el nombre y apellidos de todos los actores y actrices.
========================================
*/
SELECT 		CONCAT ("first_name",' ',"last_name") AS "nombre_completo_actor"	-- Esta consulta une en una única columna el nombre y el apellido 
FROM		"actor";															-- de los actores de la tabla "actor". 


/*
========================================
CONSULTA 23

Números de alquiler por día, ordenados por cantidad de alquiler de forma descendente.
========================================
*/
SELECT  	"rental_date"::DATE 		AS "fecha_alquiler",		-- Esta consulta extrae la fecha de alquiler en formato yyyy-mm-dd 
			COUNT("rental_date"::DATE) 	AS "cantidad_alquileres"		-- y calcula el número de alquileres que han tenido lugar cada día
FROM		"rental"												-- de los alquileres de la tabla "rental".
GROUP BY	"rental_date"::DATE										-- Se agrupan los datos según la fecha de alquiler 
ORDER BY	COUNT("rental_date"::DATE) DESC;						-- y se ordenan los resultados por número de alquileres al día de forma descendente.


/*
========================================
CONSULTA 24

Encuentra las películas con una duración superior al promedio.
========================================
*/
SELECT		"title" 	AS "titulo_pelicula",						-- Esta consulta selecciona las columnas que contienenen el título 
			"length" 	AS "duracion_pelicula"							-- y la duración
FROM		"film"													-- de las películas de la tabla "film".
WHERE		"length" > (											-- Se filtran los datos para considerar solo las películas cuya duración sea superior al resultado de la siguiente subconsulta: 
	SELECT 	AVG("length")												-- Se calcula la duración promedio
	FROM	"film");													-- de las películas de la tabla "film".


/*
========================================
CONSULTA 25

Averigua el número de alquileres registrados por mes.
========================================
*/
SELECT  	EXTRACT (MONTH FROM "rental_date") 			AS "mes_alquiler",			-- Esta consulta extrae el mes de la columna que contiene la fecha de alquiler
			COUNT (EXTRACT (MONTH FROM "rental_date"))	AS "cantidad_alquileres"		-- y calcula la cantidad de alquileres por mes
FROM 		"rental"																-- de los alquileres de la tabla "rental". 
GROUP BY	EXTRACT(MONTH FROM "rental_date")										-- Se agrupan los datos según el mes de alquiler 
ORDER BY	"mes_alquiler";															-- y se ordenan los resultados por mes de alquiler de forma ascendente.


/*
========================================
CONSULTA 26

Encuentra el promedio, la desviación estándar y varianza del total pagado.
========================================
*/
SELECT 		AVG("amount") 		AS "promedio", 						-- Esta consulta calcula el promedio de los valores de la columna que contiene el precio de alquiler,
			STDDEV("amount") 	AS "desviacion_estandar", 				-- La desviación estándar
			VARIANCE("amount") 	AS "varianza"							-- y la varianza 
FROM		"payment";												-- de la tabla "payment".


/*
========================================
CONSULTA 27

¿Qué películas se alquilan por encima del precio medio?
========================================
*/
SELECT 		f."title" 	AS "titulo_pelicula",						-- Esta consulta selecciona las columnas que contienen el título de las películas de la tabla "film",
			p."amount" 	AS "precio_alquiler"							-- y el precio de alquiler de la tabla "payment".
FROM 		"film" 			AS f									-- Se trabaja con la tabla que resulta de la intersección de la tabla "film"
INNER JOIN	"inventory" 	AS i										-- con la tabla "inventory" 
	ON		f."film_id" = i."film_id"									-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "inventory",
INNER JOIN	"rental" 		AS r										-- más la intersección con la tabla "rental"
	ON		i."inventory_id"=r."inventory_id"							-- relacionando la columna "inventory_id" de la tabla "inventory" y la columna "inventory_id" de la tabla "rental"
INNER JOIN 	"payment" 		AS p										-- más la intersección con la tabla "payment"
	ON 		r."rental_id" = p."rental_id"								-- relacionando la columna "rental_id" de la tabla "rental" y la columna "rental_id" de la tabla "payment".
WHERE 		p."amount" > (											-- Se filtran los datos para considerar solo las películas cuyo precio de alquiler sea superior al resultado de la siguiente subconsulta:
	SELECT  AVG("amount")												-- Se calcula el precio medio de alquiler
	FROM 	"payment");													-- de la tabla "payment".

	
/*
========================================
CONSULTA 28

Muestra el id de los actores que hayan participado en más de 40 películas.
========================================
*/
SELECT 		"actor_id",												-- Esta consulta selecciona la columna que contiene el id de los actores
			COUNT("film_id") AS cantidad_peliculas						-- y calcula el número de películas asociadas a cada actor (utilizando el id de actor)
FROM		"film_actor"											-- de la tabla "film_actor".
GROUP BY	"actor_id"												-- Se agrupan los datos según el id de los actores
HAVING 		COUNT("film_id") > 40;									-- y se filtran los grupos (actores a través de su id) para considerar solo aquellos actores que hayan participado en más de 40 películas. 


/*
========================================
CONSULTA 29

Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible.
========================================
*/
SELECT 		f."title" 			AS "titulo_pelicula", 						-- Esta consulta selecciona las columnas que contienen el título de las películas de la tabla "film",
			COUNT(i."film_id") 	AS "peliculas_disponibles_inventario"			-- y calcula el número de películas disponibles en el inventario
FROM 		"film" 		AS f												-- Se trabaja con la tabla que resulta de considerar la tabla "film" al completo (para que aparezcan todas las películas)
LEFT JOIN 	"inventory"	AS i													-- más la intersección con la tabla "inventory"
	ON		f."film_id" = i."film_id"											-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "inventory".
GROUP BY	f."film_id"														-- Se agrupan los datos por película (utilizando el id de pelicula)
ORDER BY	f."film_id";													-- y se ordenan los resultados por id de película de forma ascendente.


																			-- Aunque pueden parecer opciones similares, para calcula el número de películas disponibles en el inventario
																			-- debe utilizarse COUNT(i."film_id") en lugar de COUNT(f."film_id").
																			-- La razón es que, en la consulta que se ha diseñado, COUNT(f."film_id") asignaría un 1 a aquellas películas 
																			-- que no están disponibles en el inventario, cuando en este caso se desea que la consulta devuelva un 0.


/*
========================================
CONSULTA 30

Obtener los actores y el número de películas en las que ha actuado.
========================================
*/
SELECT 		a."first_name" 			AS "nombre_actor",				-- Esta consulta selecciona las columnas que contienen el nombre de los actores de la tabla "actor",
			a."last_name" 			AS "apellido_actor",				-- el apellido de los actores de la tabla "actor"
			COUNT(fa."film_id") 	AS "cantidad_peliculas"				-- y calcula el número de películas asociadas a cada actor (utilizando el id de película)
FROM		"actor" 		AS a									-- Se trabaja con la tabla que resulta de considerar la tabla "actor" al completo (para que aparezcan todos los actores)
LEFT JOIN 	"film_actor" 	AS fa										-- más la intersección con la tabla "film_actor"
	ON		a."actor_id" = fa."actor_id"								-- relacionando la columna "actor_id" de la tabla "actor" y la columna "actor_id" de la tabla "film_actor".
GROUP BY	a."actor_id"											-- Se agrupan los datos por actor (utilizando su id)
ORDER BY	a."actor_id";											-- y se ordenan los resultados por id de actor de forma ascendente.


/*
========================================
CONSULTA 31

Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.
========================================
*/
SELECT  	f."title" 				AS "titulo_pelicula",			-- Esta consulta selecciona las columnas que contienen el título de las películas de la tabla "film",
			a."first_name" 			AS "nombre_actor",					-- el nombre de los actores de la tabla "actor"
			a."last_name" 			AS "apellido_actor"					-- y el apellido de los actores de la tabla "actor".
FROM		"film" 			AS f									-- Se trabaja con la tabla que resulta de considerar la tabla "film" al completo (para que aparezcan todas las películas)
LEFT JOIN	"film_actor" 	AS fa										-- más la intersección con la tabla "film_actor"
	ON		f."film_id" = fa."film_id" 									-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "film_actor".
LEFT JOIN	"actor" 		AS a										-- más la intersección con la tabla "actor"
	ON		fa."actor_id"=a."actor_id"									-- relacionando la columna "actor_id" de la tabla "film_actor" y la columna "actor_id" de la tabla "actor".
ORDER BY 	f."film_id";											-- Se ordenan los resultados por id de película de forma ascendente.


/*
========================================
CONSULTA 32

Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.
========================================
*/
SELECT  	a."first_name" 			AS "nombre_actor",				-- Esta consulta selecciona las columnas que contienen el nombre de los actores de la tabla "actor",
			a."last_name" 			AS "apellido_actor",				-- el apellido de los actores de la tabla "actor"
			f."title" 				AS "titulo_pelicula"				-- y el título de las películas de la tabla "film".
FROM		"actor"			AS a									-- Se trabaja con la tabla que resulta de considerar la tabla "actor" al completo (para que aparezcan todos los actores)
LEFT JOIN 	"film_actor" 	AS fa										-- más la intersección con la tabla "film_actor"
	ON		a."actor_id" = fa."actor_id"								-- relacionando la columna "actor_id" de la tabla "actor" y la columna "actor_id" de la tabla "film_actor"
LEFT JOIN	"film" 			AS f										-- más la intersección con la tabla "film"
 	ON 		fa."film_id" = f."film_id"									-- relacionando la columna "film_id" de la tabla "film_actor" y la columna "film_id" de la tabla "film".
ORDER BY 	a."actor_id";											-- Se ordenan los resultados por id de actor de forma ascendente.


/*
========================================
CONSULTA 33

Obtener todas las películas que tenemos y todos los registros de alquiler.
========================================
*/
SELECT 		f."title" 				AS "titulo_pelicula",			-- Esta consulta selecciona las columnas que contienen el título de las películas de la tabla "film",		
			i."inventory_id" 		AS "identificador_inventario",		-- el id de inventario de la tabla "inventory" (para poder diferenciar entre diferentes copias de la misma película)
			r."rental_id" 			AS "identificador_alquiler"			-- y el id de alquiler de la tabla "rental".
FROM		"film" 			AS f									-- Se trabaja con la tabla que resulta de considerar la tabla "film" al completo (para que aparezcan todas las películas)
FULL JOIN	"inventory"		AS i										-- más la intersección con la tabla "inventory" al completo 
	ON		f."film_id" = i."film_id"									-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "inventory"
FULL JOIN 	"rental" 		AS r										-- más la intersección con la tabla "rental" al completo (para que aparezcan todos los alquileres)
	ON		i."inventory_id" = r."inventory_id"							-- relacionando la columna "inventory_id" de la tabla "inventory" y la columna "inventory_id" de la tabla "rental".
ORDER BY 	f."title",												-- Se ordenan los resultados por título de película de forma ascendente (orden alfabético),
			i."inventory_id",											-- a continuación, se ordenan según el id de inventario de forma ascendente
			r."rental_id";												-- y, por último, se ordenan según el id de alquiler de forma ascendente.
				
					
/*
========================================
CONSULTA 34

Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.
========================================
*/
SELECT		c."first_name" 	AS "nombre_cliente",					-- Esta consulta selecciona las columnas que contienen el nombre de cliente de la tabla "customer",
			c."last_name" 	AS "apellido_cliente",						-- el apellido de cliente de la tabla "customer"
			SUM(p."amount") AS "dinero_gastado"							-- y calcula la suma de dinero que ha gastado cada cliente
FROM		"customer" 	AS c										-- Se trabaja con la tabla que resulta de la intersección de la tabla "customer"
INNER JOIN	"payment" 	AS p											-- con la tabla "payment" 
 	ON		c."customer_id" = p."customer_id"							-- relacionando la columna "customer_id" de la tabla "customer" y la columna "customer_id" de la tabla "payment".
GROUP BY 	c."customer_id"											-- Se agrupan los datos por cliente (utilizando su id),
ORDER BY 	SUM(p."amount") DESC									-- se ordenan los resultados por dinero total gastado en orden descendente (aparecen primero los clientes que más han gastado)
LIMIT		5 ;														-- y únicamente se muestran los resultados de las 5 primeras filas.  		
		
	
/*
========================================
CONSULTA 35

Selecciona todos los actores cuyo primer nombre es 'Johnny'.
========================================
*/
SELECT		"actor_id" 		AS "id_actor",							-- Esta consulta selecciona las columnas que contienen el identificador de actor,
			"first_name" 	AS "nombre_actor",							-- el nombre de actor,
			"last_name"		AS "apellido_actor"							-- y el apellido de actor 
FROM		"actor"													-- de la tabla "actor"
WHERE   	LOWER("first_name") = LOWER('Johnny');					-- y filtra los datos para considera solo los actores cuyo primer nombre es 'Johnny'.
															

																	-- Se ha hecho uso de LOWER para convertir a minúsculas todos los caracteres de las cadenas de texto implicadas (strings)
																	-- y evitar así posibles problemas de identificación derivados de la presencia de mayúsculas y minúsculas. 


/*
========================================
CONSULTA 36

Renombra la columna “first_nameˮ como Nombre y “last_nameˮ como Apellido.
========================================
*/
SELECT 		"first_name" 	AS "Nombre", 							-- Esta consulta selecciona la columna "first_name" y la renombra como "Nombre",
			"last_name" 	AS "Apellido"								-- y selecciona la columna "last_name" y la renombra como "Apellido".   
FROM		"actor";												-- Se trabaja con la tabla "actor".


/*
========================================
CONSULTA 37

Encuentra el ID del actor más bajo y más alto en la tabla actor.
========================================
*/
SELECT 		MIN("actor_id") 	AS "id_actor_mas_bajo",				-- Esta consulta calcula el id de actor más bajo (valor mínimo de la columna "actor_id") 	 
			MAX("actor_id") 	AS "id_actor_mas_alto"					-- y el id de actor más alto (valor máximo de la columna "actor_id")
FROM 		"actor";												-- de los actores de la tabla "actor".


/*
========================================
CONSULTA 38
 
Cuenta cuántos actores hay en la tabla “actorˮ.
========================================
*/
SELECT 		COUNT("actor_id") 	AS "cantidad_total_actores"			-- Esta consulta calcula el número total de registros de la columna "actor_id"
FROM		"actor";												-- de la tabla "actor".
																		

																	-- El recuento se ha realizado sobre la columna "actor_id" porque, al ser la primary key de la tabla "actor",
																	-- identifica de forma única a cada registro de esta tabla, no pudiendo ninguno de sus valores repetirse o ser nulo.			

														
/*
========================================
CONSULTA 39

Selecciona todos los actores y ordénalos por apellido en orden ascendente.
========================================
*/
SELECT 		"first_name" 		AS "nombre_actor", 					-- Esta consulta selecciona las columnas que contienen el nombre 
			"last_name"	 		AS "apellido_actor"						-- y el apellido
FROM		"actor"													-- de los actores de la tabla "actor"
ORDER BY 	"apellido_actor" ASC;									-- y ordena los resultados por apellido de actor de forma ascendente (orden alfabético).			

																
																	-- ORDER BY ordena los resultados de forma ascendente por defecto, 
																	-- por lo que, en este caso, podría omitirse ASC. 

																	
																	-- Dado que SELECT se ejecuta antes que ORDER BY, puede emplearse en ORDER BY el alias "apellido_actor" definido en SELECT.
																

/*
========================================
CONSULTA 40

Selecciona las primeras 5 películas de la tabla “filmˮ.
========================================
*/
SELECT 		*														-- Esta consulta selecciona todas las columnas 
FROM		"film"													-- de la tabla "film" 
LIMIT 		5;														-- y únicamente muestra los resultados de las 5 primeras filas. 


/*
========================================
CONSULTA 41

Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. 
¿Cuál es el nombre más repetido?.
========================================
*/
SELECT		"first_name" 		AS "nombre_actor", 					-- Esta consulta selecciona la columna que contiene el nombre 
			COUNT("first_name") AS "repeticiones_nombre"				-- y calcula el número de veces que cada nombre se repite.
FROM		"actor"													-- Se trabaja con la tabla "actor".
GROUP BY 	"first_name"											-- Se agrupan los datos por nombre de actor				
ORDER BY 	"repeticiones_nombre" DESC;								-- y se ordenan los resultados de forma descendente según el número de veces que cada nombre se repite.  
					

				-- ¿Cuál es el nombre más repetido?
				-- La consulta realizada muestra que los nombres más repetidos son KENNETH, PENELOPE y JULIA con 4 repeticiones cada uno.


/*
========================================
CONSULTA 42

Encuentra todos los alquileres y los nombres de los clientes que los realizaron.
========================================
*/
SELECT		r."rental_id" 	AS "identificador_alquiler",			-- Esta consulta selecciona las columnas que contienen el id de alquiler de la tabla "rental",
			c."first_name" 	AS "nombre_cliente",						-- el nombre de cliente de la tabla "customer"
			c."last_name" 	AS "apellido_cliente"						-- y el apellido de cliente de la tabla "customer".
FROM		"rental" 	AS r										-- Se trabaja con la tabla que resulta de considerar la tabla "rental" al completo (para que aparezcan todos los alquileres)
LEFT JOIN	"customer" 	AS c											-- más la intersección con la tabla "customer"
	ON		r."customer_id" = c."customer_id";							-- relacionando la columna "customer_id" de la tabla "rental" y la columna "customer_id" de la tabla "customer".
	

/*
========================================
CONSULTA 43

Muestra todos los clientes y sus alquileres si existen, incluyendo aquellos que no tienen alquileres.
========================================
*/
SELECT		c."first_name" 	AS "nombre_cliente",					-- Esta consulta selecciona las columnas que contienen el nombre de cliente de la tabla "customer",
			c."last_name" 	AS "apellido_cliente",						-- el apellido de cliente de la tabla "customer"
			r."rental_id" 	AS "identificador_alquiler" 				-- y el id de alquiler de la tabla "rental".	
FROM		"rental" 	AS r										-- Se trabaja con la tabla que resulta de considerar la intersección de la tabla "rental"                 
RIGHT JOIN	"customer" 	AS c											-- con la tabla "customer" al completo (para que aparezcan todos los clientes)
 	ON		r."customer_id" = c."customer_id"							-- relacionando la columna "customer_id" de la tabla "rental" y la columna "customer_id" de la tabla "customer".
ORDER BY 	"nombre_cliente",										-- Se ordenan los resultados por nombre de cliente de forma ascendente (orden alfabético).
			"identificador_alquiler";									-- y, posteriormente, se ordenan por id de alquiler de forma ascendente.


/*
========================================
CONSULTA 44

Realiza un CROSS JOIN entre las tablas film y category. 
¿Aporta valor esta consulta? ¿Por qué? Deja después de la consulta la contestación.
========================================
*/
SELECT 		*														-- Esta consulta selecciona todas las columnas 
FROM 		"film"		AS f										-- de la tabla que resulta de combinar cada fila de la tabla "film"
CROSS JOIN	"category"	AS c;											-- con cada fila de la tabla "category".


				-- ¿Aporta valor esta consulta? ¿Por qué?
				-- La consulta realizada devuelve todas las combinaciones posibles entre las películas de la tabla "film" y las categorías de la tabla "category".
				-- Dado que cada película está asociada a una única categoría (acción, comedia, drama, etc.) y carece de utilidad real estudiar el caso en el que 
				-- una misma película pueda pertenecer a diferentes categorías, se concluye que esta consulta no aporta valor. 


/*
========================================
CONSULTA 45

Encuentra los actores que han participado en películas de la categoría 'Action'.
========================================
*/
SELECT DISTINCT 	a."actor_id" 	AS "id_actor",				-- Esta consulta selecciona los resultados únicos (no duplicados) de las columnas que contienen el id de actor de la tabla "actor",
					a."first_name" 	AS "nombre_actor",				-- el nombre de actor de la tabla "actor",
					a."last_name" 	AS "apellido_actor",			-- el apellido de actor de la tabla "actor" y 
					c."name" 		AS "categoria_pelicula"			-- la categoría de película de la tabla "category".
FROM		"actor" 		AS a								-- Se trabaja con la tabla que resulta de la intersección de la tabla "actor"
INNER JOIN	"film_actor" 	AS fa									-- con la tabla "film_actor"
	ON		a."actor_id" = fa."actor_id"							-- relacionando la columna "actor_id" de la tabla "actor" y la columna "actor_id" de la tabla "film_actor",
INNER JOIN	"film" 			AS f									-- más la intersección con la tabla "film"
 	ON 		fa."film_id" = f."film_id"								-- relacionando la columna "film_id" de la tabla "film_actor" y la columna "film_id" de la tabla "film",
INNER JOIN 	"film_category" AS fc									-- más la intersección con la tabla "film_category"
	ON 		f."film_id" = fc."film_id"								-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "film_category",
INNER JOIN 	"category" 		AS c 									-- más la intersección con la tabla "category"
	ON 		fc."category_id" = c."category_id" 						-- relacionando la columna "category_id" de la tabla "film_category" y la columna "category_id" de la tabla "category".
WHERE 		LOWER(c."name")=LOWER('Action')						-- Se filtran los datos para considerar solo las películas de la categoría 'Action'
ORDER BY 	a."actor_id";										-- y se ordenan los resultados por id de actor de forma ascendente.
															

																-- El uso de DISTINCT en SELECT evita que la consulta devuelva filas duplicadas en el caso de que un mismo actor
																-- haya participado en más de una película de la categoría 'Action'.


																-- Se ha hecho uso de LOWER para convertir a minúsculas todos los caracteres de las cadenas de texto implicadas (strings)
																-- y evitar así posibles problemas de identificación derivados de la presencia de mayúsculas y minúsculas. 


/*
========================================
CONSULTA 46

Encuentra todos los actores que no han participado en películas.
========================================
*/
SELECT  	a."first_name" 		AS "nombre_actor",				-- Esta consulta selecciona las columnas que contienen el nombre de los actores de la tabla "actor",
			a."last_name" 		AS "apellido_actor",				-- el apellido de los actores de la tabla "actor"
			COUNT(fa."film_id") AS "cantidad_peliculas"				-- y calcula el número de películas en las que han participado.
FROM  		"actor" 		AS a								-- Se trabaja con la tabla que resulta de considerar la tabla "actor" al completo (para que aparezcan todos los actores) 
LEFT JOIN 	"film_actor" 	AS fa 									-- más la interesección con la tabla "film_actor"
	ON 		a."actor_id" = fa."actor_id" 							-- relacionando la columna "actor_id" de la tabla "actor" y la columna "actor_id" de la tabla "film_actor".
GROUP BY 	a."actor_id"							 			-- Se agrupan los datos por actor (utilizando su id),
HAVING 		COUNT(fa."film_id") = 0								-- se filtran los grupos (actores a través de su id) para considerar solo aquellos actores que no han participado en películas
ORDER BY 	a."actor_id";										-- y se ordenan los resultados por id de actor de forma ascendente.

																
																-- La consulta realizada no muestra ningún resultado porque todos los actores de la tabla "actor" han participado en alguna película.


/*
========================================
CONSULTA 47

Selecciona el nombre de los actores y la cantidad de películas en las que han participado.
========================================
*/
SELECT  	a."first_name" 		AS "nombre_actor",				-- Esta consulta selecciona las columnas que contienen el nombre de los actores de la tabla "actor",
			a."last_name" 		AS "apellido_actor",				-- el apellido de los actores de la tabla "actor"
			COUNT(fa."film_id") AS "cantidad_peliculas"				-- y calcula el número de películas en las que han participado.
FROM  		"actor" 		AS a								-- Se trabaja con la tabla que resulta de considerar la tabla "actor" al completo (para que aparezcan todos los actores) 
LEFT JOIN 	"film_actor" 	AS fa 									-- más la interesección con la tabla "film_actor"
	ON 		a."actor_id" = fa."actor_id" 							-- relacionando la columna "actor_id" de la tabla "actor" y la columna "actor_id" de la tabla "film_actor".
GROUP BY 	a."actor_id"							 			-- Se agrupan los datos por actor (utilizando su id)
ORDER BY 	a."actor_id";										-- y se ordenan los resultados por id de actor de forma ascendente.


/*
========================================
CONSULTA 48

Crea una vista llamada “actor_num_peliculasˮ que muestre los nombres de los actores y el número de películas en las que han participado.
========================================
*/
CREATE VIEW actor_num_peliculas AS								-- Esta consulta crea una vista llamada "actor_num_peliculas" con la siguiente información:
SELECT 		a."first_name" 			AS "nombre_actor",			-- Se seleccionan las columnas que contienen el nombre de los actores de la tabla "actor",
			a."last_name" 			AS "apellido_actor",			-- el apellido de los actores de la tabla "actor"
			COUNT(fa."film_id") 	AS "cantidad_peliculas"			-- y se calcula el número de películas asociadas a cada actor (utilizando el id de película)
FROM		"actor" 		AS a								-- Se trabaja con la tabla que resulta de considerar la tabla "actor" al completo (para que aparezcan todos los actores)
LEFT JOIN 	"film_actor" 	AS fa									-- más la intersección con la tabla "film_actor"
	ON		a."actor_id" = fa."actor_id"							-- relacionando la columna "actor_id" de la tabla "actor" y la columna "actor_id" de la tabla "film_actor".
GROUP BY	a."actor_id"										-- Se agrupan los datos por actor (utilizando su id)
ORDER BY	a."actor_id";										-- y se ordenan los resultados por id de actor de forma ascendente.


-- Para acceder a los resultados de la vista creada en esta consulta basta ejecutar el siguiente código:
SELECT 		*
FROM 		"actor_num_peliculas" AS anp;


/*
========================================
CONSULTA 49

Calcula el número total de alquileres realizados por cada cliente.
========================================
*/
SELECT 		c."first_name" 			AS "nombre_cliente",		-- Esta consulta selecciona las columnas que contienen el nombre de cliente de la tabla "customer",
			c."last_name" 			AS "apellido_cliente",			-- el apellido de cliente de la tabla "customer"
			COUNT (r."rental_id") 	AS "cantidad_alquileres"		-- y calcula el número de alquileres que realiza cada cliente.
FROM 		"customer" 		AS c								-- Se trabaja con la tabla que resulta de considerar la tabla "customer" al completo (para que aparezcan todos los clientes)
LEFT JOIN	"rental" 		AS r									-- más la interesección con la tabla "rental"
	ON		c."customer_id" = r."customer_id"						-- relacionando la columna "customer_id" de la tabla "customer" y la columna "customer_id" de la tabla "rental".
GROUP BY	c."customer_id"										-- Se agrupan los datos por cliente (utilizando su id)
ORDER BY	c."customer_id";									-- y se ordenan los resultados por id de cliente de forma ascendente.


/*
========================================
CONSULTA 50

Calcula la duración total de las películas en la categoría 'Action'.
========================================
*/
SELECT  	c."name" 			AS "nombre_categoria",			-- Esta consulta selecciona las columnas que contienen la categoría de película de la tabla "category",
			SUM(f."length") 	AS "duracion_total"					-- y calcula la duración total de las películas de cada categoría.
FROM 		"film" 			AS f								-- Se trabaja con la tabla que resulta de la intersección de la tabla "film" 
INNER JOIN 	"film_category" AS fc									-- con la tabla "film_category" 
	ON 		f."film_id" = fc."film_id"								-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "film_category",
INNER JOIN	"category" 		AS c									-- más la intersección con la tabla "category"
	ON		fc."category_id" = c."category_id"						-- relacionando la columna "category_id" de la tabla "film_category" y la columna "category_id" de la tabla "category".
WHERE 		LOWER(c."name") = LOWER('Action')					-- Se filtran los datos para considerar solo las películas de la categoría 'Action'
GROUP BY 	c."name";											-- y se agrupan los datos por categoría de película.


/*
========================================
CONSULTA 51
 
Crea una tabla temporal llamada “cliente_rentas_temporalˮ para almacenar el total de alquileres por cliente.
========================================
*/
CREATE TEMPORARY TABLE	clientes_rentas_temporal AS 			-- Esta consulta crea una tabla temporal llamada "clientes_rentas_temporal" con la siguiente información:
SELECT 		c."first_name" 			AS "nombre_cliente",		-- Se seleccionan las columnas que contienene el nombre de cliente de la tabla "customer",
			c."last_name" 			AS "apellido_cliente",			-- el apellido de cliente de la tabla "customer"
			COUNT (r."rental_id") 	AS "cantidad_alquileres"		-- y se calcula el número de alquileres que realiza cada cliente.
FROM 		"customer" 	AS c									-- Se trabaja con la tabla que resulta de considerar la tabla "customer" al completo (para que aparezcan todos los clientes)
LEFT JOIN	"rental" 	AS r										-- más la intersección con la tabla "rental"
	ON		c."customer_id" = r."customer_id"						-- relacionando la columna "customer_id" de la tabla "customer" y la columna "customer_id" de la tabla "rental".
GROUP BY	c."customer_id"										-- Se agrupan los datos por cliente (utilizando su id)
ORDER BY	c."customer_id";									-- y se ordenan los resultados por id de cliente de forma ascendente.


-- Para acceder a los resultados de la tabla temporal creada en esta consulta basta ejecutar el siguiente código:
SELECT 		*
FROM 		"clientes_rentas_temporal" AS anp;


/*
========================================
CONSULTA 52

Crea una tabla temporal llamada “peliculas_alquiladasˮ que almacene las películas que han sido alquiladas al menos 10 veces.
========================================
*/	
CREATE TEMPORARY TABLE peliculas_alquiladas AS 					-- Esta consulta crea una tabla temporal llamada "películas alquiladas" con la siguiente información:
SELECT		f."title" 				AS "titulo_pelicula",		-- Se selecciona la columna que contienene el título de las películas de la tabla "film"
			COUNT (r."rental_id") 	AS "cantidad_alquileres"		-- y se calcula el número de veces que cada película ha sido alquilada.
FROM 		"film" 		AS f									-- Se trabaja con la tabla que resulta de la intersección de la tabla "film" 
INNER JOIN	"inventory" AS i										-- con la tabla "inventory"
	ON		f."film_id" = i."film_id"								-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "inventory",
INNER JOIN	"rental" 	AS r										-- más la intersección con la tabla "rental"
	ON 		i."inventory_id" = r."inventory_id"						-- relacionando la columna "inventory_id" de la tabla "inventory" y la columna "inventory_id" de la tabla "rental"
GROUP BY	f."film_id"											-- Se agrupan los datos por película (utilizando su id),
HAVING 		COUNT (r."rental_id") >= 10							-- se filtran los grupos (películas a través de su id) para considerar solo aquellas películas que han sido alquiladas 10 veces o más
ORDER BY	f."film_id";										-- y se ordenan los resultados por id de película de forma ascendente.


-- Para acceder a los resultados de la tabla temporal creada en esta consulta basta ejecutar el siguiente código:
SELECT 		*
FROM 		"peliculas_alquiladas" AS anp;


/*
========================================
CONSULTA 53

Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre ‘Tammy Sandersʼ y que aún no se han devuelto. 
Ordena los resultados alfabéticamente por título de película.
========================================
*/	
SELECT 		f."title" 									AS "titulo_pelicula",			-- Esta consulta selecciona la columna que contiene el título de las películas de la tabla "film",
			CONCAT (c."first_name",' ',c."last_name") 	AS "nombre_completo_cliente",		-- une en una única columna el nombre y el apellido de los clientes de la tabal "customer",
			r."rental_date" 							AS "fecha_alquiler",				-- selecciona la fecha de alquiler de cada película de la tabla "rental"
			r."return_date" 							AS "fecha_devolucion"				-- y la fecha de devolución de cada película de la tabla "rental".
FROM		"customer" 	AS c															-- Se trabaja con la tabla que resulta de la intersección de la tabla "customer" 
INNER JOIN	"rental" 	AS r																-- con la tabla "rental"
	ON		c."customer_id" = r."customer_id"												-- relacionando la columna "customer_id" de la tabla "customer" y la columna "customer_id" de la tabla "rental",
INNER JOIN	"inventory" AS i																-- más la intersección con la tabla "inventory"
	ON 		r."inventory_id" = i."inventory_id"												-- relacionando la columna "inventory_id" de la tabla "rental" y la columna "inventory_id" de la tabla "inventory",
INNER JOIN	"film" 		AS f																-- más la intersección con la tabla "film"
	ON 		i."film_id" = f."film_id"														-- relacionando la columna "film_id" de la tabla "inventory" y la columna "film_id" de la tabla "film".
WHERE 		LOWER(CONCAT (c."first_name",' ',c."last_name")) = LOWER('Tammy Sanders')	-- Se filtran los datos para considerar solo aquellos asociados al cliente 'Tammy Sanders'  
	AND		r."return_date" IS NULL															-- y que carecen de fecha de devolución.
ORDER BY 	"titulo_pelicula";															-- Se ordenan los resultados por título de película en forma ascendente (orden alfabético).


																						-- Se ha hecho uso de LOWER para convertir a minúsculas todos los caracteres de las cadenas de texto implicadas (strings)
																						-- y evitar así posibles problemas de identificación derivados de la presencia de mayúsculas y minúsculas. 


/*
========================================
CONSULTA 54

Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría ‘Sci-Fiʼ. 
Ordena los resultados alfabéticamente por apellido.
========================================
*/
SELECT DISTINCT 	a."actor_id" 	AS "id_actor",				-- Esta consulta selecciona los resultados únicos (no duplicados) de las columnas que contienen el id de actor de la tabla "actor",
					a."first_name" 	AS "nombre_actor",				-- el nombre de actor de la tabla "actor",
					a."last_name" 	AS "apellido_actor",			-- el apellido de actor de la tabla "actor"  
					c."name" 		AS "categoria_pelicula"			-- y la categoría de película de la tabla "category".
FROM		"actor" 		AS a								-- Se trabaja con la tabla que resulta de la intersección de la tabla "actor"
INNER JOIN	"film_actor" 	AS fa									-- con la tabla "film_actor"
	ON		a."actor_id" = fa."actor_id"							-- relacionando la columna "actor_id" de la tabla "actor" y la columna "actor_id" de la tabla "film_actor",
INNER JOIN	"film" 			AS f									-- más la intersección con la tabla "film"
 	ON 		fa."film_id" = f."film_id"								-- relacionando la columna "film_id" de la tabla "film_actor" y la columna "film_id" de la tabla "film",
INNER JOIN 	"film_category" AS fc									-- más la intersección con la tabla "film_category"
	ON 		f."film_id" = fc."film_id"								-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "film_category",
INNER JOIN 	"category" 		AS c 									-- más la intersección con la tabla "category"
	ON 		fc."category_id" = c."category_id" 						-- relacionando la columna "category_id" de la tabla "film_category" y la columna "category_id" de la tabla "category".
WHERE 		LOWER(c."name")=LOWER('Sci-Fi')						-- Se filtran los datos para considerar solo las películas de la categoría 'Sci-Fi'
ORDER BY 	a."last_name";										-- y se ordenan los resultados por apellido de actor de forma ascendente (orden alfabético).
																												

																-- El uso de DISTINCT en SELECT evita que la consulta devuelva filas duplicadas en el caso de que un mismo actor
																-- haya participado en más de una película de la categoría 'Sci-Fi'.


																-- Se ha hecho uso de LOWER para convertir a minúsculas todos los caracteres de las cadenas de texto implicadas (strings)
																-- y evitar así posibles problemas de identificación derivados de la presencia de mayúsculas y minúsculas. 


/*
========================================
CONSULTA 55

Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película ‘Spartacus Cheaperʼ se alquilara por primera vez. 
Ordena los resultados alfabéticamente por apellido.
========================================
*/
WITH 	actor_pelicula_alquiler AS (							-- Esta consulta comienza creando una CTE de nombre "actor_pelicula_alquiler" con la siguiente información:
SELECT 		a."actor_id" 	AS "id_actor",						-- Se seleccionan las columnas que contienen el id de actor de la tabla "actor",
			a."first_name"	AS "nombre_actor",						-- el nombre de actor de la tabla "actor",
			a."last_name" 	AS "apellido_actor",					-- el apellido de actor de la tabla "actor",
			f."film_id"		AS "id_pelicula",						-- el id de pelicula de la tabla "film",
			f."title"		AS "titulo_pelicula",					-- el título de pelicula de la tabla "film"
			r."rental_id"	AS "id_alquiler",						-- el id de alquiler de la tabla "rental",
			r."rental_date"	AS "fecha_alquiler"						-- y la fecha de alquiler de la tabla "category".
FROM		"actor" 			AS a							-- Se trabaja con la tabla que resulta de la intersección de la tabla "actor"
INNER JOIN	"film_actor" 		AS fa								-- con la tabla "film_actor"
	ON		a."actor_id" = fa."actor_id"							-- relacionando la columna "actor_id" de la tabla "actor" y la columna "actor_id" de la tabla "film_actor",
INNER JOIN	"film" 				AS f								-- más la intersección con la tabla "film"
 	ON 		fa."film_id" = f."film_id"								-- relacionando la columna "film_id" de la tabla "film_actor" y la columna "film_id" de la tabla "film",
INNER JOIN 	"inventory" 		AS i								-- más la intersección con la tabla "inventory"
	ON 		f."film_id" = i."film_id"								-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "inventory",
INNER JOIN 	"rental" 			AS r 								-- más la intersección con la tabla "rental"
	ON 		i."inventory_id" = r."inventory_id"						-- relacionando la columna "inventory_id" de la tabla "inventory" y la columna "inventory_id" de la tabla "rental".
)
SELECT DISTINCT apa_1."nombre_actor",							-- A continuación, se seleccionan los resultados únicos (no duplicados) de las columnas que contienen el nombre de actor
				apa_1."apellido_actor"								-- y el apellido de actor.
FROM 		"actor_pelicula_alquiler" AS "apa_1"				-- Se trabaja con la CTE creada inicialmente ("actor_pelicula_alquiler")
WHERE 		apa_1."fecha_alquiler" > (							-- Se filtran los datos para considerar solo aquellos cuya fecha de alquiler sea superior al resultado de la siguiente subconsulta:
	SELECT 		MIN(apa_2."fecha_alquiler")										-- Se calcula el valor mínimo de la columna "fecha_alquiler"
	FROM 		"actor_pelicula_alquiler" AS "apa_2"							-- de la CTE creada inicialmente ("actor_pelicula_alquiler")
	WHERE   	LOWER(apa_2."titulo_pelicula") = LOWER ('Spartacus Cheaper'))	-- Se filtran los datos para considerar solo la película de título 'Spartacus Cheaper'.
ORDER BY 	apa_1."apellido_actor",								-- Se ordenan los resultados por apellido de actor en forma ascendente (orden alfabético)
			apa_1."nombre_actor";								-- y, posteriormente, se ha decidido ordenarlos también por nombre de actor en forma ascendente.
					
	
/*
========================================
CONSULTA 56

Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría ‘Musicʼ.
========================================
*/
WITH 		actor_pelicula_categoria AS (						-- Esta consulta comienza creando una CTE de nombre "actor_pelicula_categoria" con la siguiente información:
SELECT 		a."actor_id"	AS "id_actor",						-- Se seleccionan las columnas que contienen el id de actor de la tabla "actor",
			a."first_name"	AS "nombre_actor",						-- el nombre de actor de la tabla "actor",
			a."last_name"	AS "apellido_actor",					-- el apellido de actor de la tabla "actor",
			f."film_id"		AS "id_pelicula",						-- el id de pelicula de la tabla "film",
			f."title"		AS "titulo_pelicula",					-- el título de pelicula de la tabla "film"
			c."category_id"	AS "id_categoria",						-- el id de categoría de película de la tabla "category"
			c."name"		AS "categoria_pelicula"					-- y la categoría de película de la tabla "category".
FROM		"actor" 			AS a							-- Se trabaja con la tabla que resulta de la intersección de la tabla "actor"
INNER JOIN	"film_actor" 		AS fa								-- con la tabla "film_actor"
	ON		a."actor_id" = fa."actor_id"							-- relacionando la columna "actor_id" de la tabla "actor" y la columna "actor_id" de la tabla "film_actor",
INNER JOIN	"film" 				AS f								-- más la intersección con la tabla "film"
 	ON 		fa."film_id" = f."film_id"								-- relacionando la columna "film_id" de la tabla "film_actor" y la columna "film_id" de la tabla "film",
INNER JOIN 	"film_category" 	AS fc								-- más la intersección con la tabla "film_category"
	ON 		f."film_id" = fc."film_id"								-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "film_category",
INNER JOIN 	"category" 			AS c 								-- más la intersección con la tabla "category"
	ON 		fc."category_id" = c."category_id"						-- relacionando la columna "category_id" de la tabla "film_category" y la columna "category_id" de la tabla "category".
)
SELECT DISTINCT 	apc_1."id_actor",							-- A continuación, se seleccionan los resultados únicos (no duplicados) de la columnas que contienen el id de actor,
					apc_1."nombre_actor",							-- el nombre de actor 
					apc_1."apellido_actor"							-- y el apellido de actor.
FROM		"actor_pelicula_categoria" AS apc_1					-- Se trabaja con la CTE creada inicialmente ("actor_pelicula_categoria")
WHERE NOT EXISTS (												-- Se filtran los datos para considerar solo los resultados donde no exista ningún registro que cumpla la siguiente subconsulta:
	SELECT 1																-- Subconsulta
	FROM 	"actor_pelicula_categoria" AS apc_2								-- Se trabaja con la CTE creada inicialmente ("actor_pelicula_categoria")
	WHERE 	apc_2."id_actor" = apc_1."id_actor"								-- Se filtran los datos para garantizar que para un mismo actor (identificado mediante su id)
	AND		LOWER(apc_2."categoria_pelicula") = LOWER('Music'))				-- alguna de las películas en las que ha participado pertenece a la categoría "Music". 
ORDER BY	apc_1."id_actor";									-- Se ordenan los resultados según el id de actor de forma ascendente.


/*
========================================
CONSULTA 57

Encuentra el título de todas las películas que fueron alquiladas por más de 8 días.
========================================
*/
SELECT DISTINCT 	f."title" 	AS "titulo_pelicula"				-- Esta consulta selecciona los resultados únicos (no duplicados) de la columna que contiene los títulos de película de la tabla "film".	
FROM 		"rental" 	AS r										-- Se trabaja con la tabla que resulta de la intersección de la tabla "rental"
INNER JOIN 	"inventory" AS i											-- con la tabla "inventory"
	ON		r."inventory_id" = i."inventory_id"							-- relacionando la columna "inventory_id" de la tabla "rental" y la columna "inventory_id" de la tabla "inventory"
INNER JOIN	"film"		AS f											-- más la intersección con la tabla "film"
	ON		i."film_id" = f."film_id"									-- relacionando la columna "film_id" de la tabla "inventory" y la columna "film_id" de la tabla "film"
WHERE 		EXTRACT(DAY FROM(r."return_date"-r."rental_date")) > 8	-- Se filtran los datos para considerar solo los títulos con una diferencia entre la fecha de alquiler y de devolución superior a 8 días.
ORDER BY 	f."title";												-- Se ordenan los resultados por título de película de forma ascendente (orden alfabético).


/*
========================================
CONSULTA 58

Encuentra el título de todas las películas que son de la misma categoría que ‘Animationʼ.
========================================
*/
SELECT 	 	f."title" 	AS "titulo_pelicula",						-- Esta consulta selecciona las columnas que contienen el título de las películas de la tabla "film", 
			c."name" 	AS "categoria_pelicula"							-- y la categoría de las películas de la tabla "category".
FROM 		"film" 			AS f									-- Se trabaja con la tabla que resulta de la intersección de la tabla "film"							
INNER JOIN 	"film_category" AS fc										-- con la tabla "film_category"						
	ON		f."film_id" = fc."film_id"									-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "film_category"
INNER JOIN	"category" 		AS c										-- más la intersección con la tabla "category"			
	ON 		fc."category_id" = c."category_id"							-- relacionando la columna "category_id" de la tabla "film_category" y la columna "category_id" de la tabla "category".				
WHERE 		LOWER(c."name") = LOWER('Animation');					-- Se filtran los datos para considera solo aquellos asociados a películas cuya categoría es 'Animation'.											-- y cuya duración supera los 180 min.


																	-- Se ha hecho uso de LOWER para convertir a minúsculas todos los caracteres de las cadenas de texto implicadas (strings)
																	-- y evitar así posibles problemas de identificación derivados de la presencia de mayúsculas y minúsculas. 


/*
========================================
CONSULTA 59

Encuentra los nombres de las películas que tienen la misma duración que la película con el título ‘Dancing Feverʼ. 
Ordena los resultados alfabéticamente por título de película.
========================================
*/
SELECT 		"title" 	AS "titulo_pelicula",						-- Esta consulta selecciona las columnas que contienen el título  
			"length"	AS "duracion_pelicula"							-- y la duración
FROM 		"film"													-- de las películas de la tabla "film".
WHERE 		"length" = (											-- Se filtran los datos para considerar solo las películas cuya duración sea igual al resultado de la siguiente subconsulta: 
	SELECT	"length" 													-- Se selecciona la duración
	FROM 	"film"														-- de la película de la tabla "film"
	WHERE 	LOWER("title") = LOWER('Dancing Fever'))					-- cuyo título es 'Dancing Fever'
ORDER BY 	"title";												-- Se ordenan los resultados por título de película de forma ascendente (orden alfabético).


/*
========================================
CONSULTA 60
 
Encuentra los nombres de los clientes que han alquilado al menos 7 películas distintas. 
Ordena los resultados alfabéticamente por apellido.
========================================
*/
SELECT 		CONCAT(c."first_name",' ',c."last_name")	AS "nombre_completo_cliente",					-- Esta consulta une en una sola columna el nombre y el apellido de los clientes de la tabla "customer"
			COUNT (DISTINCT i."inventory_id")			AS "cantidad_peliculas_distintas_alquiladas"		-- y calcula la cantidad de peliculas distintas que han sido alquiladas por cada uno de ellos.
FROM 		"customer"	AS c																			-- Se trabaja con la tabla que resulta de la intersección de la tabla "customer"
INNER JOIN 	"rental" 	AS r																				-- con la tabla "rental"
	ON 		c."customer_id" = r."customer_id"																-- relacionando la columna "customer_id" de la tabla "customer" y la columna "customer_id" de la tabla "rental"
INNER JOIN	"inventory" AS i																				-- más la intersección de la tabla "inventory"
	ON 		r."inventory_id" = i."inventory_id"																-- relacionando la columna "inventory_id" de la tabla "rental" y la columna "inventory_id" de la tabla "inventory"
GROUP BY   	c."first_name",																				-- Se agrupan los datos por nombre de cliente 
			c."last_name"																					-- y por apellido de cliente
HAVING 		COUNT (DISTINCT i."inventory_id") >= 7														-- Se filtran los grupos para considerar solo aquellos clientes que han alquilado 7 o más películas distintas.
ORDER BY 	c."last_name";																				-- Se ordenan los resultados por apellido de cliente de forma ascendente (orden alfabético).


/*
========================================
CONSULTA 61

Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
========================================
*/
SELECT 		c."name" 				AS "nombre_categoria",			-- Esta consulta selecciona la columna que contienene las categorías de película de la tabla "category"
			COUNT(r."rental_id")	AS "cantidad_alquileres"			-- y calcula la cantidad de veces que ha sido alquilada una película de una determinada categoría
FROM 		"film" 			AS f									-- Se trabaja con la tabla que resulta de la intersección de la tabla "film"
INNER JOIN	"inventory" 	AS i										-- con la tabla "inventory"
	ON		f."film_id" = i."film_id"									-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "inventory",
INNER JOIN	"rental" 		AS r										-- más la intersección con la tabla "rental"
	ON 		i."inventory_id" = r."inventory_id"							-- relacionando la columna "inventory_id" de la tabla "inventory" y la columna "inventory_id" de la tabla "rental",
INNER JOIN 	"film_category" AS fc										-- más la intersección con la tabla "film_category"
	ON		f."film_id" = fc."film_id"									-- relacionando la columna "film_id" de la tabla "film" y la columna "film_id" de la tabla "film_category",
INNER JOIN 	"category" 		AS c										-- más la intersección con la tabla "category"
	ON 		fc."category_id" = c."category_id"							-- relacionando la columna "category_id" de la tabla "film_category" y la columna "category_id" de la tabla "category".
GROUP BY 	c."name"												-- Se agrupan los datos por categoría de película.
ORDER BY 	"cantidad_alquileres" DESC;								-- Se ordenan los resultados por cantidad de alquileres de forma descendente.									


/*
========================================
CONSULTA 62

Encuentra el número de películas por categoría estrenadas en 2006.
========================================
 */
SELECT 		c."name" 				AS "categoria_pelicula",					-- Esta consulta selecciona la columna que contienene las categorías de película de la tabla "category"
			COUNT(f."film_id") 		AS "cantidad_peliculas_estrenadas_2006"			-- y calcula la cantidad de películas que han sido estrenadas en 2006 por categoría
FROM 		"film"			 	AS f											-- Se trabaja con la tabla que resulta de la intersección de la tabla "film"
INNER JOIN 	"film_category" 	AS fc												-- con la tabla "film_category"
	ON 		f."film_id" = fc."film_id"												-- relacionando la columna "film_id" de la tabla "film" con la columna "film_id" de la tabla "film_category"
INNER JOIN	"category" 			AS c												-- más la intersección de la tabla "category"
	ON 		fc."category_id" = c."category_id"										-- relacionando la columna "category_id" de la tabla "film_category" con la columna "category_id" de la tabla "category".
WHERE 		f."release_year" = 2006												-- Se filtran los datos para considera solo las películas cuya fecha de estreno es 2006.
GROUP BY 	c."name"															-- A continuación, se agrupan los datos por categoría de película.
ORDER BY 	"cantidad_peliculas_estrenadas_2006" DESC;							-- Finalmente, se ordenan los resultados por cantidad de películas estrenadas de forma descendente. 


/*
========================================
CONSULTA 63

Obtén todas las combinaciones posibles de trabajadores con las tiendas que tenemos.
========================================
*/
SELECT  	sf."first_name"	AS "nombre_empleado",					-- Esta consulta selecciona las columnas que contienen el nombre de empleado de la tabla "staff",
			sf."last_name"	AS "apellido_empleado",						-- el apellido de empleado de la tabla "staff",
			sf."staff_id"	AS "id_empleado",							-- el identificador de empleado de la tabla "staff"
			sr."store_id"	AS "id_tienda"								-- y el identificador de tienda de la tabla "store"
FROM 		"staff"		AS sf   									-- Se trabaja con la tabla que resulta de combinar cada fila da la tabla "staff"
CROSS JOIN 	"store"		AS sr;											-- con cada fila de la tabla "store".


/*
========================================
CONSULTA 64

Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas
========================================
*/
SELECT 		c."customer_id"			AS "identificador_cliente", 	-- Esta consulta selecciona las columnas que contienen el identificador de cliente de la tabla "customer",
			c."first_name" 			AS "nombre_cliente",				-- el nombre de cliente de la tabla "customer",
			c."last_name" 			AS "apellido_cliente",				-- el apellido de cliente de la tabla "customer"
			COUNT (r."rental_id") 	AS "cantidad_alquileres"			-- y calcula el número de alquileres que realiza cada cliente.
FROM 		"customer" 	AS c										-- Se trabaja con la tabla que resulta de considerar la tabla "customer" al completo (para que aparezcan todos los clientes)
LEFT JOIN	"rental" 	AS r											-- más la interesección con la tabla "rental"
	ON		c."customer_id" = r."customer_id"							-- relacionando la columna "customer_id" de la tabla "customer" y la columna "customer_id" de la tabla "rental".
GROUP BY	c."customer_id"											-- Se agrupan los datos por cliente (utilizando su id)
ORDER BY	c."customer_id";										-- y se ordenan los resultados por id de cliente de forma ascendente.

