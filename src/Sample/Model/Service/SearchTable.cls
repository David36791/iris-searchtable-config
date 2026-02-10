Class Sample.Model.Service.SearchTable Extends %RegisteredObject
{

ClassMethod SearchTableOperation(config)
{
	Try{

		Set name =config.SearchTableName
		Set resquest=config.Config
		Set total = 0,flag =0
		&SQL(select count(1) into :total from %Dictionary.ClassDefinition where id =:name )
		if total{
			//update
			set class=##class(%Dictionary.ClassDefinition).%OpenId(name)
			do class.Parameters.Clear()
			do class.Properties.Clear()
			dO class.Indices.Clear()
			Do class.Methods.Clear()
		
		}else{
			// creat
			Set flag =1
			if $L(name)=0 Set name = "Demo.SearchTable.Time"_$SYSTEM.SQL.DATEDIFF("ms","1970-01-01 00:00:00.000",$zdatetime($ztimestamp,3,,3))
			Set class = ##class(%Dictionary.ClassDefinition).%New()
			Set class.Name=name
			Set class.Super="Ens.CustomSearchTable"
			Set class.ProcedureBlock=1
			Set Service =##class(Sample.Model.Service.Services).%New()
			Set tsc= Service.SaveService(config.ServiceName,name)
			Set config.SearchTableName =name
		}
		Set DBService = ##class(Sample.Model.Service.CreateDBService).%New()
		Set msg =DBService.Creat(config)
		
		// paramter
		Set Parameter = ##class(%Dictionary.ParameterDefinition).%New()
		Set Parameter.Name="DOCCLASS"
		Set Parameter.Default="EnsLib.EDI.XML.Document"
		do class.Parameters.Insert(Parameter)
		
		/// method
		
		
		Set method = ##class(%Dictionary.MethodDefinition).%New()
		set method.FormalSpec="pDocObj:EnsLib.EDI.XML.Document,pSearchTable:"_name_""
		Set method.Name = "OnIndexDoc"
		Set method.ReturnType="%Status"
		Set method.ClassMethod=1

		Set imp = method.Implementation
		do imp.MoveToEnd()
		Set method.Implementation = imp
		
		Set iter =resquest.%GetIterator()
		while iter.%GetNext(.key , .value )	{
			// Property
			Set Property = ##class(%Dictionary.PropertyDefinition).%New()
			Set Property.Name=value.name
			Set Property.Type="%String"
			//do Property.Parameters.SetAt("EXACT","COLLATION")
			do class.Properties.Insert(Property)
			// write code
			do imp.WriteLine("		Set "_value.name_"path = """_value.path_"""")
			do imp.WriteLine("		Set "_value.name_" = pDocObj.GetValueAt("_value.name_"path)")
			do imp.WriteLine("		Set pSearchTable."_value.name_" = "_value.name)
			
		}
		do imp.WriteLine("	Quit $$$OK")

		Do class.Methods.Insert(method)
		set tsc = class.%Save()	
	    Set tsc= $System.OBJ.Compile(class.Name)

	}Catch e{
		zw e.DisplayString()
		
	}
	quit $$$OK
}

}
