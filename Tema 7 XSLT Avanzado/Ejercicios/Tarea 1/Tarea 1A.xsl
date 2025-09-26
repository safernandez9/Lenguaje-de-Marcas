<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <almacenamento>
      <!-- Sección de discos -->
      <discos num="{count(//disco)}">
        <xsl:apply-templates select="//disco"/>
      </discos>

      <!-- Sección de memorias -->
      <memorias num="{count(//memoria)}">
        <xsl:apply-templates select="//memoria"/>
      </memorias>

    </almacenamento>
  </xsl:template>

  <!-- Copiar disco tal cal -->
  <xsl:template match="disco">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
    </xsl:copy>
  </xsl:template>

  <!-- Copiar memoria tal cal -->
  <xsl:template match="memoria">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:value-of select="."/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
