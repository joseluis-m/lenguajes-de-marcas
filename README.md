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

## 3.1. Crear el archivo HTML  
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

## 5.2. Vincular CSS al HTML

Ahora debemos decirle a nuestro HTML que use estas reglas CSS. Para ello, abrimos `index.html` de nuevo y dentro del `<head>`, añadimos una línea de enlace CSS:

```html
<head>
  <meta charset="UTF-8" />
  <title>Mi Página de Prueba</title>
  <link rel="stylesheet" href="styles.css" />
</head>
```

La etiqueta `<link rel="stylesheet" href="styles.css" />` le indica al navegador que cargue el archivo externo `styles.css` y lo aplique a la página. El atributo `rel` especifica que es una hoja de estilo, y `href` la ruta del archivo CSS (asegúrate de que el nombre coincida exactamente con tu archivo). Guarda los cambios en `index.html`.  

## 5.3. Verificar estilos en el navegador

Recarga la página en el navegador. Deberías notar inmediatamente cambios visuales:

- El fondo de la página ahora es gris claro.  
- El texto ha cambiado de fuente (Arial o similar) y de color (gris oscuro).  
- El título `<h1>` está centrado y azul.  
- El subtítulo `<h2>` está gris tenue.  
- Los párrafos tienen más espacio entre líneas.  
- La lista muestra cuadrados en lugar de círculos.  
- Los enlaces aparecen sin subrayado normalmente, pero si pasas el cursor sobre ellos se subrayan y quizás cambian ligeramente de tono (depende del navegador, pero en principio les definimos subrayado on hover).

¡Tu página se ve mucho mejor! Y todo gracias a CSS, sin tocar el HTML del contenido. Si inspeccionas el HTML en el navegador (puedes hacer click derecho → “Inspeccionar” para ver el código y estilos), verás que el HTML sigue siendo solo estructura; la apariencia proviene de las reglas definidas en `styles.css`.

### Ventajas de CSS
Usar hojas de estilo externas tiene grandes beneficios:

- Podemos cambiar fácilmente la apariencia de *toda* la página (o incluso de muchas páginas) editando solo el archivo CSS, sin tener que modificar cada archivo HTML. Esto ahorra muchísimo tiempo y reduce errores.  
- Nuestro código HTML queda más limpio y enfocado en la estructura y contenido (por ejemplo, hemos evitado usar etiquetas obsoletas como `<font>` para color o atributos como `bgcolor`, que antes se usaban en HTML antiguo; ahora todo eso lo maneja CSS externamente). Como indica la literatura, *CSS permite separar el contenido HTML de su presentación visual, manteniendo el código HTML limpio y estructurado*.  
- Podemos reutilizar estilos: por ejemplo, definimos un estilo para `h1` y todos los `<h1>` de la página (o de cualquier página que enlace el CSS) automáticamente lo aplicarán.  
- La combinación de HTML + CSS mejora la **accesibilidad** y **mantenibilidad** del sitio. Incluso puedes tener distintas hojas de estilo para diferentes dispositivos (impresión, móviles, etc.) sin cambiar el HTML.  

## 5.4. Experimentos adicionales

Si deseas, juega un poco con el CSS para afianzar conocimientos. Por ejemplo, cambia el `background-color` a otro color, o agrega una regla para el elemento `li` (items de lista) para, digamos, ponerles margen inferior y que no queden tan juntos. También podrías probar a añadir en HTML un elemento nuevo, por ejemplo un `<div>` con algún contenido, y luego estilizar ese `div` con CSS. Recuerda que cada vez que cambies CSS, basta con recargar la página para ver el efecto (no olvides guardar el archivo CSS también).

Con esto, **hemos aplicado correctamente una hoja de estilo CSS** a nuestra página. Ahora tenemos una mini página web estructurada y con estilo.

# 6. Creación de un canal de sindicación[^6]

A continuación, crearás un **canal RSS 2.0** desde cero, añadiendo contenido de ejemplo y comprobando su correcto funcionamiento. Un *canal RSS* (Really Simple Syndication) es un documento XML especial que permite **difundir contenido actualizado** (noticias, entradas de blog, etc.) para que otros sitios o aplicaciones (llamados *agregadores* o *lectores RSS*) lo consuman automáticamente. Trabajaremos con RSS versión 2.0, uno de los formatos de sindicación más extendidos, pero ten en cuenta que existe otro estándar llamado *Atom* con propósitos similares.

_**Antes de empezar:**_ Asegúrate de tener a mano **Visual Studio Code**. Se recomienda instalar la extensión **XML (Language Support by Red Hat)** para disponer de coloreado de sintaxis XML, autocompletado básico y validación integrada. Esta extensión ayudará a identificar errores de sintaxis mientras editas el feed _(RA3.c y RA3.g: uso de herramientas específicas y tecnologías base de sindicación)._

Ahora sí, vamos con los pasos:

## 6.1. Crear el archivo XML para el feed
Abre VS Code y crea un fichero nuevo llamado `feed.xml`. Comienza escribiendo la **declaración XML** en la primera línea:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
```

 A continuación, añade el elemento raíz del feed RSS. En RSS 2.0, el elemento raíz es `<rss>` e incluye un atributo obligatorio `version="2.0"`. Dentro de `<rss>` irá todo el contenido del canal. Escribe la estructura básica de apertura y cierre:

 ```xml
 <rss version="2.0">
   <channel>
     <!-- Contenido del canal, irá aquí -->
   </channel>
 </rss>
 ```

   Guarda el archivo. De este modo ya tienes la estructura mínima: un elemento raíz `<rss>` y, dentro, un elemento `<channel>` que contendrá la información del canal y sus noticias (items). Este inicio corresponde a identificar la estructura base de un canal de contenidos (RA3.d) y a preparar la descripción de la información que se transmitirá (RA3.a).

## 6.2. Definir la información del canal (metadatos del RSS)

Dentro del elemento `<channel>`, agrega los elementos obligatorios que describen tu canal RSS: **título**, **enlace** y **descripción**. Estos tres elementos son requeridos por la especificación RSS 2.0 para identificar el canal:

- `<title>` – El nombre del canal (por ejemplo, el nombre de tu sitio o feed).  
- `<link>` – La URL web del sitio principal relacionado con el feed.  
- `<description>` – Una descripción breve del contenido del canal.

Por ejemplo, supongamos que estamos creando un RSS para las noticias de un sitio llamado “Mi Sitio de Noticias”. Rellena los campos así:

```xml
<rss version="2.0">
  <channel>
    <title>Mi Sitio de Noticias</title>
    <link>https://www.misitio.com/</link>
    <description>Últimas noticias y actualizaciones de Mi Sitio</description>
    <!-- Más elementos aquí -->
  </channel>
</rss>
```

Puedes añadir algunos metadatos adicionales recomendados para el canal, como:

```xml
<language>es-es</language>
<lastBuildDate>Tue, 13 May 2025 10:00:00 GMT</lastBuildDate>
<managingEditor>editor@misitio.com</managingEditor>
```

## 6.3. Añadir ítems al canal RSS
 
Ahora crearás las entradas de contenido (noticias, posts, etc.) dentro del canal. En RSS, cada entrada se representa con un elemento `<item>` dentro de `<channel>`. Cada `<item>` normalmente contiene al menos: un **título**, un **enlace** (URL específica de esa noticia o post) y/o una **descripción** breve. También se suele incluir la fecha de publicación (`<pubDate>`) y un identificador único (`<guid>`). Vamos a añadir dos ítems de ejemplo:

```xml
<!-- ... metadatos del canal ... -->
<item>
  <title>Nueva versión del sistema implementada</title>
  <link>https://www.misitio.com/noticias/version-nueva</link>
  <description>Hemos actualizado nuestros sistemas a la versión 2.0, mejora de rendimiento y seguridad.</description>
  <pubDate>Tue, 13 May 2025 09:30:00 GMT</pubDate>
  <guid>https://www.misitio.com/noticias/version-nueva</guid>
</item>
<item>
  <title>Mantenimiento programado este fin de semana</title>
  <link>https://www.misitio.com/noticias/mantenimiento</link>
  <description>Se realizará un mantenimiento de servidores el domingo por la mañana, puede haber cortes breves.</description>
  <pubDate>Tue, 13 May 2025 09:00:00 GMT</pubDate>
  <guid>https://www.misitio.com/noticias/mantenimiento</guid>
</item>
```

Aquí hemos agregado dos elementos `<item>` con información ficticia de ejemplo. Observa que cada `<guid>` hemos usado la URL de la noticia, pero podría ser otro identificador único. El `<guid>` ayuda a los agregadores a diferenciar una entrada de otra de forma única. Asegúrate que todos los elementos abren y cierran correctamente y están anidados dentro de `<channel>`.

Tras este paso, tu archivo `feed.xml` completo debería verse parecido a esto:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0">
    <channel>
        <title>Mi Sitio de Noticias</title>
        <link>https://www.misitio.com/</link>
        <description>Últimas noticias y actualizaciones de Mi Sitio</description>
        <language>es-es</language>
        <lastBuildDate>Tue, 13 May 2025 10:00:00 GMT</lastBuildDate>

        <item>
            <title>Nueva versión del sistema implementada</title>
            <link>https://www.misitio.com/noticias/version-nueva</link>
            <description>Hemos actualizado nuestros sistemas a la versión 2.0, mejorando el rendimiento.</description>
            <pubDate>Tue, 13 May 2025 09:30:00 GMT</pubDate>
            <guid>https://www.misitio.com/noticias/version-nueva</guid>
        </item>
        <item>
            <title>Mantenimiento programado este fin de semana</title>
            <link>https://www.misitio.com/noticias/mantenimiento</link>
            <description>Se realizará un mantenimiento de servidores el domingo por la madrugada.</description>
            <pubDate>Tue, 13 May 2025 09:00:00 GMT</pubDate>
            <guid>https://www.misitio.com/noticias/mantenimiento</guid>
        </item>
    </channel>
</rss>
```

En este punto has creado un canal de contenidos completo y definido su estructura con varios ítems, cumpliendo con los requisitos básicos del formato RSS 2.0. **Esto cubre los criterios RA3.d** (identificar estructura y sintaxis del canal), **RA3.e** (creación de canales de contenidos) y parte de **RA3.c** (tecnologías base de sindicación, ya que estás aplicando XML y RSS en la práctica).

## 6.4. Validar la sintaxis y estructura del feed RSS
Es fundamental comprobar que el feed es **válido y bien formado**, para asegurarnos de que los agregadores podrán leerlo sin problemas.

1. **Verifica errores de sintaxis XML:** Si tienes la extensión de XML en VS Code, deberías ver marcado cualquier error (por ejemplo, etiquetas no cerradas, formato de fecha mal escapado, caracteres no permitidos, etc.). Corrige cualquier error que aparezca.

2. **Valida con un servicio RSS:** Puedes usar herramientas en línea gratuitas como el **W3C Feed Validation Service** para comprobar tu feed. Abre la URL del validador `https://validator.w3.org/feed/` e ingresa tu feed. Si aún no tienes tu feed disponible en Internet con una URL pública, puedes copiar y pegar el contenido XML directamente en la opción “Validate by Direct Input”. El validador te indicará si tu RSS cumple con las reglas de la especificación y te avisará de cualquier problema.

3. **Otras opciones de validación:** Alternativamente, hay otros validadores como el de RSS Board o extensiones de navegador que validan feeds. Realiza esta comprobación y asegúrate de obtener un mensaje de “Valid RSS feed” o similar. Si hay errores (por ejemplo, campos obligatorios faltantes o fechas con formato incorrecto), vuelve al archivo `feed.xml` en VS Code, corrige los detalles y valida de nuevo hasta que esté correcto.

_Esta acción corresponde al criterio RA3.e: validar los canales de contenido creados, asegurando que siguen las reglas del formato. También se relaciona con RA3.d al reforzar que la sintaxis del canal es la adecuada._  

## 6.5. Probar el feed con un agregador RSS

Una vez que el canal RSS es válido, es hora de comprobar su funcionalidad y acceso en un entorno real, es decir, usar un lector o agregador de RSS como lo harían los usuarios finales. Para ello, necesitas que tu archivo `feed.xml` sea accesible vía una URL. 

- Si dispones de un servidor web local, coloca el archivo en un directorio público y anota la URL (por ejemplo `http://localhost/feed.xml`).  
- Si no, una forma sencilla es aprovechar GitHub: sube tu `feed.xml` a un repositorio público (en la rama principal) y usa el enlace bruto (raw) que provee GitHub para ese archivo como URL del feed, algo como  
 `https://raw.githubusercontent.com/tu-usuario/tu-repo/main/feed.xml`.

Luego, utiliza un agregador online para suscribirte a tu feed. Por ejemplo, en Feedly (un popular lector RSS online), añade un feed pegando la URL de tu `feed.xml`. Si todo va bien, el agregador detectará el canal y listará los ítems que creaste, mostrando el título del canal, los títulos de las noticias y sus descripciones. Prueba a hacer clic en los ítems para verificar que los enlaces funcionan (en nuestro ejemplo, serían URLs de ejemplo).

También puedes usar otras herramientas: clientes de correo como Thunderbird permiten suscribirse a feeds RSS, o extensiones de navegador como RSS Reader que agregan un icono RSS en la barra de direcciones. Cualquier herramienta de sindicación servirá para esta prueba. Lo importante es confirmar que:
- El agregador puede **acceder al feed** (es decir, la URL es alcanzable).  
- Reconoce correctamente el **título del canal** y la **descripción**.  
- Enumera los **ítems** con sus títulos y resúmenes.  
- No muestra **errores de parsing** ni contenido vacío.

Si la herramienta no reconoce el feed, repite el paso anterior de validación porque probablemente hay algún problema de formato. Una vez que consigas visualizar el feed en el agregador, habrás completado con éxito la creación y publicación de tu primer canal RSS.

> **Nota:** Si bien hemos usado RSS 2.0 en este ejercicio, recuerda que **Atom** es otra tecnología de sindicación (formato XML RFC 4287) con estructura algo distinta (usa `<feed>` en vez de `<rss>` y elementos estandarizados como `<entry>` para ítems). Las ventajas de sindicación (contenido actualizado automáticamente disponible) se aplican por igual a RSS y Atom. Conocer ambas tecnologías te da una perspectiva más amplia, pero la metodología de creación y validación es similar a lo practicado.  

# 7. Definición y uso de un esquema XML[^6]

Continuando con el punto anterior, trabajaremos con _esquemas XML_ que permiten definir la sintaxis y estructura válida de un tipo de documento XML. Un esquema actúa como “contrato”: especifica qué elementos pueden aparecer, en qué orden, qué atributos están permitidos, qué valores son válidos, etc. Esto ayuda a validar XML automáticamente y asegurar que la información cumpla ciertos requisitos formales. Existen principalmente dos formas tradicionales de definir esquemas en XML: la **DTD** (Document Type Definition), propia de la especificación XML 1.0, y los esquemas XML **XSD**, recomendación más reciente del W3C que es más potente y flexible. En esta práctica utilizaremos DTD por simplicidad, pero los pasos serían análogos usando XSD.

Supongamos un caso práctico: eres el administrador de sistemas y necesitas intercambiar información sobre el inventario de ordenadores de la empresa en formato XML. Para garantizar que todos los departamentos manejen la misma estructura de datos, vas a diseñar un esquema que defina cómo deben ser esos XML de inventario.

## 7.1. Diseñar la estructura de datos e identificar la necesidad de un esquema
Antes de escribir ninguna línea, define qué datos contendrá el documento XML y cómo se organizarán. En nuestro ejemplo de _inventario de ordenadores_, imaginemos que queremos listar cada ordenador con su `identificador`, `ubicación física`, `usuario` asignado y `sistema operativo` instalado. Podríamos estructurarlo así: un elemento raíz `<inventario>` que agrupa múltiples elementos `<ordenador>`, donde cada `<ordenador>` tiene un atributo `id` (código único del equipo) y contiene a su vez tres elementos hijos: `<ubicacion>`, `<usuario>` y `<sistemaOperativo>` con el detalle correspondiente.

Sin un esquema, podríamos escribir este XML libremente, pero no habría nada que asegure que todos los creadores de inventarios sigan la misma estructura (podrían omitir por error algún campo, cambiar un nombre de etiqueta, etc.). Aquí es donde vemos la **necesidad de describir formalmente la información transmitida por el documento XML y sus reglas** (criterio RA4.a): el esquema nos permitirá _imponer_ que cada ordenador tenga esos campos, que el atributo `id` sea obligatorio, etc.

Además, debemos escoger qué tecnología de esquema usar: ¿DTD o XSD? Las **DTD** son más sencillas de escribir y entender, pero tienen limitaciones (por ejemplo, no permiten definir tipos numéricos). Los **XSD** son XML en sí mismos y permiten tipos de datos, espacios de nombres, etc., pero su sintaxis es más compleja. Para este ejercicio utilizaremos DTD por facilidad didáctica, sabiendo que **existen ambas tecnologías para definir documentos XML** (criterio RA4.b).

## 7.2. Crear un documento XML de ejemplo (`inventario.xml`)

Comencemos elaborando el documento XML de inventario conforme a la estructura pensada. Abre un nuevo archivo en VS Code llamado `inventario.xml` y construye el siguiente contenido:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<inventario>
    <ordenador id="PC001">
        <ubicacion>Laboratorio 1</ubicacion>
        <usuario>José Luis Moreno</usuario>
        <sistemaOperativo>Windows 10 Pro</sistemaOperativo>
    </ordenador>
    <ordenador id="PC002">
        <ubicacion>Oficina 3</ubicacion>
        <usuario>Aníbal Goritmo</usuario>
        <sistemaOperativo>Ubuntu 20.04 LTS</sistemaOperativo>
    </ordenador>
</inventario>
```

Aquí hemos creado dos entradas de ejemplo bajo la raíz `<inventario>`. Cada `<ordenador>` tiene un atributo `id` distinto (`PC001` y `PC002`) y los tres subelementos acordados. Antes de continuar, verifica que `inventario.xml` está **bien formado** (well-formed): cada etiqueta abre y cierra correctamente, la jerarquía es correcta y la codificación UTF-8 está declarada. Si tienes la extensión XML activa, cualquier error de sintaxis se te indicará; de lo contrario, una forma rápida de comprobarlo es abrir el archivo en un navegador web moderno, ya que suelen mostrar error si el XML está mal formado.

Actualmente, este documento XML **no tiene esquema asociado**. Podría tener errores lógicos (por ejemplo, faltar un `<usuario>` en algún `<ordenador>`) y no lo sabríamos fácilmente. Mantén abierto este archivo; el siguiente paso será crear la definición formal de su estructura.

## 7.3. Crear el esquema DTD para el documento XML (`inventario.dtd`)

Ahora vamos a escribir la definición de tipo de documento (DTD) que describa la estructura válida de `inventario.xml`. Crea un nuevo archivo en el mismo directorio llamado `inventario.dtd`. En este fichero, definiremos cada elemento y atributo según las reglas deseadas:

- El elemento raíz `<inventario>` debe contener uno o más `<ordenador>` (al menos uno, potencialmente muchos).  
- Cada `<ordenador>` contiene exactamente tres subelementos en un orden específico: `<ubicacion>`, `<usuario>`, `<sistemaOperativo>` (uno de cada uno, en ese orden).  
- Los elementos `<ubicacion>`, `<usuario>` y `<sistemaOperativo>` contendrán texto (#PCDATA en terminología DTD).  
- El elemento `<ordenador>` tiene un atributo obligatorio `id`, que podemos definir como tipo `ID` para que cada valor sea único en el documento (esto asegura que no haya dos ordenadores con el mismo identificador).

Comencemos definiendo el elemento raíz y su contenido en el DTD:

```dtd
<!-- DTD para el inventario de ordenadores -->
<!ELEMENT inventario (ordenador+)>
```

Esta línea declara que `<inventario>` es un elemento compuesto por una o más repeticiones (`+`) de `<ordenador>`. Ahora definamos el elemento `<ordenador>` y sus hijos:

```dtd
<!ELEMENT ordenador (ubicacion, usuario, sistemaOperativo)>
<!ELEMENT ubicacion (#PCDATA)>
<!ELEMENT usuario (#PCDATA)>
<!ELEMENT sistemaOperativo (#PCDATA)>
```

La declaración de `<ordenador>` indica que debe tener exactamente en su interior un `<ubicacion>`, seguido de un `<usuario>`, seguido de un `<sistemaOperativo>` (esa coma entre ellos denota secuencia obligatoria). Luego declaramos cada uno de esos subelementos como elementos de texto (`#PCDATA` significa “Parsed Character Data”, es decir, datos de texto plano dentro de la etiqueta).

Por último, definimos la lista de atributos de `<ordenador>`:

```dtd
<!ATTLIST ordenador
    id ID #REQUIRED
>
```

Esta declaración indica que el elemento `<ordenador>` tiene un atributo llamado `id`, de tipo `ID` (identificador único XML) y cuyo valor es **requerido** (`#REQUIRED`) en cada `<ordenador>`; es decir, ningún `<ordenador>` puede carecer de este atributo. Gracias al tipo `ID`, si accidentalmente dos ordenadores tuvieran el mismo `id`, un validador lo detectaría como error, garantizando unicidad.

Juntando todo, tu archivo `inventario.dtd` debería contener:

```dtd
<!-- DTD para el inventario de ordenadores de la empresa -->
<!ELEMENT inventario (ordenador+)>
<!ELEMENT ordenador (ubicacion, usuario, sistemaOperativo)>
<!ELEMENT ubicacion (#PCDATA)>
<!ELEMENT usuario (#PCDATA)>
<!ELEMENT sistemaOperativo (#PCDATA)>
<!ATTLIST ordenador
    id ID #REQUIRED
>
```

No olvides guardar los cambios. Observa que hemos incluido un comentario descriptivo al inicio del DTD que explica brevemente de qué trata (esto es parte de la buena práctica de documentar nuestros esquemas). Puedes añadir más comentarios si lo deseas, por ejemplo antes de la sección de atributos, para aclarar que `id` debe ser único (con esta creación del DTD hemos cubierto RA4.c, RA4.d y RA4.h).

## 7.4. Asociar el esquema DTD con el documento XML

Para que el documento XML `inventario.xml` sepa que debe seguir las reglas del DTD que acabas de crear, hay que asociarlos. En XML esto se logra añadiendo una declaración de `DOCTYPE` al inicio del archivo XML que referencia la DTD. Edita `inventario.xml` y, justo después de la declaración XML (`<?xml version="1.0" encoding="UTF-8" ?>`), añade la siguiente línea:

```xml
<!DOCTYPE inventario SYSTEM "inventario.dtd">
```

Debería quedar así al principio del archivo:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE inventario SYSTEM "inventario.dtd">
<inventario>
    <ordenador id="PC001"> ...
    ...
</inventario>
```

Esta línea DOCTYPE le indica al parser XML que el elemento raíz es `<inventario>` y que su definición está en el fichero externo `"inventario.dtd"`. Asegúrate de que `inventario.dtd` está en la misma carpeta que el XML para que pueda encontrarse mediante esa ruta. Ahora el documento `inventario.xml` está vinculado a su esquema (criterio RA4.f).

## 7.5. Validar el documento XML contra el esquema DTD

Con la asociación hecha, podemos validar el XML para comprobar que cumple las reglas que definimos. Si instalaste la extensión XML de Red Hat en VS Code, es muy probable que la validación se realice automáticamente al guardar o abrir el documento. Abre `inventario.xml` en VS Code; deberías ver en la barra de estado o en la pestaña de problemas si hay errores de validación. Dado que escribimos el XML de acuerdo al esquema, no debería haber errores.

Vamos a probar la robustez del esquema con un par de experimentos controlados:

- **Prueba 1:** Edita temporalmente el XML para introducir un error, por ejemplo quita la etiqueta `<usuario>` (y su cierre) de uno de los `<ordenador>`. Guarda y observa que el validador DTD marcará un error indicando algo como que se esperaba `<usuario>` en cierto lugar. Esto confirma que el esquema detecta la falta de un elemento obligatorio. Vuelve a deshacer el cambio para restaurar el XML correcto.

- **Prueba 2:** Introduce un segundo atributo `id` duplicado en otro ordenador (por ejemplo, pon `id="PC001"` también en el segundo `<ordenador>`). Al validar, el parser XML debería advertir que el valor ID ya existe (porque los IDs deben ser únicos). Este comportamiento puede variar según la herramienta, pero en general las validaciones completas de DTD chequean unicidad de ID. Restablece luego el `id` correcto distinto.

Si no estás usando VS Code o la extensión no muestra errores por sí misma, puedes validar usando herramientas externas: una opción es utilizar la utilidad de línea de comandos `xmllint` (disponible en Linux y en Windows vía Cygwin o WSL). Ejecutando en la terminal `xmllint --noout --valid inventario.xml`, se procesará el XML con su DTD y se informará si hay violaciones del esquema. Otra opción es algún validador online de XML que permita subir tanto el XML como la DTD. Cualquiera sea el método, lo importante es confirmar que **con la DTD asociada, el documento se considera válido**.

Al terminar, tu XML de inventario válido se convierte en un documento **válido** (no solo bien formado) porque satisface todas las reglas de su DTD (esto cubre el criterio RA4.e y RA4.g).

## 7.6. Refinar y documentar el esquema XML

Como paso final, revisa tu archivo `inventario.dtd` para asegurarte de que esté **bien documentado** y optimizado. Hemos agregado un comentario al inicio, pero podríamos añadir más si la estructura fuera más compleja. En este caso sencillo, con un comentario general es suficiente, aunque podrías anotar, por ejemplo, que el orden de `<ubicacion>`, `<usuario>`, `<sistemaOperativo>` es fijo según este diseño. Documentar el esquema es importante cuando otras personas vayan a usarlo o mantenerlo: unas breves líneas explicativas pueden ahorrar confusiones.

Piensa también si tu esquema necesita alguna adaptación: por ejemplo, ¿y si en el futuro quisieras agregar un nuevo campo `<ip>` a cada ordenador? Tendrías que actualizar tanto la DTD (añadiendo ese elemento en la definición de `ordenador`) como todos los XML que la usan. Mantener la consistencia esquema–archivo es vital. En esta ocasión no añadiremos más campos, pero es útil reflexionar sobre la escalabilidad del esquema diseñado (con la revisión y comentarios finales, reforzamos el criterio RA4.h).

> **Nota:** Si optáramos por usar XSD en vez de DTD, la mecánica sería parecida: definir un archivo `.xsd` con elementos y tipos, y luego referenciarlo desde el XML con un atributo `xsi:noNamespaceSchemaLocation="inventario.xsd"` en la raíz (junto con `xmlns:xsi`). La validación se haría igual. XSD permitiría, por ejemplo, restringir que `<sistemaOperativo>` solo pueda tener ciertos valores (Windows, Linux, etc.) usando enumeraciones, o definir que el contenido de `<id>` siga un patrón particular. Estas son ventajas de XSD sobre DTD. Sin embargo, para propósitos de este ejercicio, la DTD cumple con ilustrar el proceso de definición de esquema y validación.

# 8. Conversión XML con XSLT[^7]

En este apartado aprenderemos a utilizar **XSLT** (Extensible Stylesheet Language Transformations) para transformar documentos XML a otros formatos (por ejemplo, HTML). XSLT es un lenguaje de plantillas (template language) que **toma un documento XML de entrada y produce otro documento según reglas definidas en una hoja de estilos XSL**. Esto permite *añadir, eliminar y reorganizar elementos* del XML original para obtener la salida deseada. El objetivo es comprender la sintaxis de XSLT y realizar una conversión concreta.

Supongamos que tenemos un catálogo de productos en XML (`catalogo.xml`) y queremos generar una página HTML con la lista de productos. El archivo `catalogo.xml` podría ser:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="catalogo.xsl"?>
<catalogo>
  <producto>
    <nombre>Zapatos</nombre>
    <precio>50</precio>
  </producto>
  <producto>
    <nombre>Camisa</nombre>
    <precio>20</precio>
  </producto>
</catalogo>
```

Este XML contiene dos productos con sus nombres y precios. El procesamiento de instrucciones `<?xml-stylesheet ...?>` indica que asociaremos este XML con la hoja XSLT `catalogo.xsl`. A continuación, creamos la hoja de estilos XSL (`catalogo.xsl`) que define la conversión:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Template que coincide con la raíz del documento -->
  <xsl:template match="/">
    <html>
      <body>
        <h2>Catálogo de Productos</h2>
        <ul>
          <!-- Itera sobre cada <producto> -->
          <xsl:for-each select="catalogo/producto">
            <li>
              <strong><xsl:value-of select="nombre"/></strong> – 
              <xsl:value-of select="precio"/>€
            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
```

- Declaramos que usamos XSLT 1.0 con el espacio de nombres `xmlns:xsl`.
- `<xsl:template match="/">`  define una plantilla que se aplica al nodo raíz del documento XML (en nuestro caso `<catalogo>`, el elemento principal que contiene todos los productos). Dentro de esta plantilla se construye la estructura HTML que se generará como resultado.
- Dentro del `<xsl:for-each select="catalogo/producto">` recorremos cada elemento `<producto>`. Por cada producto, añadimos un `<li>` con el contenido del nombre y precio mediante `<xsl:value-of select="…"/>`.

Este XSLT generará un HTML con un listado de los productos (con nombre en negrita y precio). Si abrimos el XML en un navegador compatible o usamos un procesador XSLT (por ejemplo, en la terminal: `xsltproc catalogo.xsl catalogo.xml > catalogo.html`), obtendremos una página con los datos transformados. Así, hemos realizado la **conversión de XML a HTML** usando XSLT.

# 9. Uso de ERP

Un **ERP (Enterprise Resource Planning)** es un sistema que integra y gestiona los procesos centrales de una empresa (finanzas, inventario, ventas, etc.) proporcionando una visión unificada y una única fuente de información. Por ejemplo, **SAP** es uno de los ERP más utilizados a nivel mundial, especialmente en grandes empresas, ya que ofrece soluciones robustas y escalables para la gestión empresarial. Asimismo, **Odoo** es un conjunto de aplicaciones de negocio de código abierto que cubre necesidades como CRM, inventario, contabilidad, punto de venta, etc.

Un **CRM (Customer Relationship Management)** es una herramienta orientada a gestionar las relaciones con los clientes, optimizando procesos de ventas, marketing y atención al cliente. En este ámbito, **Salesforce** es el CRM más conocido y utilizado globalmente, y puede integrarse tanto con SAP como con Odoo para potenciar la gestión comercial y mejorar la experiencia del cliente.


[^1]: Real Decreto 1629/2009, resultado de aprendizaje 1, criterios de evaluación: 1, 2, 3, 4, 5 (características y ventajas de lenguajes de marcas; clasificación por tipos y ámbitos; necesidad de un lenguaje de propósito general).

[^2]: Real Decreto 1629/2009, resultado de aprendizaje 1, criterios de evaluación: 6, 7, 8, 9 (características propias de XML; estructura y reglas sintácticas de un XML; importancia de documentos bien formados; ventaja de los espacios de nombres en XML).

[^3]: Real Decreto 1629/2009, resultado de aprendizaje 2, criterios de evaluación: 1, 2, 3, 6 (lenguajes de marcas web y sus versiones – introducción a HTML5; estructura de un documento HTML y sus secciones; etiquetas y atributos principales de HTML; uso de herramienta de edición VS Code en la creación de páginas).

[^4]: Real Decreto 1629/2009, resultado de aprendizaje 2, criterios de evaluación: 4, 5 (semejanzas y diferencias entre HTML y XHTML; utilidad de XHTML en sistemas de gestión de información).

[^5]: Real Decreto 1629/2009, resultado de aprendizaje 2, criterios de evaluación: 7, 8 (ventajas de utilizar hojas de estilo CSS; aplicación práctica de hojas de estilo en un documento web).

[^5]: Real Decreto 1629/2009, resultado de aprendizaje 3.

[^6]: Real Decreto 1629/2009, resultado de aprendizaje 4.

[^7]: Real Decreto 1629/2009, resultado de aprendizaje 5.

