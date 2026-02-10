Class Sample.Production.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

Property Adapter As EnsLib.SOAP.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method XML(pInput As EnsLib.EDI.XML.Document, Output pOutput As EnsLib.EDI.XML.Document) As %Status
{
	Set pOutput=##class(EnsLib.EDI.XML.Document).%New()
	Set xml =##class(EnsLib.EDI.XML.Document).%New()
	Set xmlcontent="<RESPONSE><CODE>true</CODE><CONTENT>SUCCESS</CONTENT></RESPONSE>"
	Set pOutput=xml.ImportFromString(xmlcontent,.status)
	Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="EnsLib.EDI.XML.Document"> 
		<Method>XML</Method>
	</MapItem>

</MapItems>
}

}
