Class Sample.Production.ProductionTest Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Sample.Production.ProductionTest" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Sample.Production.Demo.Service" Category="" ClassName="Sample.Production.Demo.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">Sample.Production.Demo.Process</Setting>
  </Item>
  <Item Name="Sample.Production.Operation" Category="" ClassName="Sample.Production.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Sample.Production.Demo.Process" Category="" ClassName="Sample.Production.Demo.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
