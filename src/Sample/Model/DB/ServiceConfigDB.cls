Class Sample.Model.DB.ServiceConfigDB Extends %Persistent
{

Property ServiceName As %String;

Property SearchTable As %String;

Property Config As %DynamicArray;

Storage Default
{
<Data name="Config">
<Attribute>Config</Attribute>
<Structure>node</Structure>
<Subscript>"Config"</Subscript>
</Data>
<Data name="ServiceConfigDBDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ServiceName</Value>
</Value>
<Value name="3">
<Value>SearchTable</Value>
</Value>
</Data>
<DataLocation>^Sample.ModBB77.ServiceConfF4F7D</DataLocation>
<DefaultData>ServiceConfigDBDefaultData</DefaultData>
<ExtentSize>3</ExtentSize>
<IdLocation>^Sample.ModBB77.ServiceConfF4F7D</IdLocation>
<IndexLocation>^Sample.ModBB77.ServiceConfF4F7I</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Config">
<AverageFieldSize>90</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="SearchTable">
<AverageFieldSize>32.67</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ServiceName">
<AverageFieldSize>30</AverageFieldSize>
<OutlierSelectivity>.999999:"J"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Sample.ModBB77.ServiceConfF4F7S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
