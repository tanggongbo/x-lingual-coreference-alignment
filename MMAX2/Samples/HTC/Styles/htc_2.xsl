<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:mmax="org.eml.MMAX2.discourse.MMAX2DiscourseLoader"
                xmlns:coref="www.eml.org/NameSpaces/coref">
 <xsl:output method="text" indent="no" omit-xml-declaration="yes"/>
<xsl:strip-space elements="*"/>

<xsl:template match="words">
<xsl:text>
</xsl:text>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="word">
 <xsl:value-of select="mmax:registerDiscourseElement(@id)"/>
 <xsl:apply-templates select="mmax:getStartedMarkables(@id)" mode="opening"/>
 <xsl:value-of select="mmax:setDiscourseElementStart()"/>
  <xsl:apply-templates/>
 <xsl:value-of select="mmax:setDiscourseElementEnd()"/>
 <xsl:apply-templates select="mmax:getEndedMarkables(@id)" mode="closing"/>
 <xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="coref:markable" mode="opening">
<xsl:if test="mmax:isOn('coref_handle')">
 <xsl:value-of select="mmax:addLeftMarkableHandle(@mmax_level, @id, '[')"/>
</xsl:if>
</xsl:template>

<xsl:template match="coref:markable" mode="closing">
<xsl:if test="mmax:isOn('coref_handle')">
 <xsl:value-of select="mmax:addRightMarkableHandle(@mmax_level, @id, ']')"/>
</xsl:if>
</xsl:template>


</xsl:stylesheet>
