<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   xmlns:ext="http://exslt.org/common">
   <xsl:template name="xml-to-json">
      <xsl:param name="data"/>
      <xsl:text>{</xsl:text>
      <xsl:for-each select="$data">
         <xsl:choose>
            <xsl:when test="@*">
               <xsl:text>"</xsl:text>
               <xsl:value-of disable-output-escaping="yes" select="name()"/>
               <xsl:text>":</xsl:text>
               <xsl:text>{</xsl:text>
               <xsl:for-each select="@*">
                  <xsl:value-of disable-output-escaping="yes" select="concat('&quot;',name(),'&quot;', ': &quot;', ., '&quot;')"/>
                  <xsl:if test="not(position() = last())">
                     <xsl:text>,</xsl:text>
                  </xsl:if>
               </xsl:for-each>
               <xsl:if test="text()">
                  <xsl:text>,"nodeContent":</xsl:text>
                  <xsl:text>"</xsl:text>
                  <xsl:value-of disable-output-escaping="yes" select="."/>
                  <xsl:text>"</xsl:text>
               </xsl:if>
               <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="text()">
               <xsl:text>"</xsl:text>
               <xsl:value-of disable-output-escaping="yes" select="name()"/>
               <xsl:text>":</xsl:text>
               <xsl:text>"</xsl:text>
               <xsl:value-of disable-output-escaping="yes" select="."/>
               <xsl:text>"</xsl:text>
            </xsl:when>
            <xsl:when test="*">
               <xsl:for-each select="*">
                  <xsl:text>"</xsl:text>
                  <xsl:value-of disable-output-escaping="yes" select="local-name()"/>
                  <xsl:text>":</xsl:text>
                  <xsl:call-template name="xml-to-json2">
                     <xsl:with-param name="data" select="*"/>
                  </xsl:call-template>
               </xsl:for-each>
               <xsl:if test="text()">
                  <xsl:text>,"nodeContent":</xsl:text>
                  <xsl:text>"</xsl:text>
                  <xsl:value-of disable-output-escaping="yes" select="."/>
                  <xsl:text>"</xsl:text>
               </xsl:if>
            </xsl:when>
         </xsl:choose>
         <xsl:if test="not(position() = last())">
            <xsl:text>,</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:text>}</xsl:text>
   </xsl:template>
</xsl:stylesheet>
