create or alter procedure dbo.DevSectionToolSearch(@SearchCriteria varchar(1000), @Message varchar(1000) = '' output)
as 
begin 

    declare @return int = 0

    select *
    from DevSectionTool dst
    join DevTool t 
    on t.DevToolId = dst.DevToolId
    join DevSection ds 
    on ds.DevSectionId = dst.DevSectionId
    where t.DevToolName like '%' + @SearchCriteria + '%'
    RETURN @return
end
go 

exec DevSectionToolSearch @SearchCriteria = 'HTML'