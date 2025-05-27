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
