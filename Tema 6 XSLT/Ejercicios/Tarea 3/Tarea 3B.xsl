<!--Hay que corregir-->
<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Taboa máquinas</title>
            </head>
            <body>
                <h1>Táboa das máquinas</h1>
                <table border = "1">
                    <tr>
                        <th>Máquina</th>
                        <th>Procesador</th>
                        <th>Memoria</th>
                    </tr>
                    <xsl:apply-templates select = "equipos/máquina"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match ="máquina">
        <tr>
            <td>
                <xsl:value-of select = "@nome"/>
            </td>
            <td>
                <xsl:value-of select = "hardware/procesador/@marca"/>
                <xsl:text>-</xsl:text>
                <xsl:value-of select = "hardware/procesador/text{}"/>
            </td>
            
        </tr>
    </xsl:template>

</xsl:stylesheet>
