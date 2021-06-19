--Consulta 1 - Total de casos por pais
SELECT Pais.nombre, SUM(Casos.new_cases) FROM Pais, Casos, Continente WHERE Pais.id_pais = Casos.id_pais 
AND Pais.id_continente = Continente.id_continente AND Continente.nombre != 'Nulo' GROUP BY Pais.nombre;
--Consulta 2 - Total de casos por mes en 2021, Guatemala
SELECT MONTH(Fecha.fecha) AS 'Mes', SUM(Casos.new_cases) AS 'Contagios', SUM(Muertes.new_deaths) AS 'Muertos',
SUM(Vacuna.new_vaccinations) AS 'Vacunados' FROM Fecha, Casos, Muertes, Vacuna, Pais WHERE
Pais.nombre = 'Guatemala' AND YEAR(Fecha.fecha) = 2021 AND Pais.id_pais = Casos.id_pais AND Casos.id_fecha = Fecha.id_fecha
AND Muertes.id_pais = Pais.id_pais AND Muertes.id_fecha = Fecha.id_fecha AND Vacuna.id_pais = Pais.id_pais
AND Vacuna.id_fecha = Fecha.id_fecha GROUP BY MONTH(Fecha.fecha);
--Consulta 3 - Total de casos por continente
SELECT Continente.nombre, SUM(Casos.new_cases) AS 'Total de casos' FROM Casos, Continente, Pais 
WHERE Casos.id_pais = Pais.id_pais AND Pais.id_continente = Continente.id_continente 
AND Continente.nombre != 'Nulo' GROUP BY Continente.nombre;
--Consulta X - Porcentaje de contagiados por pais, no viene en el enunciado creo jeje
SELECT Pais.nombre AS 'Pais', (SUM(Casos.new_cases)*100)/
CAST((SELECT SUM(Casos.new_cases) FROM Casos, Pais, Continente WHERE Casos.id_pais = Pais.id_pais AND 
Pais.id_continente = Continente.id_continente AND Continente.nombre != 'Nulo') AS DECIMAL)  AS 'Porcentaje' FROM Casos, Pais, Continente
WHERE Casos.id_pais = Pais.id_pais AND Pais.id_continente = Continente.id_continente AND Continente.nombre != 'Nulo' GROUP BY Pais.nombre;
--Consulta 4 - Promedio de contagiados por pais, por mes en 2021
SELECT Pais.nombre AS 'Pais', MONTH(Fecha.fecha) AS 'Mes',AVG(Casos.new_cases) AS 'Casos' FROM Casos, Fecha, Pais, Continente
WHERE Casos.id_pais = Pais.id_pais AND Casos.id_fecha = Fecha.id_fecha AND YEAR(Fecha.fecha) = 2021 
AND Pais.id_continente = Continente.id_continente AND Continente.nombre != 'Nulo' GROUP BY MONTH(Fecha.fecha), Pais.nombre;
--Consulta 5 - Top 10 paises con mas pruebas realizadas
SELECT TOP 10 Pais.nombre AS 'Pais', SUM(Test.new_tests) AS 'Pruebas' FROM Pais, Continente, Test WHERE
Pais.id_continente = Continente.id_continente AND Continente.nombre != 'Nulo' AND
Pais.id_pais = Test.id_pais GROUP BY Pais.nombre ORDER BY SUM(Test.new_tests) DESC;
--Consulta 6 - Top 10 paises con mayor numero de vacunados
SELECT TOP 10 Pais.nombre AS 'Pais', SUM(Vacuna.new_vaccinations) AS 'Vacunados' FROM Pais, Continente, Vacuna WHERE
Pais.id_continente = Continente.id_continente AND Continente.nombre != 'Nulo' AND
Pais.id_pais = Vacuna.id_pais GROUP BY Pais.nombre ORDER BY SUM(Vacuna.new_vaccinations) DESC;
--Consulta 7 - Top 10 paises con mas contagiados
SELECT TOP 10 Pais.nombre AS 'Pais', SUM(Casos.new_cases) AS 'Vacunados' FROM Pais, Continente, Casos WHERE
Pais.id_continente = Continente.id_continente AND Continente.nombre != 'Nulo' AND
Pais.id_pais = Casos.id_pais GROUP BY Pais.nombre ORDER BY SUM(Casos.new_cases) DESC;
--Consulta 8 - 
	--Creando el procedimiento
	CREATE PROCEDURE Consulta8 @cantidad1 INT, @cantidad2 INT
	AS
	IF @cantidad1 < @cantidad2
		BEGIN
			SELECT Pais.nombre AS 'Pais', SUM(Casos.new_cases) AS 'Casos' FROM Pais, Casos WHERE
			Pais.id_pais = Casos.id_pais GROUP BY Pais.nombre HAVING SUM(Casos.new_cases) BETWEEN @cantidad1 AND @cantidad2;
		END
	ELSE IF @cantidad2 < @cantidad1
		BEGIN
			SELECT Pais.nombre AS 'Pais', SUM(Casos.new_cases) AS 'Casos' FROM Pais, Casos WHERE
			Pais.id_pais = Casos.id_pais GROUP BY Pais.nombre HAVING SUM(Casos.new_cases) BETWEEN @cantidad2 AND @cantidad1;
		END
	--Llamando al procedimiento
	EXEC Consulta8 50000, 200000;
--Consulta 9 - En Guatemala mostrar: nuevos casos, nuevas pruebas realizadas nuevas muertes entre 01-01-2021 y 06-12-2021
SELECT Pais.nombre AS 'Pais', SUM(Casos.new_cases) AS 'Casos', SUM(Muertes.new_deaths) AS 'Muertes',
SUM(Vacuna.new_vaccinations) AS 'Vacunados' FROM Pais, Casos, Muertes, Vacuna, Fecha WHERE
Pais.nombre = 'Guatemala' AND Pais.id_pais = Casos.id_pais AND Casos.id_fecha = Fecha.id_fecha AND
Muertes.id_pais = Pais.id_pais AND Muertes.id_fecha = Fecha.id_fecha AND Vacuna.id_pais = Pais.id_pais AND
Vacuna.id_fecha = Fecha.id_fecha AND Fecha.fecha BETWEEN '2021-01-01' AND '2021-06-12' GROUP BY Pais.nombre;
--Consulta 10 - De mayor a menor, los contagios de paises latinoamericanos
SELECT Pais.nombre AS 'Pais', SUM(Casos.new_cases) AS 'Casos' FROM Pais, Casos, Fecha WHERE
(Pais.nombre = 'Argentina' OR Pais.nombre = 'Bolivia' OR Pais.nombre = 'Brazil' OR Pais.nombre = 'Chile' OR
Pais.nombre = 'Colombia' OR Pais.nombre = 'Costa Rica' OR Pais.nombre = 'Cuba' OR Pais.nombre = 'Ecuador' OR
Pais.nombre = 'El Salvador' OR Pais.nombre = 'Guatemala' OR Pais.nombre = 'Haiti' OR Pais.nombre = 'Honduras' OR
Pais.nombre = 'Mexico' OR Pais.nombre = 'Nicaragua' OR Pais.nombre = 'Panama' OR Pais.nombre = 'Paraguay' OR
Pais.nombre = 'Peru' OR Pais.nombre = 'Dominican Republic' OR Pais.nombre = 'Uruguay' OR Pais.nombre = 'Venezuela' OR
Pais.nombre = 'Guyana' OR Pais.nombre = 'Grenada' OR Pais.nombre = 'Jamaica' OR Pais.nombre = 'Suriname') AND
Casos.id_pais = Pais.id_pais AND Casos.id_fecha = Fecha.id_fecha AND Fecha.fecha BETWEEN '2021-01-01' AND '2021-06-12' 
GROUP BY Pais.nombre ORDER BY SUM(Casos.new_cases) DESC;
