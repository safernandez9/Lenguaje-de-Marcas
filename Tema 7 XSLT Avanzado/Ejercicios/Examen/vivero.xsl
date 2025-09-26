<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

    <!--Atributos comunes-->
    <xsl:attribute-set name = "attrComunes">
        <xsl:attribute name = "num">
            <xsl:value-of select = "position()"/>
        </xsl:attribute>
        <xsl:attribute name = "familia">
            <xsl:value-of select = "../@nombre"/>
        </xsl:attribute>
    </xsl:attribute-set>
    
    <!--Atributos árbol-->
    <xsl:attribute-set name = "attrArbol" use-attribute-sets="attrComunes">      
        <xsl:attribute name = "proveedor">
            <xsl:value-of select = "../../../proveedores/proveedor[@id = ../@proveedor]"/>
        </xsl:attribute> 
    </xsl:attribute-set>
    
    <!--Atributos planta (iguales a los comunes)-->
    <xsl:attribute-set name = "attrPlantas" use-attribute-sets="attrComunes"/>
 
  
    <xsl:template match="/">
        <Vivero>
            <Árboles>
                <xsl:apply-templates select = "seccion[@nombre = 'arboles']/Familia/arbol"/>                
            </Árboles>
            <Plantas>
                <xsl:apply-templates select = "seccion[@nombre = 'plantas']/Familia/planta"/>
            </Plantas>
        </Vivero>
    </xsl:template>
    
    <xsl:template match = "arbol">
        <Árbol use-attribute-sets = "attrArbol">
            <xsl:copy-of select = "/*"/>
        </Árbol>    
    </xsl:template>
    
    <xsl:template match = "planta">
        <Planta use-attribute-sets = "attrPlanta">
            <xsl:copy-of select = "/*"/>
        </Planta>    
    </xsl:template>

</xsl:stylesheet>