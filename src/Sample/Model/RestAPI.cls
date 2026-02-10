Class Sample.Model.RestAPI Extends %CSP.REST
{

Parameter Version = "1.0.0";

Parameter CONTENTTYPE = "application/json";

Parameter HandleCorsRequest = "true";

XData UrlMap
{
<Routes>
<!-- Server Info -->
<Route Url="/*" Method="Options" Call="Status"/>
<Route Url="/GetService" Method="GET" Call="GetService"/>
<Route Url="/SearchTableConfig" Method="POST" Call="SearchTableConfig"/>
<Route Url="/GetServiceConfig" Method="POST" Call="GetServiceConfig"/>
<Route Url="/getSearchTableByService" Method="POST" Call="getSearchTableByService"/>
</Routes>
}

ClassMethod Status() As %Status
{
	quit $$$OK
}

ClassMethod GetVersion() As %Status
{
	
	Set Res =##class(Sample.Model.Result.CodeMsg).%New()
	Try{
		 
		Set version = ..#Version
		Set info = {
	    	"version": (version)
	  		}
	  	Set res=	Res.SUCCESS(info)
	}Catch e{
		Set res =Res.ERROR(e.DisplayString())
	}
  w res
  return $$$OK
}

ClassMethod GetService() As %Status
{
	
	Set Res =##class(Sample.Model.Result.CodeMsg).%New()
	Try{
		Set Service =##class("Sample.Model.Service.Services").%New()
		Set msg =Service.getService()
	  	Set res= Res.SUCCESS(msg)
	}Catch e{
		Set res =Res.ERROR(e.DisplayString())
	}
	
  w res
  return $$$OK
}

ClassMethod GetServiceConfig() As %Status
{
	
	Set Res =##class(Sample.Model.Result.CodeMsg).%New()
	Try{

		Set Service = ##class(Sample.Model.Service.CreateDBService).%New()
		Set request =$ZCONVERT(%request.Content.Read(),"I","UTF8")
		Set object = ##class(%DynamicObject).%FromJSON(request)
		Set msg =Service.GetConfig(object)
	  	Set res= Res.SUCCESS(msg)
	}Catch e{
		Set res =Res.ERROR(e.DisplayString())
	}
	
  w res
  return $$$OK
}

ClassMethod getSearchTableByService() As %Status
{
	
	Set Res =##class(Sample.Model.Result.CodeMsg).%New()
	Try{

		Set Service = ##class(Sample.Model.Service.Services).%New()
		Set request =$ZCONVERT(%request.Content.Read(),"I","UTF8")
		Set object = ##class(%DynamicObject).%FromJSON(request)
		Set msg =Service.getSearchTableByService(object)
	  	Set res= Res.SUCCESS(msg)
	}Catch e{
		Set res =Res.ERROR(e.DisplayString())
	}
	
  w res
  return $$$OK
}

ClassMethod SearchTableConfig() As %Status
{
	
	Set Res =##class(Sample.Model.Result.CodeMsg).%New()
	Try{

		Set Service = ##class(Sample.Model.Service.CreateDBService).%New()
		Set SearchTable = ##class(Sample.Model.Service.SearchTable).%New()
		Set request =$ZCONVERT(%request.Content.Read(),"I","UTF8")
		Set object = ##class(%DynamicObject).%FromJSON(request)
		//Set tsc =SearchTable.SearchTableOperation(object)
		d ##class(Sample.Model.Service.SearchTable).SearchTableOperation(object)
		Set msg =Service.Creat(object)
		if msg=1{
		  	Set res= Res.SUCCESS(msg)
		}else{
			Set res =Res.ERROR("ERROR")
		}
	}Catch e{
		Set res =Res.ERROR(e.DisplayString())
	}
	
  w res
  return $$$OK
}

}
