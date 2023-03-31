//  Naim Towfighian
// 28-marzo-2023
    
//  Nodos
() (variable:Label)

(p:Product) (cliente:Customer)  (c:Cliente)

// Relaciones
--> -[]-> <-[]- <--

// Propiedades
{}

{nombre:"Juan"}

(p:Producto{desc:"Lápiz"}) <-[:COMPRÓ]-(c:Cliente{nombre:"Juan"})


// creado por arrows
CREATE (n2:Producto {`Descripción`: "Reloj"})<-[:BUSCÓ]-(:Cliente {nombre: "Juan"})-[:BUSCÓ]->(:Producto {`Descripción`: "Celular"})-[:ES_PARTE_DE]->(n3:`Categoría` {nombre: "Electrónicos"})<-[:ES_PARTE_DE]-(n2),
(:Producto {`Descripción`: "Protector", Cantidad: 800})<-[:COMPRÓ]-(:Cliente {nombre: "Luisa"})-[:COMPRÓ]->(:Producto {`Descripción`: "Audífonos"})-[:ES_PARTE_DE]->(n3)

call db.schema.visualization
MATCH (n) RETURN n