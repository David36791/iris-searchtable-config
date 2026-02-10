Class Sample.Production.Demo.Service Extends EnsLib.SOAP.Service
{

Parameter ADAPTER;

/// Name of the WebService
Parameter SERVICENAME = "Service";

Parameter SETTINGS = "TargetConfigNames:Basic:selector?context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId},SearchTableClass:Basic:selector?context={Ens.ContextSearch/SearchTableClasses?host=Sample.Production.Demo.Service}";

Property TargetConfigNames As Ens.DataType.ConfigName;

Property SearchTableClass As %String;

/// TODO: Change this to actual network address
/// URL for invoking the WebService
/// Parameter LOCATION = "http://127.0.0.1:8972/csp/ensemble";
/// TODO: Change this to actual SOAP namespace
/// SOAP namespace for the WebService
Parameter NAMESPACE = "http://tempuri.org";

Method Sample(pInput As %String) As %Status [ WebMethod ]
{

	Set tSC=..ProcessInput(pInput,.tResponse,..TargetConfigNames)
	If $$$ISERR(tSC) Do ..ReturnMethodStatusFault(tSC)
	Quit tResponse
}

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
	Set tSC=..SendRequestSync(pHint,pInput,.pOutput)
	If ""'=..SearchTableClass {
		Try {		
			Set tSCStore=$ZOBJCLASSMETHOD(..SearchTableClass,"IndexDoc",pInput)
			} Catch errobj { 
				$$$LOGWARNING(errobj.DisplayString()) 
		}
	}	
	Quit tSC
}

}
