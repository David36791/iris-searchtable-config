Class Sample.Model.Service.Services Extends %RegisteredObject
{

ClassMethod getService()
{
	// production
	
	Set tSC = ##class(Ens.Director).GetProductionStatus(.productionName,.tState,,1)
	Set DataArr=##class(%DynamicArray).%New()
	Set tStatment = ##class(%SQL.Statement).%New()
	Set sql = "SELECT ID,NAME ,ClassName FROM Ens_Config.Item WHERE  Production = '"_productionName_"' "
	Set tSC = tStatment.%Prepare(sql)
	Set tResult = tStatment.%Execute()
	While tResult.%Next(){
		Set ClassName=tResult.%Get("ClassName")

		Set type=##class(Ens.Config.Item).GetBusinessType(ClassName)
		if type =1{

				Set Name=tResult.%Get("Name")
				Set ID=tResult.%Get("ID")
				Set Objetct  = {"ID": (ID),"Name": (Name)}
				d DataArr.%Push(Objetct)
		}

	}
	return DataArr
}

ClassMethod getSearchTableByService(request)
{
	Set ServiceName =request.ServiceName
	Set object ={"Name":"SearchTableClass","Value":("")}
	Set tSC = ##class(Ens.Director).GetProductionStatus(.productionName,.tState,,1)
	&sql(SELECT ID into :ID FROM Ens_Config.Item WHERE  Production = :productionName and Name =:ServiceName)
	Set item = ##Class(Ens.Config.Item).%OpenId(ID)
	Set settings=item.Settings
	Set dataArr=##class(%Library.DynamicArray).%New()
	for i=1:1:settings.Size{
		Set Target=settings.GetAt(i).Target
		Set Name=settings.GetAt(i).Name
		if Name ="SearchTableClass"{
			Set Value=settings.GetAt(i).Value

			Set object.Value = Value
			return object
		}
	}
	return object
}

ClassMethod SaveService(ServiceName, SearchTableName)
{
	Set tSC = ##class(Ens.Director).GetProductionStatus(.productionName,.tState,,1)
	&sql(SELECT ID into :ID FROM Ens_Config.Item WHERE  Production = :productionName and Name =:ServiceName)
	Set item = ##Class(Ens.Config.Item).%OpenId(ID)
	Set settings=item.Settings
	Set dataArr=##class(%Library.DynamicArray).%New()
	for i=1:1:settings.Size{
		Set Target=settings.GetAt(i).Target
		Set Name=settings.GetAt(i).Name
		Set Value=settings.GetAt(i).Value
		Set Object=##class(%Library.DynamicObject).%New()
		Set Object.Target=Target
		Set Object.Name=Name
		Set Object.Value=Value
		do dataArr.%Push(Object)	
	}
	Set addObj=##class(%Library.DynamicObject).%New()
	Set addObj.Target="Host"
	Set addObj.Name="SearchTableClass"
	Set addObj.Value=SearchTableName
	do dataArr.%Push(addObj)
	Do item.Settings.Clear()
	Set iter= dataArr.%GetIterator()
	while iter.%GetNext(.key , .value ){
		Set setting=##class(Ens.Config.Setting).%New()
		Set setting.Target=value.Target
		Set setting.Name=value.Name
		Set setting.Value=value.Value
		D item.Settings.Insert(setting)		
	}
	d item.%Save()
	Do ##class(Ens.Director).UpdateProduction()
	
	return $$$OK
}

}
