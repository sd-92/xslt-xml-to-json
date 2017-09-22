# xslt-xml-to-json
XSLT template which converts XML to JSON. (If you are ever stuck in 2002)
## Usage
Sample XML
```xml
<plant>
  <common>Bloodroot</common>
  <botanical>Sanguinaria canadensis</botanical>
  <zone>4</zone>
  <light>Mostly Shady</light>
  <price>$2.44</price>
  <availability>031599</availability>
</plan>
```
In your XSLT:
```xslt
<xsl:include href="xml-to-json.xsl"/>

<xsl:call-template name="xml-to-json2">
  <xsl:with-param name="data" select="plant"/>
</xsl:call-template>
```
