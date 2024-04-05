<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
    <xsl:template match="personer">
        <HTML>
            <BODY>
                <h1>Personer</h1>
                <TABLE border='1' style='table-layout:fixed' width='600'>
                    <TR bgcolor='#FFFF00'>
                        <TD><b>Pnr</b></TD>
                        <TD><b>Navn</b></TD>
                        <TD><b>Fødseldato</b></TD>
                        <TD><b>Antall barn</b></TD>
                    </TR>
                    <xsl:for-each select="person">
                        <TR>
                            <TD><xsl:value-of select='pnr' /></TD>
                            <TD><xsl:value-of select="fornavn"/> <xsl:text> </xsl:text> <xsl:value-of select="etternavn"/></TD>
                            <TD><xsl:value-of select='fodselsdato' disable-output-escaping="yes"/></TD>
                            <TD><xsl:value-of select='barn' disable-output-escaping="yes"/></TD>
                        </TR>
                    </xsl:for-each>
                </TABLE>
            </BODY>
        </HTML>
    </xsl:template>
</xsl:stylesheet>