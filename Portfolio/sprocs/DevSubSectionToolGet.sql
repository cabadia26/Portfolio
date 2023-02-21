create or alter proc dbo.DevSubsectionToolGet(
@DevSubsectionToolId int = 0,
@All bit = 0,
@Message varchar(500)= '' output 
)
as 
begin 

    select @DevSubsectionToolId = isnull(@DevSubsectionToolId, 0)
    declare @return int = 0

        select dst.DevSubsectionToolId,ds.DevSubsectionName, ds.DevSubsectionId, t.DevToolId, t.DevToolName, t.DevToolCode, t.DevToolSequence
        from DevSubsectionTool dst 
        join DevSubsection ds 
        on dst.DevSubsectionId = ds.DevSubsectionId
        join DevTool t 
        on dst.DevToolId = t.DevToolId
        where dst.DevSubsectionToolId = @DevSubsectionToolId 
        or isnull(@All, 0) = 1
        order by ds.DevSubsectionSequence,ds.DevSubsectionCode, t.DevToolSequence

return @return

end 
go 


grant execute on DevSubsectionToolGet to portfolio_role

exec DevSubsectionToolGet @All =1