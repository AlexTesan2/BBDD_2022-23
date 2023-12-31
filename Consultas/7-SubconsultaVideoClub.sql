/*36. Selecciona el Titulo y el Precio de las películas cuyo precio supere al precio medio de
todas las películas.*/


		SELECT p.TITULO , p.PRECIO 
		FROM Peliculas p 
		WHERE p.PRECIO >
			(
				SELECT AVG(p2.PRECIO) 
				FROM Peliculas p2 
			);

		
		
-- 37. Selecciona el Titulo de las películas que nunca han sido alquiladas.

		
		SELECT p.TITULO 
		FROM Peliculas p 
		WHERE p.CODIGOPELICULA NOT IN
			(
				SELECT a.CODIGOPELICULA 
				FROM Alquileres a 
			);
		
		

-- 38. Selecciona el Titulo de aquellas películas que superen el precio mas bajo de las películas del género Terror

		
		SELECT p.TITULO , p.PRECIO , g.NOMBREGENERO 
		FROM Peliculas p , Generos g 
		WHERE p.GENERO = g.CODIGOGENERO 
			AND p.PRECIO > 
			(
				SELECT MIN(p2.PRECIO) 
				FROM Peliculas p2 , Generos g2 
				WHERE p2.GENERO = g2.CODIGOGENERO AND g2.NOMBREGENERO = 'Terror'
			);
		
		
		-- Esto demuestra que no hay peliculas del genero terror
				SELECT COUNT(p.CODIGOPELICULA) 
				FROM Peliculas p , Generos g 
				WHERE p.GENERO = g.CODIGOGENERO AND g.NOMBREGENERO = 'Terror';
				
		
			
/*39. Seleccionar el Titulo de las películas que tengan como inicial una letra diferente a las
iniciales de las películas del género comedia.*/

		
		SELECT p.TITULO 
		FROM Peliculas p 
		WHERE LEFT (p.TITULO,1) NOT IN 
			(
				SELECT LEFT (p.TITULO, 1)
				FROM Peliculas p, Generos g 
				WHERE p.GENERO = g.CODIGOGENERO 
					AND g.NOMBREGENERO = 'Comedia'
			);
		


/*40. Seleccionar el Título de las películas que contengan las letras ‘el’ o que hayan sido
alquiladas por personas cuyo nombre contenga las letras ‘el’*/
		
		
		SELECT p.TITULO 
		FROM Peliculas p 
		WHERE p.TITULO LIKE '%el%' OR p.CODIGOPELICULA IN
			(
				SELECT a.CODIGOPELICULA 
				FROM Alquileres a , Clientes c 
				WHERE a.CODIGOCLIENTE = c.CODIGOCLIENTE 
					AND c.NOMBRECLIENTE LIKE '%el%'
			);
		
		
		
		
		
		
		
		
		
		
		
		
		
		