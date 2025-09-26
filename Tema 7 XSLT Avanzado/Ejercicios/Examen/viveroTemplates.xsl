<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:strip-space elements="*"/>
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
            <xsl:value-of select = "vivero/proveedores/proveedor[@id = ../@proveedor]/@nombre"/>
        </xsl:attribute> 
    </xsl:attribute-set>
    
    <!--Atributos planta (iguales a los comunes)-->
    <xsl:attribute-set name = "attrPlantas" use-attribute-sets="attrComunes"/>
 
  
    <xsl:template match="vivero">
        <xsl:element name = "Vivero">
            <xsl:element name = "Árboles">
                <xsl:apply-templates select = "seccion[@nombre = 'arboles']/Familia/arbol"/>                
            </xsl:element>
            <xsl:element name = "Plantas">
                <xsl:apply-templates select = "seccion[@nombre = 'plantas']/Familia/planta"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match = "arbol">
        <xsl:element name = "Árbol" use-attribute-sets = "attrArbol">
            <xsl:call-template name = "primeraParte"/>
           
            <xsl:copy-of select = "Altura/following-sibling::node()"/>
        </xsl:element>      
    </xsl:template>
    
    <xsl:template match = "planta">
        <xsl:element name = "Planta" use-attribute-sets = "attrPlantas">    
            <xsl:element name = "Ref">
                <xsl:value-of select="@ref"/>
           </xsl:element>
            <xsl:copy-of select = "Descripcion"/>            
        </xsl:element>
    </xsl:template>
    
    <xsl:template name = "primeraParte">
        <xsl:element name = "Ref">
                <xsl:value-of select="@ref"/>
            </xsl:element>
            <xsl:copy-of select = "Descripcion"/>
            <xsl:element name = "Altura">
                <xsl:value-of select = "concat(Altura, 'm')"/>
            </xsl:element>
    </xsl:template>
    
    <xsl:template name = "segundaParte">
         
    </xsl:template>

</xsl:stylesheet>