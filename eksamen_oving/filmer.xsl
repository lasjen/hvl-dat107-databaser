<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
    <xsl:output method="html"/>
    <xsl:template match="filmer">
        <HTML>
            <BODY>
                <h1>Filmer</h1>
                <TABLE border='1' style='table-layout:fixed'>
                    <TR bgcolor='#FFFF00'>
                        <TD width="40"><b>Id</b></TD>
                        <TD width="100"><b>Tittel</b></TD>
                        <TD width="80"><b>Utgitt</b></TD>
                        <TD width="120"><b>Kategori</b></TD>
                        <TD width="150"><b>Regi</b></TD>
                        <TD width="200"><b>Skuespillere</b></TD>
                    </TR>
                    <xsl:for-each select="film">
                        <TR>
                            <TD><xsl:value-of select="@id" /></TD>
                            <TD><xsl:value-of select="tittel"/></TD>
                            <TD><xsl:value-of select="utgitt"/></TD>
                            <TD>
                                <xsl:for-each select="kategorier/kategori">
                                    <xsl:value-of select="."/> <br/>
                                </xsl:for-each>
                            </TD>
                            <TD>
                                <xsl:for-each select="filmskapere/regi">
                                    <xsl:value-of select="@navn"/> <br/>
                                </xsl:for-each>
                            </TD>
                            <TD>
                                <xsl:for-each select="skuespillere/skuespiller">
                                    <xsl:value-of select="@navn"/> <br/>
                                </xsl:for-each>
                            </TD>
                        </TR>
                    </xsl:for-each>
                </TABLE>
            </BODY>
        </HTML>
    </xsl:template>
</xsl:stylesheet>