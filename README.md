**URL**: [https://joseluis-m.github.io/lenguajes-de-marcas/](https://joseluis-m.github.io/lenguajes-de-marcas/)

# 1. Características y clasificación de los lenguajes de marcas[^1]

## 1.1 ¿Qué es un lenguaje de marcas?

Un lenguaje de marcado o marcas es un sistema de **representación de información mediante etiquetas** (marcas) incrustadas en el contenido. Estas etiquetas delimitan bloques de datos y aportan significado o formato. A diferencia de un lenguaje de programación, un lenguaje de marcas **no contiene lógica de procesamiento**, sino que estructura y describe datos para que otros programas (navegadores, procesadores) los interpreten. Por ejemplo, en HTML una etiqueta ``<p>`` indica el inicio de un párrafo de texto, y ``</p>`` su final; el navegador al leer esto sabrá que ese texto va separado como párrafo.

## 1.2 Ventajas de los lenguajes de marcas
Al estructurar la información con etiquetas, logramos organizar mejor los datos y describir su significado. Esto aporta múltiples beneficios en el *tratamiento de la información*: sabemos qué tipo de datos contiene cada parte, podemos darle formato o énfasis fácilmente, y podemos procesar o extraer información de forma automatizada. Si los datos estuvieran en texto plano sin estructura, cualquier búsqueda o procesamiento sería mucho más complejo (a veces requeriría técnicas avanzadas de análisis de texto). En cambio, con un buen marcado es posible, por ejemplo, que diferentes aplicaciones intercambien información de forma consistente y que un programa (*parser*) lea los datos sin ambigüedades. Por tanto, un lenguaje de marcas proporciona **estructura, significado y formato**, facilitando la interoperabilidad y la presentación adecuada de la información.

## 1.3 Tipos de lenguajes de marcas

Podemos clasificar los lenguajes de marcado según su **finalidad principal**:

- **Lenguajes de marcas de presentación**: Sus etiquetas definen *formato visual* (apariencia) del texto, a menudo de forma interna y transparente para el usuario final. Un ejemplo son los formatos de documentos de texto como **Microsoft Word (DOCX)** u **OpenDocument (ODT)**, donde el contenido que vemos con cierto estilo tiene por detrás un marcado XML que indica atributos como fuente, tamaño, negrita, alineación, etc. En entornos WYSIWYG (“lo que ves es lo que obtienes”) el usuario no ve el código de marcado, pero éste existe y define la presentación del documento.

- **Lenguajes de marcas procedimentales**: Sus marcas son *instrucciones* para que un procesador las ejecute, generalmente mezcladas con el contenido. En vez de describir qué es un texto, le dicen al sistema qué hacer con él. Ejemplos clásicos son **PostScript** (utilizado en impresoras) o **TeX/LaTeX** en su faceta de tipografía: las marcas (como comandos de LaTeX) indican acciones de formateo o layout al compilador de documentos.

- **Lenguajes de marcas descriptivos**: Sus etiquetas **describen la estructura o significado semántico** del contenido, en lugar de su apariencia. Se centran en la organización lógica de la información. Ejemplos: **HTML**, **XML** o **LaTeX** (que además de instrucciones tipográficas, permite marcar secciones, citas, referencias, etc., dotando de significado al documento). En HTML, por ejemplo, `<h1>` indica un título de primer nivel (semánticamente, un encabezado importante), `<p>` un párrafo de texto normal, `<em>` texto enfatizado, etc. Estas etiquetas no dicen *cómo* se verán (eso lo decide después el navegador o CSS), sino *qué* son esos fragmentos de contenido.

Otra clasificación útil es distinguir lenguajes de **propósito general vs. específico**. Algunos lenguajes de marcas son **generales** o **meta-lenguajes**, pensados para definir muchos tipos distintos de documentos:

- **SGML** (Standard Generalized Markup Language) es el estándar original del que derivan HTML y XML, y es un lenguaje de marcas de propósito general que permite definir *dialectos* de marcado a medida.  
- **XML** (eXtensible Markup Language) se deriva de SGML como una versión simplificada y se ha convertido en el lenguaje de marcas general más usado: es extensible, no tiene un vocabulario fijo, sino que cada organización puede crear sus propias etiquetas según sus necesidades.

Esto ha dado lugar a lenguajes específicos **basados en XML**: por ejemplo, **SVG** (gráficos vectoriales), **MathML** (notación matemática), **RSS/Atom** (sindicación de noticias), **XHTML** (versión de HTML conforme a XML), etc. Por otro lado, lenguajes como **HTML** o **MathML** en sí mismos tienen un propósito específico (describir páginas web, fórmulas matemáticas, respectivamente) y un conjunto predefinido de etiquetas.

## 1.4 Generalizando

Los lenguajes de marcas, gracias a su capacidad de estructurar información, tienen aplicaciones en multitud de ámbitos: documentos web, configuración de sistemas (muchos ficheros de configuración usan XML), intercambio de datos entre aplicaciones, representación de datos complejos (ej. documentos electrónicos, facturas en XML, etc.), almacenamiento de información semiestructurada en bases de datos XML, etc. A su vez, existe la necesidad de contar con **lenguajes de propósito general** para unificar criterios: por ejemplo, XML surge de la necesidad de un formato estándar y extensible que pueda ser leído en cualquier plataforma y adaptado a cualquier tipo de datos (es decir, un *metalenguaje* para diseñar otros lenguajes de marcado). En los siguientes pasos profundizaremos en XML y HTML como ejemplos prácticos.

# 2. Creación y análisis de un documento XML[^2]

En este paso crearemos manualmente un pequeño documento XML y analizaremos su estructura y sintaxis, asegurándonos de que cumpla las reglas de un XML *bien formado*.

## 2.1. Crear un fragmento XML

Abre Visual Studio Code (u otro editor de texto) y crea un nuevo archivo. Guárdalo con el nombre `ejemplo.xml` en la carpeta de la práctica. A continuación, escribe el siguiente contenido XML (puedes cambiar el contenido textual por el que prefieras, pero mantén la estructura de etiquetas):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<biblioteca>
  <libro isbn="9788491049183">
    <titulo>El ingenioso hidalgo Don Quijote de la Mancha</titulo>
    <autor>Miguel de Cervantes</autor>
  </libro>
  <libro isbn="9780141182537">
    <titulo>Cien años de soledad</titulo>
    <autor>Gabriel García Márquez</autor>
  </libro>
</biblioteca>
```

En este ejemplo, hemos creado un documento XML que representa una pequeña biblioteca con dos libros. Analicemos su estructura:

- La primera línea `<?xml version="1.0" encoding="UTF-8"?>` es la **declaración XML** (opcional pero recomendada). Indica la versión de XML y la codificación de caracteres del archivo.  
- `<biblioteca>` es el **elemento raíz** o principal que engloba todo el contenido (en XML _siempre debe haber un único elemento raíz_ que contenga a los demás). En este caso representa la colección de libros.  
- Cada `<libro>` es un **elemento hijo** de `biblioteca`. Posee un **atributo** `isbn` que aporta información adicional (el ISBN del libro) y contiene a su vez dos elementos hijos: `<titulo>` y `<autor>`, que describen el título y el autor del libro.  
- Observa cómo las etiquetas se **anidan** jerárquicamente formando una estructura de árbol:
  ```text
  biblioteca  
  └─ libro (isbn=…)  
     ├─ titulo  
     └─ autor
  ```
  También fíjate en que **toda etiqueta de apertura tiene su etiqueta de cierre correspondiente** (`</libro>`, `</titulo>`, etc.), respetando el orden de anidamiento (primero se cierra lo último que se abrió).

Guarda el archivo y asegúrate de que la extensión es `.xml`. VS Code debería resaltar la sintaxis; si hay algún error de escritura (por ejemplo, olvidaste cerrar una etiqueta), es posible que el editor te lo indique subrayando en rojo o mostrando un aviso.  

## 2.2 Verificar documento bien formado

Para confirmar que tu XML está **bien formado**, ábrelo en un navegador web. Puedes hacerlo haciendo doble clic en el archivo (lo más probable es que el navegador predeterminado muestre el contenido) o arrastrando el archivo a una ventana del navegador.

- Si el XML está correcto, en el navegador debería verse una estructura con los datos (dependiendo del navegador, puede mostrarse con indentación e incluso con elementos desplegables). Por ejemplo, es posible que veas algo como ``biblioteca [+–]`` que al expandir muestra los libros, etc., o simplemente el texto de los títulos y autores sin estilo. El formato exacto no importa, lo importante es que **no aparezcan errores**.

- Si hay un error sintáctico en tu XML, la mayoría de navegadores mostrarán un mensaje de error indicando la línea donde ocurrió el problema y no mostrarán el contenido. Por ejemplo, podrías ver algo como:

  > “XML error: mismatched tag at line X”

  si dejaste una etiqueta sin cerrar.

> **Prueba:**  
> Intencionalmente, edita tu archivo `ejemplo.xml` y quita la etiqueta de cierre de `<autor>` (por ejemplo, borra `</autor>` del segundo libro). Guarda y vuelve a abrir en el navegador. Deberías obtener un error de XML. Luego deshaz el cambio o vuelve a colocar la etiqueta correcta y verifica que el error desaparece. Esta prueba te ayuda a comprender la importancia de escribir XML bien formado: a diferencia de HTML, los parsers XML **no toleran errores** en la sintaxis y rechazan documentos mal formados.

En resumen, un documento XML *bien formado* debe cumplir una serie de reglas estrictas de sintaxis: todas las etiquetas deben estar correctamente anidadas y balanceadas (cada apertura con su cierre), los atributos deben llevar comillas, no se pueden tener caracteres especiales sin caracteres de escape (como `<` o `&` dentro del texto), etc. Gracias a esta precisión, cualquier procesador XML podrá leer el documento de forma consistente.

## 2.3. Comentarios sobre XML

Observa que XML, a diferencia de HTML, **no predefine el significado de las etiquetas**. En nuestro ejemplo, `<biblioteca>` y `<libro>` son etiquetas inventadas por nosotros; XML nos permite eso. Podemos elegir nombres significativos para nuestros datos. Otro podría usar `<catalogo>` y `<item>` para algo parecido. Lo importante es que respetemos las reglas sintácticas y acordemos el vocabulario si queremos compartir el XML con otros.

También notemos que XML es **sensible a mayúsculas/minúsculas**: `<Libro>` con L mayúscula sería considerado diferente de `<libro>`. Por convención, solemos usar minúsculas en los nombres de etiquetas y atributos.

## 2.4. Espacios de nombres (namespaces) en XML

En documentos XML más complejos, a veces combinamos etiquetas de diferentes procedencias. Por ejemplo, podríamos tener un XML que incluya fragmentos en XHTML (otro lenguaje de marcas) dentro de nuestros datos. ¿Qué ocurre si dos vocabularios distintos usan el mismo nombre de etiqueta para cosas distintas? Para eso existe el concepto de **espacios de nombres**. Un *namespace* es básicamente un identificador único (generalmente una URI) que asociamos a un prefijo, y luego ese prefijo se añade a las etiquetas de ese vocabulario. De esta forma evitamos colisiones de nombres: dos elementos pueden llamarse `<titulo>`, pero si uno tiene prefijo `bib:` y otro `html:`, el software sabrá diferenciarlos como cosas separadas. En palabras sencillas:

> “Los espacios de nombres en XML se utilizan para evitar conflictos de nombres entre elementos y atributos; permiten asignar un identificador único a cada elemento incluso si tienen el mismo nombre pero pertenecen a diferentes vocabularios.”

En nuestro nivel, no profundizaremos más con namespaces, pero es bueno reconocer un ejemplo de sintaxis: para declarar un espacio de nombres se añade un atributo especial `xmlns`. Por ejemplo, podríamos modificar la etiqueta raíz de nuestro XML así:

```xml
<biblioteca xmlns:xhtml="http://www.w3.org/1999/xhtml">
  <!-- … -->
  <xhtml:p>Nota: Este es un párrafo en XHTML dentro del XML.</xhtml:p>
</biblioteca>
```

Aquí hemos declarado el prefijo `xhtml` asociado al namespace de XHTML, y luego usamos `<xhtml:p>` para insertar un párrafo XHTML. Esto sería útil si quisiéramos incluir contenido HTML dentro de nuestro XML de biblioteca. Gracias al prefijo, `biblioteca->libro->titulo` etc. siguen siendo nuestros elementos, y cualquier elemento con `xhtml:` claramente pertenece a otro vocabulario. En esta práctica no necesitaremos hacer esto en profundidad, pero **comprender que los namespaces permiten la modularidad y combinación de datos XML de distintos dominios es parte de los fundamentos de XML** (¡y uno de sus grandes poderes y ventajas!).

Tras este paso, deberías sentirte cómodo creando un pequeño XML bien formado. **Hemos cubierto conceptos clave de XML**: etiquetas, atributos, árbol jerárquico, importancia de estar bien formado y nociones de namespaces.

# 3. Estructura de un documento HTML (página web básica)[^3]

Ahora pasamos al ámbito de la Web con **HTML**, el lenguaje de marcas para *hipertexto*. Crearemos una página web sencilla y entenderemos la estructura básica que todo documento HTML debe tener. Usaremos HTML5 (la versión actual, muy extendida) y editaremos el código en Visual Studio Code.

### 3.1. Crear el archivo HTML  
En VS Code, crea un nuevo archivo llamado `index.html` en la carpeta de la práctica. Comienza escribiendo el siguiente esqueleto mínimo de HTML:

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Mi Página de Prueba</title>
</head>
<body>
  <h1>Título de la página</h1>
  <p>Este es un párrafo de ejemplo en HTML.</p>
</body>
</html>
```

Guarda los cambios. Veamos la estructura en detalle:

- La línea `<!DOCTYPE html>` indica al navegador el **tipo de documento**. Esta declaración define que el documento sigue el estándar HTML5 (antiguamente, otras versiones de HTML/XHTML tenían doctypes más largos; HTML5 simplifica esto con una sola palabra clave).

- La etiqueta raíz `<html>` engloba todo el contenido HTML. Aquí le pusimos un atributo `lang="es"` para indicar que el contenido está en español (esto ayuda a navegadores y motores de búsqueda a saber el idioma).

- Dentro de `<html>` hay dos secciones principales: **head** y **body**.
  - `<head>` contiene **metadatos** y configuraciones de la página que no se muestran directamente en el contenido principal, pero sí son importantes. Por ejemplo, `<meta charset="UTF-8" />` define la codificación de caracteres (UTF-8 cubre español y casi todos los idiomas, evitando problemas con tildes, eñes, etc.). La etiqueta `<title>` define el título de la página, que usualmente vemos en la pestaña del navegador o en favoritos.
  - `<body>` contiene el **contenido visible** de la página, que el usuario verá en la ventana del navegador. En nuestro ejemplo, en body tenemos un encabezado `<h1>` y un párrafo `<p>`.  

## 3.2. Guardar y visualizar la página

Abre el archivo `index.html` en un navegador web (igual que hicimos con el XML, puedes hacer doble clic en el archivo o usar la opción “Open with Live Server” en VS Code si tienes esa extensión). Deberías ver algo muy simple: un gran título que dice “Título de la página” y debajo un párrafo con el texto de ejemplo. El fondo seguramente es blanco y la tipografía por defecto del navegador, sin estilos especiales.

Si ves correctamente el título y el texto, ¡enhorabuena! Has creado tu primera página HTML básica. Observa que el **título** que pusimos en `<title>` aparecerá en la pestaña del navegador (por ejemplo, en Chrome verás “Mi Página de Prueba” en la pestaña). El contenido `<h1>` se muestra dentro de la página misma.

## 3.3. Añadir más contenido HTML

Vamos a ampliar un poco la página para practicar con algunas etiquetas HTML comunes. Edita el contenido dentro de `<body>` para que quede así (añadiremos una lista y un enlace):

```html
<body>
  <h1>Título de la página</h1>
  <p>Este es un párrafo de ejemplo en HTML.</p>

  <h2>Lista de recursos</h2>
  <p>A continuación, una lista de sitios de interés:</p>
  <ul>
    <li><a href="https://www.w3schools.com/" target="_blank">W3Schools</a></li>
    <li><a href="https://developer.mozilla.org/es/" target="_blank">MDN Web Docs</a></li>
    <li><a href="https://validator.w3.org/" target="_blank">W3C Markup Validator</a></li>
  </ul>
</body>
```

Hemos introducido algunas etiquetas nuevas:

- `<h2>` es otro nivel de encabezado (un subtítulo, de nivel 2, menor jerarquía que `<h1>`). En HTML existen `<h1>` hasta `<h6>`, siendo h1 el más importante. Aquí “Lista de recursos” es un subtítulo para la sección de la lista.
- Hemos agregado otro `<p>` para introducir la lista.
- `<ul>` define una **lista sin ordenar** (unordered list, con viñetas). Dentro de `<ul>`, cada `<li>` es un elemento de lista (list item). Listamos tres sitios web de ejemplo.
- `<a>` define un **hipervínculo** (enlace). El atributo `href` indica la URL a la que apunta. En cada `<li>` usamos un `<a>` para que se pueda hacer click en el nombre del recurso y lleve al sitio correspondiente. También usamos `target="_blank"` para que, si se hace click, se abra en una pestaña nueva del navegador (así no perdemos nuestra página abierta).

Guarda los cambios y **recarga la página** en el navegador. Ahora deberías ver bajo el párrafo una lista con viñetas, donde cada ítem es un enlace azul subrayado (por defecto). Puedes probar a hacer click en ellos para verificar que funcionan (se abrirán las páginas de W3Schools, MDN, etc., en una nueva pestaña).  

## 3.4. Entendiendo la estructura HTML

Con este contenido, podemos identificar claramente la estructura: nuestra página tiene un título principal (`<h1>`), un subtítulo (`<h2>`), varios párrafos y una lista de enlaces. A nivel de código, todo está correctamente anidado dentro del `<body>`, y tenemos la sección `<head>` separada con la configuración y título. Esta separación de `<head>` vs. `<body>` es fundamental: **head** es para información sobre la página (título, metadatos, referencias a CSS o scripts, etc.), **body** es el contenido que se ve. Asegúrate siempre de incluir ambos en tus páginas HTML.

> **Nota:** HTML5 es bastante permisivo comparado con XML; los navegadores suelen intentar mostrar la página aunque falte cerrar alguna etiqueta. **¡Pero no nos confiemos!** Es buena práctica escribir HTML **válido y bien formado** (aunque estrictamente "bien formado" es término de XML, aplica la idea de que nuestras etiquetas abran y cierren correctamente). Por ejemplo, en HTML podríamos omitir cerrar `</li>` o `</p>` y muchos navegadores lo deducirían, pero es mejor incluirlos para evitar comportamientos inesperados y para acercarnos a XHTML (que sí exigiría todos los cierres). En nuestro ejemplo hemos cerrado todas las etiquetas por buena costumbre.

Hasta aquí, hemos identificado las etiquetas HTML principales de una página y sus atributos básicos (enlaces con href, etc.). También hemos usado Visual Studio Code como *herramienta de desarrollo* para editar la página, cumpliendo con la necesidad de utilizar un entorno adecuado. VS Code ofrece coloreado de sintaxis, autocompletado (si comienzas a escribir `</` te sugiere la etiqueta a cerrar, etc.), y con extensiones puedes validar o previsualizar HTML fácilmente.

Antes de continuar, **guarda y verifica** que tu `index.html` se ve correctamente en el navegador con todo el contenido agregado.  

# 4. Diferencias entre HTML y XHTML[^4]

Llegados a este punto, es importante comprender la relación y diferencias entre **HTML** y **XHTML**, ya que a menudo se mencionan ambos. XHTML no es más que HTML escrito con las normas de XML (*eXtensible HTML*). En la práctica, XHTML 1.0 fue una reformulación de HTML 4.01 bajo la sintaxis estricta de XML. ¿Qué implica esto? Veamos las principales diferencias y su importancia:

- **Sintaxis más estricta**: Como XML requiere estar bien formado, XHTML también. Todas las etiquetas deben cerrarse correctamente. En HTML, por ejemplo, `<br>` (salto de línea) o `<img>` pueden no tener cierre; en XHTML deben cerrarse como `<br />` o `<img ... />`. Lo mismo con `<meta>` o `<hr>` (añadiendo `/>` al final).

- **Minúsculas y mayúsculas**: En XHTML todos los nombres de etiquetas y atributos van en minúsculas obligatoriamente (porque XML es case-sensitive). En HTML no es obligatorio; uno puede escribir `<H1>` o `<h1>` y funcionará igual, pero en XHTML `<H1>` sería inválido. En general, ya escribimos en minúsculas por convención.

- **Atributos siempre con valor**: En HTML a veces existen atributos booleanos que podían escribirse sin valor (ejemplo clásico: `required` en HTML5, o `checked` en un checkbox). En XHTML, si usas un atributo, debes asignarle un valor, p. ej. `checked="checked"`.

- **Documento bien formado**: XHTML requiere que el documento sea XML válido. Si envías una página XHTML real (con tipo MIME `application/xhtml+xml`) y hay un error de sintaxis, el navegador la rechazará y no mostrará nada. En cambio, con HTML tradicional (tipo MIME `text/html`), los navegadores tienden a ser tolerantes e intentar corregir o interpretar el código aunque tenga errores. Esto quiere decir que XHTML te “obliga” a hacerlo bien, lo cual puede ser beneficioso para mantener estándares, pero también puede resultar menos perdonador ante despistes.

- **Comentarios, entidades, etc.**: En XHTML aplican las mismas normas de escribir entidades (por ejemplo, `&lt;` en lugar de `<`, si fuera necesario) que en XML, mientras que en HTML algunas cosas se toleran.

En resumen, **XHTML es más estricto y uniforme**, mientras que **HTML** (especialmente en sus versiones previas a HTML 5) era más laxo. De hecho, HTML5 adoptó una postura híbrida: su sintaxis de base es tolerante, pero recomienda seguir buenas prácticas. Hoy día podemos escribir HTML5 _“bien formado”_ fácilmente (como lo hemos venido haciendo) y obtener lo mejor de ambos mundos.

## 4.1 Utilidad de XHTML en sistemas de información

Quizás te preguntes: si HTML5 es flexible y está muy extendido, *¿por qué me interesaría XHTML?* La respuesta es que al ser básicamente XML, **XHTML se integra fácilmente con otras herramientas de procesamiento de datos**. Por ejemplo, se puede almacenar directamente en bases de datos orientadas a XML, aplicar transformaciones XSLT para convertir documentos, o mezclar contenido XHTML dentro de otros XML (como vimos con namespaces).  

En sistemas de gestión de información grandes, tener documentos XHTML garantiza una estructura consistente y la posibilidad de usar todo el ecosistema de tecnologías XML con nuestras páginas (validación con XSD/DTD, procesado con parsers estándar, etc.). En pocas palabras, XHTML combina la semántica de HTML con la robustez de XML. No es que HTML5 no pueda ser riguroso, pero XHTML formaliza ese rigor.

Con esto, hemos contrastado **HTML vs. XHTML**. Lo esencial a recordar: XHTML es HTML con las normas XML. Para propósitos de esta práctica, nos quedamos con nuestro documento HTML5, asegurándonos de que sigue **buenas prácticas** (lo que hemos hecho ya cumple casi todas las normas XHTML excepto minúsculas que ya usamos y cierres que también, así que nuestro HTML es casi XHTML válido).  

# Paso 5: Aplicación de hojas de estilo CSS[^5]

Hasta ahora nuestra página HTML se ve bastante simple: texto negro sobre fondo blanco, tipografía básica. Vamos a mejorar su presentación utilizando **CSS** (Cascading Style Sheets), la tecnología estándar para dar estilo a las páginas web. Con CSS podremos cambiar colores, fuentes, distribución, etc., _separando la presentación del contenido_. Esto cumple el objetivo de tener un marcado HTML semántico (que solo estructura contenido) por un lado, y las reglas visuales por otro lado en las hojas de estilo, lo cual es una gran ventaja en desarrollo web moderno.

## 5.1 Crear el archivo CSS

En la misma carpeta, crea un archivo nuevo llamado `styles.css`. Aquí escribiremos reglas CSS que luego vincularemos a nuestro HTML. Escribe el siguiente contenido en `styles.css`:

```css
/* Estilos básicos para la página */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    color: #333333;
}

h1 {
    color: darkblue;
    text-align: center;
}

h2 {
    color: #555555;
}

p {
    line-height: 1.6;
}

ul {
    list-style-type: square;
}

a {
    text-decoration: none;
    color: darkblue;
}

a:hover {
    text-decoration: underline;
}
```

Guarda los cambios. ¿Qué hicimos aquí? Vamos por partes:

- Las reglas CSS siguen la sintaxis `selector { propiedad: valor; propiedad: valor; }`. Es decir, indicamos a qué elemento(s) HTML se aplica el estilo (selector) y luego entre llaves las propiedades CSS con sus valores.
- `body { ... }` aplica al elemento `<body>` de nuestra página. Cambiamos la fuente por Arial (o sans-serif genérico) y ponemos un color de fondo gris muy claro (`#f0f0f0`). También definimos un color de texto `#333333` (un gris oscuro) en lugar de negro puro, para una lectura más suave.
- `h1` centrado y color azul oscuro; `h2` en gris medio.
- `p` con `line-height: 1.6` para que los párrafos tengan interlineado amplio (160% del tamaño de texto) y se vean más claros.
- `ul { list-style-type: square; }` cambia las viñetas de la lista a cuadrados en lugar de los círculos predeterminados.
- `a { text-decoration: none; color: darkblue; }` quita el subrayado de los enlaces y los pone en azul oscuro (como el h1). Luego `a:hover { text-decoration: underline; }` significa que al pasar el ratón por encima de un enlace, aparezca subrayado (indicando interactividad). Hemos definido un efecto hover con CSS.


[^1]: Real Decreto 1629/2009, resultado de aprendizaje 1, criterios de evaluación: 1, 2, 3, 4, 5 (características y ventajas de lenguajes de marcas; clasificación por tipos y ámbitos; necesidad de un lenguaje de propósito general).

[^2]: Real Decreto 1629/2009, resultado de aprendizaje 1, criterios de evaluación: 6, 7, 8, 9 (características propias de XML; estructura y reglas sintácticas de un XML; importancia de documentos bien formados; ventaja de los espacios de nombres en XML).

[^3]: Real Decreto 1629/2009, resultado de aprendizaje 2, criterios de evaluación: 1, 2, 3, 6 (lenguajes de marcas web y sus versiones – introducción a HTML5; estructura de un documento HTML y sus secciones; etiquetas y atributos principales de HTML; uso de herramienta de edición VS Code en la creación de páginas).

[^4]: Real Decreto 1629/2009, resultado de aprendizaje 2, criterios de evaluación: 4, 5 (semejanzas y diferencias entre HTML y XHTML; utilidad de XHTML en sistemas de gestión de información).

[^5]: Real Decreto 1629/2009, resultado de aprendizaje 2, criterios de evaluación: 7, 8 (ventajas de utilizar hojas de estilo CSS; aplicación práctica de hojas de estilo en un documento web).
