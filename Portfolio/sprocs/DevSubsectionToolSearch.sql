create or alter procedure dbo.DevSubsectionToolSearch(@SearchCriteria varchar(1000), @Message varchar(1000) = '' output)
as 
begin 

    declare @return int = 0

    select *
    from DevSubsectionTool dst
    join DevTool t
    on t.DevToolId = dst.DevToolId
    where t.DevToolName like '%' + @SearchCriteria + '%'
    RETURN @return
end
go 


grant execute on DevSubsectionToolSearch to portfolio_role

exec DevSubsectionToolSearch @SearchCriteria = 'Dapper'