create or alter proc dbo.DevToolTypeGet(
@DevToolTypeId int = 0,
@All bit = 0,
@Message varchar(500)='' output
)

as 
begin 

    select @DevToolTypeId = isnull(@DevToolTypeId, 0)
    declare @return int = 0

    select dtn.DevToolTypeId , dtn.DevToolTypeCode, dtn.DevToolTypeName, dtn.DevToolTypeSequence, dtn.ShowOnHomePage
    from DevToolType dtn
    where isnull(@All,0) = 1
    order by dtn.DevToolTypeSequence
    
return @return

end 
go 

grant execute on DevToolTypeGet to portfolio_role

exec DevToolTypeGet @All = 1