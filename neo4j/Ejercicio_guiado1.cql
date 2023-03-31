//  CREATE crea nodos o relaciones
//Crea un nodo tipo “Estudiante”, sin atributos y muestra el resultado
CREATE (n:Estudiante)
RETURN n; 

// Crea un nodo tipo “Estudiante” con los atributos  IDE, Nombre, APP y muestra el resultado
CREATE (n: Estudiante {IDE:1, Nombre:"Juan", App:"Pérez"})
RETURN n;  

// Crea varios nodos tipo estudiante en la misma instrucción
CREATE
 (n: Estudiante {IDE:2, Nombre:"Jesús", App:"Ochoa"}),
(m: Estudiante {IDE:3, Nombre:"María", App:"Jiménez", Género: "F"})
RETURN n, m;  

//Crea los nodos Luis y Pedro, además de crear la relación con la etiqueta CONOCE entre Luis y Pedro. Al final regreso los nodos y la relación.
CREATE (n: Estudiante {IDE:4, Nombre:"Luis"}) -[r:CONOCE]-> (m: Estudiante {IDE:5, Nombre:"Pedro"})
RETURN n,r,m; 


// MATCH es similar al FROM
// Muestra todos los nodos que contengan la etiqueta estudiante
MATCH (n: Estudiante) 
RETURN n;    

// Muestra todos los nodos que contengan la etiqueta estudiante y además IDE=2
MATCH (n: Estudiante{IDE:2}) 
RETURN n;    



// MERGE es similar al CREATE, sin embargo, antes de crear un nuevo nodo o relación valida que exista.  En el ejemplo se muestra con MATCH

//Crea relaciones con nodos que ya existan
MATCH (n: Estudiante {IDE:1}), (m: Estudiante {IDE:5})
MERGE (n) -[r:CONOCE]->(m)
RETURN n,r,m; //Crea relación entre dos estudiantes existentes, si alguno no existiera no realiza la instrucción 

//Crea relaciones con nodos que ya existan
MATCH (n: Estudiante {IDE:1}), (m: Estudiante {IDE:10})
MERGE (n) -[r:CONOCE]->(m)
RETURN n,r,m; //Crea relación entre dos estudiantes existentes, como el estudiante con IDE=10 no existe, no realiza la instrucción

MATCH (n: Estudiante {IDE:1}), (m: Estudiante {IDE:4})
MERGE (n) -[r:CONOCE]->(m)
RETURN n,r,m;

MERGE (n: Estudiante {IDE:1, Género: "M"})
RETURN n; //Creará un nuevo nodo repitiendo los datos



// SET  para incluir atributos

MATCH (n: Estudiante {IDE:5})
SET n. Género= "M"
RETURN n; //Primero valida que el Estudiante con ID=5 exista, después añadirá el atributo Género

MATCH (n: Estudiante {IDE:5})
SET n. App= "López", n. Celular= 102030
RETURN n; 



// REMOVE para quitar atributos y/o etiquetas

MATCH (n: Estudiante {IDE:5})
REMOVE n. Celular
RETURN n; //Primero valida que el Estudiante con ID=5 exista, después Quita el atributo celular



//  DETACH DELETE para borrar nodos y/o relaciones

MATCH (n: Estudiante {IDE:4}) -[r] -> (m: Estudiante {IDE:5})
DETACH DELETE r; //borra las relaciones entre los estudiantes con IDE=4 e IDE=5

MATCH (n:Estudiante {IDE:1})
DETACH DELETE n; //Borra el nodo  con IDE=1

MATCH (n)
DETACH DELETE n;  //Borra todos los nodos y relaciones




// RETURN muestra nodos, relaciones, atributos, etc.
CREATE (n:Estudiante)
RETURN n; //Crea un nodo vacío con una etiqueta “Estudiante” y muestra el resultado

CREATE (n: Estudiante {IDE:1, Nombre:"Juan", App:"Pérez"})
RETURN n;  // Crea un nodo con una etiqueta “Estudiante”, valores IDE, Nombre, APP y muestra el resultado

CREATE (n: Estudiante {IDE:2, Nombre:"Jesús", App:"Ochoa"})
RETURN n;  

CREATE (n: Estudiante {IDE:3, Nombre:"María", App:"Jiménez", Género: "F"})
RETURN n;  

CREATE (n: Estudiante {IDE:4, Nombre:"Luis"}) -[r:CONOCE]-> (m: Estudiante {IDE:5, Nombre:"Pedro"})
RETURN n,r,m; //Crea los nodos Luis y Pedro, además de crear la relación con la etiqueta conoce entre Luis y Pedro
MATCH (e:Estudiante {Nombre:"Luis"}), (oe:Estudiante {Nombre:"Juan"})
MERGE (e)-[r:CONOCE]->(oe)
RETURN e,r, oe//Busca los nodos Luis y Juan y crea una relación CONOCE entre ellos

MATCH (e:Estudiante {Nombre:"Jesús"}), (oe:Estudiante {Nombre:"María"})
MERGE (e)-[r:CONOCE]->(oe)
RETURN e,r, oe//Busca los nodos Jesús y María y crea una relación CONOCE entre ellos



// 8. CALL muestra el schema de las etiquetas. Las etiquetas agrupan nodos y relaciones
 	
call db.schema.visualization




// 9 .COUNT cuenta elementos, similar a SQL

MATCH (n:Estudiante) 
RETURN COUNT(n); // cuenta los estudiantes (los nodos de la etiqueta)

MATCH (n:Estudiante) 
RETURN COUNT(n) AS NúmeroDeEstudiantes; // tal como en SQL puedes utilizar renombramiento para proyectar el nombre del campo en la pantalla



// ORDER BY ordena los elementos por uno o varios atributos, similar a SQL

MATCH (n: Estudiante)
RETURN n.IDE, n.Nombre, n.App 
ORDER BY n.Nombre DESC;  // Proyecta los atributos IDE, App y Nombre. Ordena descendentemente con relación al atributo Nombre

MATCH (n: Estudiante)
RETURN n.IDE, n.Nombre, n.App 
ORDER BY n.IDE DESC;  // Proyecta los atributos IDE, App y Nombre. Ordena descendentemente con relación al atributo IDE



// LIMIT limita el número de filas a mostrar, similar a MySQL o TOP + DESC MsSQL

MATCH (n: Estudiante)
RETURN n.IDE, n.Nombre, n.App 
ORDER BY n.IDE DESC
LIMIT 3;  // Proyecta los atributos IDE, App y Nombre. Ordena descendentemente con relación al atributo IDE. Solo muestra los primeros tres resultados



// SKIP muestra una lista saltando los N primeros renglones

MATCH (n: Estudiante)
RETURN n.IDE, n.Nombre, n.App 
ORDER BY n.Nombre DESC
SKIP 3;  // Proyecta los atributos IDE, App y Nombre. Ordena descendentemente con relación a Nombre. Salta los primeros tres primeros resultados





// WITH similar a SQL.  En el WITH puedes declarar variables y utilizarlas para ejecutar una parte de la consulta al igual que lo harías con HAVING en SQL

//Primero una consulta que regresa todos los estudiantes que tienen conocidos
MATCH (n:Estudiante)-[r:CONOCE]->(m:Estudiante)
RETURN  n.Nombre AS NombreEstudiante, count(r) as NumConocidos

//Después muestra solo los que tienen más de un conocido
MATCH (n:Estudiante)-[r:CONOCE]->(m:Estudiante)
WITH  n.Nombre AS NombreEstudiante, count(r) as NumConocidos
WHERE NumConocidos > 1
RETURN  NombreEstudiante, NumConocidos
//regresa el nombre de los estudiantes que tienen más de un conocido y el número de conocidos



// COLLECT muestra los resultados en una lista

MATCH (n: Estudiante)
RETURN COLLECT (n.Nombre); // Nombres en una lista
//¿Cuántos nombres hay en la lista?, ¿Cuántos nodos tipo estudiante hay?, ¿Por qué la diferencia?

MATCH (n:Estudiante)
RETURN COLLECT (ID(n)) AS arrayIDsNeo4j, COLLECT(n.Nombre) AS arrayNombreEstudiantes, COLLECT(n.IDE) AS arrayIDEsCreadosUsuario; 
// Tres listas, analiza los datos de cada una

// Revisa el mismo resultado sin una colección
MATCH (n:Estudiante)
RETURN ID(n) AS IDsNeo4j, n.Nombre AS NombreEstudiantes, n.IDE AS IDEsCreadosUsuario; 

//Borra el estudiante con ID=1
MATCH (n:Estudiante )
WHERE ID(n)=1
DELETE n;
//Crea un estudiante con tu nombre
CREATE (e:Estudiante {Nombre:'TuNombre'})

//Revisa todos los estudiantes
MATCH (n:Estudiante)
RETURN ID(n) AS IDsNeo4j, n.Nombre AS NombreEstudiantes, n.IDE AS IDEsCreadosUsuario; 



// SHORTESTPATH  muestra el camino más corto del nodo A al nodo E
//Crea los nodos
CREATE 
(n:EJEMPLO{name:"A"}),
 (m:EJEMPLO{name:"B"}),
 (o:EJEMPLO{name:"C"}),
 (p:EJEMPLO{name:"D"}),
(q:EJEMPLO{name:"E"}),
 (r:EJEMPLO{name:"F"}),
 (s:EJEMPLO{name:"G"});
//Crea las relaciones entre los nodos
	MATCH (n:EJEMPLO{name:"A"}), (m:EJEMPLO{name:"B"}) MERGE (n)-[r:CAMINO]->(m);
	MATCH (n:EJEMPLO{name:"B"}), (m:EJEMPLO{name:"C"}) MERGE (n)-[r:CAMINO]->(m);
MATCH (n:EJEMPLO{name:"C"}), (m:EJEMPLO{name:"G"}) MERGE (n)-[r:CAMINO]->(m);
MATCH (n:EJEMPLO{name:"A"}), (m:EJEMPLO{name:"D"}) MERGE (n)-[r:CAMINO]->(m);
MATCH (n:EJEMPLO{name:"D"}), (m:EJEMPLO{name:"C"}) MERGE (n)-[r:CAMINO]->(m);
MATCH (n:EJEMPLO{name:"D"}), (m:EJEMPLO{name:"F"}) MERGE (n)-[r:CAMINO]->(m);
MATCH (n:EJEMPLO{name:"C"}), (m:EJEMPLO{name:"E"}) MERGE (n)-[r:CAMINO]->(m);
//Añade el atributo peso con valor = 1 a todos los CAMINOS
MATCH (n:EJEMPLO) -[r:CAMINO]- (m:EJEMPLO) SET r.peso=1

// Ahora corre el algoritmo para sacar la ruta más corta entre el nodo A y el nodo E
MATCH (n: EJEMPLO{name:"A"}), (m:EJEMPLO{name:"E"}),
      path = shortestpath((n)-[:CAMINO*]-(m))
RETURN path
ORDER BY LENGTH(path) DESC
LIMIT 1      // Antes de ejecutar la consulta corre lo siguiente línea por línea y analiza lo que va ocurriendo




// FOREACH  marca todos los nodos de un camino. Por ejemplo del nodo A al nodo E

// FOREACH marca todos los nodos de un camino
MATCH p =(begin)-[*]->(END )
WHERE begin.name='A' AND END .name='E'
FOREACH (n IN nodes(p)| SET n.marked = TRUE )

// Ahora correo el algoritmo para ver la ruta marcada
MATCH (n: EJEMPLO{name:"A"}), (m:EJEMPLO{name:"E"}),
      path = shortestpath((n)-[:CAMINO*]-(m))	
RETURN path
ORDER BY LENGTH(path) DESC
LIMIT 1      
