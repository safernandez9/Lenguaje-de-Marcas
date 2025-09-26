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
                    <xsl:for-each select="//hotel">
                        <xsl:sort select="@estrellas" data-type="number" order="descending"/>
                        <xsl:sort select="count(servicios/*)" data-type="number" order="descending"/>
                        <xsl:variable name="tieneEstrellas" select="@estrellas"/>
                        <a href = "#{@id}" >    <!--Enlace interno # incrustar xpath {}-->         
                            <li>
                                <xsl:choose>
                                    <xsl:when test = "$tieneEstrellas">
                                        <xsl:value-of select = "concat(nombre, ' (', @estrellas, ' estrellas)')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select = "nombre"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </li>
                        </a>
                    </xsl:for-each>
                </ul>
                

                <div class="detalle">
                    <xsl:for-each select="//hotel">
                        <xsl:sort select="@estrellas" data-type="number" order="descending"/>
                        <xsl:sort select="count(servicios/*)" data-type="number" order="descending"/>
                        <xsl:variable name="tieneEstrellas" select="@estrellas"/>
                        <xsl:variable name="piscina" select="instalaciones/piscina"/>
                        <hr/>
                        <h3 id = "{@id}">
                            <xsl:choose>
                                <xsl:when test = "$tieneEstrellas">
                                    <xsl:value-of select="concat(nombre, ' (', localidad, ') - (', @estrellas, ' estrellas)') "/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat(nombre, ' (', localidad, ')')"/>
                                </xsl:otherwise>
                            </xsl:choose>                            
                        </h3>
                        <xsl:if test="observaciones">
                            <p>
                                <xsl:value-of select = "observaciones"/>
                            </p>                         
                        </xsl:if>
                        <ul>
                            <xsl:if test = "$piscina">
                                <li>
                                    <xsl:value-of select = "concat('Piscina (' , count($piscina), ')')"/>
                                </li>
                            </xsl:if>
                            <xsl:if test = "restaurantes/*">
                                <li>
                                    <xsl:value-of select = "concat('Restaurantes (' , count(restaurantes/restaurante), ')')"/>
                                </li>
                            </xsl:if>
                        
                            <xsl:if test="servicios/*">
                                <li>
                                    <xsl:text>Servicios</xsl:text>                                
                                    <ul>
                                        <xsl:for-each select="servicios/*">
                                            <xsl:sort select="name()"/>
                                            <li>
                                                <xsl:value-of select="name()"/>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </li>
                            </xsl:if>
                        </ul>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>