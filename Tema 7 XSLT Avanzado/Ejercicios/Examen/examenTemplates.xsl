<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Alojamientos</title>
      </head>
      <body>
        <h1>Hoteles</h1>
        <ul>
          <xsl:apply-templates select="//hotel">
            <xsl:sort select="@estrellas" data-type="number" order="descending"/>
            <xsl:sort select="count(servicios/*)" data-type="number" order="descending"/>
          </xsl:apply-templates>
        </ul>

        <div class="detalle">
          <xsl:apply-templates select="//hotel" mode="detalle">
            <xsl:sort select="@estrellas" data-type="number" order="descending"/>
            <xsl:sort select="count(servicios/*)" data-type="number" order="descending"/>
          </xsl:apply-templates>
        </div>
      </body>
    </html>
  </xsl:template>

  <!-- Listado de hoteles con enlaces -->
  <xsl:template match="hotel">
    <a href="#{@id}">
      <li>
        <xsl:choose>
          <xsl:when test="@estrellas">
            <xsl:value-of select="concat(nombre, ' (', @estrellas, ' estrellas)')"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="nombre"/>
          </xsl:otherwise>
        </xsl:choose>
      </li>
    </a>
  </xsl:template>


  <!-- Detalle del hotel -->
  <xsl:template match="hotel" mode="detalle">
    <hr/>
    <h3 id="{@id}">
      <xsl:choose>
        <xsl:when test="@estrellas">
          <xsl:value-of select="concat(nombre, ' (', localidad, ') - (', @estrellas, ' estrellas)')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat(nombre, ' (', localidad, ')')"/>
        </xsl:otherwise>
      </xsl:choose>
    </h3>

    <xsl:if test="observaciones">
      <p>
        <xsl:value-of select="observaciones"/>
      </p>
    </xsl:if>

    <ul>
      <xsl:if test="instalaciones/piscina">
        <li>
          <xsl:value-of select="concat('Piscina (', count(instalaciones/piscina), ')')"/>
        </li>
      </xsl:if>

      <xsl:if test="restaurantes/restaurante">
        <li>
          <xsl:value-of select="concat('Restaurantes (', count(restaurantes/restaurante), ')')"/>
        </li>
      </xsl:if>

      <xsl:if test="servicios/*">
        <li>
          <xsl:text>Servicios</xsl:text>
          <ul>
            <xsl:apply-templates select="servicios/*" mode="servicio">
              <xsl:sort select="name()"/>
            </xsl:apply-templates>
          </ul>
        </li>
      </xsl:if>
    </ul>
  </xsl:template>

  <!-- Plantilla para cada servicio -->
  <xsl:template match="servicios/*" mode="servicio">
    <li>
      <xsl:value-of select="name()"/>
    </li>
  </xsl:template>

</xsl:stylesheet>
