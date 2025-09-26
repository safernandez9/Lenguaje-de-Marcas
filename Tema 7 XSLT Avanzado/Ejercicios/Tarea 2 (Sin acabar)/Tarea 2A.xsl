<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="equipos">
        <html>
            <head>
                <title>Táboa das máquinas</title>
            </head>
            <body>
                <h1>Táboa das máquinas</h1>
                <table style="border:1px black solid;">
                    <tr>
                        <th style="border:1px black solid;">Máquina</th>
                        <th style="border:1px black solid;">Tipo</th>
                        <th style="border:1px black solid;">OS</th>
                        <th style="border:1px black solid;">Capacidade HD</th>
                    </tr>
                    <xsl:apply-templates select="máquina[not(starts-with(hardware/tipo, 'Impresora'))]"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match= "máquina">
        <tr>
            <xsl:if test="hardware/tipo='Semitorre' or hardware/tipo='PC Sobremesa'">
                <xsl:attribute name="style">background:yellow</xsl:attribute>
            </xsl:if>
            <td><xsl:value-of select="@nome"</td>
            <td><xsl:value-of select="hardware/tipo"</td>
            
        </tr>
    </xsl:template>
</xsl:stylesheet>
