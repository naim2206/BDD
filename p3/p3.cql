// 3.1. Una imagen del grafo completo 
MATCH (n)
OPTIONAL MATCH (n) – [r] – ()
RETURN n, r;

// 3.2. Los tipos de nodos 
call db.labels

// 3.3. Los tipos de relaciones 
call db.relationshipTypes

// 3.4. Los atributos de los nodos
call db.schema.nodeTypeProperties


// 3.5. Los atributos de las relaciones 
call db.schema.relTypeProperties


// 3.6. Una imagen del esquema general del grafo 
call db.schema.visualization


// 3.7. La imagen del grafo de uno de los dos almacenes y los artículos que están relacionados con él.
 MATCH (a:Almacen {Descripcion:"ESTE"})-[r:TIENE_ALMACEN]-(e:Entrada)-[r2:TIENE_DETALLE]-(ed:Entrada_d)-[r3:PARTE_DE_ENTRADA]-(n:Articulo) RETURN a, n;

// 3.8. La imagen del grafo de uno de los vendedores y los artículos que están relacionados con él.
	MATCH (p:Proveedor {Id_Proveedor:97})-[r:TIENE_PROVEEDOR]-(e:Entrada)-[r2:TIENE_DETALLE]-(ed:Entrada_d)-[r3:PARTE_DE_ENTRADA]-(n:Articulo) RETURN p, n;


// 3.9. La imagen del grafo de una unidad de medida y los artículos que están relacionados con él. 
	MATCH (a:Articulo)-[r:TIENE_UMD_DE]-(u:umd{id_umd:211}) return a, u;	

// 3.10. La imagen del grafo de una orden de salida u orden de entrada y los artículos que están relacionados con esta. 
MATCH (e:Entrada{Id_Entrada:366})-[r:TIENE_DETALLE]-(ed:Entrada_d)-[r2:PARTE_DE_ENTRADA]-(a:Articulo) return e, a;


// 4.1. Nombre de los clientes o proveedores, los colores base de artículos (como colección), el tipo de artículo (como colección), y el grupo de artículo (como colección). 
MATCH (p:Proveedor)-[r:TIENE_PROVEEDOR]-(e:Entrada)-[r2:TIENE_DETALLE]-(ed:Entrada_d)-[r3:PARTE_DE_ENTRADA]-(n:Articulo), (at:ArticuloTipo)-[]-(n)-[]-(ag:ArticuloGrupo) RETURN COLLECT(DISTINCT p.RazonSocial), COLLECT(DISTINCT at.descripcion), COLLECT(DISTINCT ag.descripcion), COLLECT(DISTINCT n.descripcion);


// 4.2. Nombre de los almacenes, los colores bases de artículos (como colección), el tipo de	artículo (como colección), y el grupo de artículo (como colección). 
MATCH (a:Almacen)-[r:TIENE_ALMACEN]-(e:Entrada)-[r2:TIENE_DETALLE]-(ed:Entrada_d)-[r3:PARTE_DE_ENTRADA]-(n:Articulo), (at:ArticuloTipo)-[]-(n)-[]-(ag:ArticuloGrupo) RETURN COLLECT(DISTINCT a.Descripcion), COLLECT(DISTINCT at.descripcion), COLLECT(DISTINCT ag.descripcion), COLLECT(DISTINCT n.descripcion);

// 4.3. La ruta más corta entre un artículo A y uno B. 
MATCH (a:Articulo{id_articulo: 3914}), (b: Articulo{id_articulo:3925}),
path = shortestpath((a)-[*]-(b))
RETURN path


// 4.4. La recomendación de artículos basada en la misma orden de salida u orden de entrada. Prueba con un artículo de tu elección. 
MATCH (a:Articulo)-[r]-(ed:Entrada_d)-[r2]-(e:Entrada)-[r3]-(ed2:Entrada_d)-[r4]-(a2:Articulo)WHERE a.descripcion = "BERALKID ESMALTE ALQUIDALICO AMARILLO CROMO 19LT"  RETURN a.descripcion, a2.descripcion, COUNT(e.Id_Entrada) as CuentaOrdenes
ORDER BY CuentaOrdenes DESC

// 4.5. La recomendación de artículos basada en el almacén. Prueba con un artículo de tu elección.
MATCH (a:Articulo)-[r]-(ed:Entrada_d)-[r2]-(e:Entrada)-[r3]-(al:Almacen)-[r4]-(e2:Entrada)-[r5]-(ed2:Entrada_d)-[r6]-(a2:Articulo)WHERE a.descripcion = "BERALKID ESMALTE ALQUIDALICO AMARILLO CROMO 19LT"  RETURN a.descripcion, a2.descripcion, COUNT(e.Id_Entrada) as CuentaOrdenes
ORDER BY CuentaOrdenes DESC

// 4.6. La recomendación de artículos basada en el código postal del cliente o proveedor. Prueba con un artículo de tu elección. 
MATCH (a:Articulo)-[r]-(ed:Entrada_d)-[r2]-(e:Entrada)-[r3]-(p:Proveedor),
(p2:Proveedor)-[r4]-(e2:Entrada)-[r5]-(ed2:Entrada_d)-[r6]-(a2:Articulo)
WHERE p.CodigoPostal = p2.CodigoPostal and a.descripcion = "BERALKID ESMALTE ALQUIDALICO AMARILLO CROMO 19LT"  RETURN a.descripcion, a2.descripcion, COUNT(e.Id_Entrada) as CuentaOrdenes
ORDER BY CuentaOrdenes DESC


// 4.7. La recomendación de artículos basada en el grupo. Prueba con un artículo de tu elección.
MATCH (ag:ArticuloGrupo)-[]-(a:Articulo)-[r]-(ed:Entrada_d)-[r2]-(e:Entrada)-[r3]-(ed2:Entrada_d)-[r4]-(a2:Articulo)-[]-(ag)
WHERE a.descripcion = "BERALKID ESMALTE ALQUIDALICO AMARILLO CROMO 19LT"  RETURN a.descripcion, a2.descripcion, COUNT(e.Id_Entrada) as CuentaOrdenes
ORDER BY CuentaOrdenes DESC

// 4.8. La recomendación de artículos basada en el tipo. Prueba con un artículo de tu elección. 
MATCH (at:ArticuloTipo)-[]-(a:Articulo)-[r]-(ed:Entrada_d)-[r2]-(e:Entrada)-[r3]-(ed2:Entrada_d)-[r4]-(a2:Articulo)-[]-(at)
WHERE a.descripcion = "BERALKID ESMALTE ALQUIDALICO AMARILLO CROMO 19LT"  RETURN a.descripcion, a2.descripcion, COUNT(e.Id_Entrada) as CuentaOrdenes
ORDER BY CuentaOrdenes DESC

// 4.9. La recomendación de artículos basada en la colonia del cliente o proveedor. Prueba con un artículo de tu elección. 
MATCH (a:Articulo)-[r]-(ed:Entrada_d)-[r2]-(e:Entrada)-[r3]-(p:Proveedor),
(p2:Proveedor)-[r4]-(e2:Entrada)-[r5]-(ed2:Entrada_d)-[r6]-(a2:Articulo)
WHERE p.Colonia = p2.Colonia and a.descripcion = "BERALKID ESMALTE ALQUIDALICO AMARILLO CROMO 19LT"  RETURN a.descripcion, a2.descripcion, COUNT(e.Id_Entrada) as CuentaOrdenes
ORDER BY CuentaOrdenes DESC

// 4.10. La recomendación de un artículo A basada en que dos artículos B y C que aparezcan en la misma orden de salida o, de entrada. Prueba con un artículo de tu elección. 
MATCH (a:Articulo)-[r]-(ed:Entrada_d)-[r2]-(e:Entrada)-[r3]-(ed2:Entrada_d)-[r4]-(a2:Articulo),
(e)-[]-(ed3:Entrada_d)-[]-(a3:Articulo)
WHERE a.descripcion = "BERALKID ESMALTE ALQUIDALICO AMARILLO CROMO 19LT"
AND a2.descripcion = "BROCHA BYP 6 (PROMOCION)"
RETURN a.descripcion, a2.descripcion, a3.descripcion, COUNT(e.Id_Entrada) as CuentaOrdenes
ORDER BY CuentaOrdenes DESC