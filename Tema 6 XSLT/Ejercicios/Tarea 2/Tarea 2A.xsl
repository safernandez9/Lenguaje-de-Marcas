<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <xsl:element name = "{venda/cliente/@cod}">
            <xsl:attribute name = "num_produtos"/>
            <xsl:value-of select = "count(produtos/produto)"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
