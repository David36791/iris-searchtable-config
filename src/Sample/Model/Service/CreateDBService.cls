Class Sample.Model.Service.CreateDBService Extends %RegisteredObject
{

ClassMethod Creat(request)
{
	Set tSC=$$$OK
	Set ServiceName= request.ServiceName
	Set SearchTable= request.SearchTableName
	Set Config= request.Config
	Set ID =""
	&SQL(Select id into :ID from Sample_Model_DB.ServiceConfigDB where ServiceName =:ServiceName and SearchTable =:SearchTable )
	if $L(ID)=0{
		Set db =##class(Sample.Model.DB.ServiceConfigDB).%New()
	}Else{
		Set db=##class(Sample.Model.DB.ServiceConfigDB).%OpenId(ID)
	}
	
	Set db.ServiceName=ServiceName
	Set db.SearchTable = SearchTable
	Set db.Config = Config
	Set tSC = db.%Save()
	Return tSC
}

ClassMethod GetConfig(request)
{
	Set ServiceName= request.ServiceName
	Set SearchTable= request.SearchTableName
	Set ID =""
	&SQL(Select id into :ID from Sample_Model_DB.ServiceConfigDB where ServiceName =:ServiceName and SearchTable =:SearchTable )
	if $L(ID) =0{
		Set config =[]
	}else{
		Set db=##class(Sample.Model.DB.ServiceConfigDB).%OpenId(ID)
		Set config =db.Config	
	}
	Return config
}

}
