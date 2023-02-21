create or alter procedure dbo.DevSectionSearch(@SearchCriteria varchar(1000), @Message varchar(1000) = '' output)
as 
begin 

    declare @return int = 0

    select *
    from DevSection ds
    where ds.DevSectionName like '%' + @SearchCriteria + '%'
    RETURN @return
end
go 

grant execute on DevSectionSearch to portfolio_role

exec DevSectionSearch @SearchCriteria = 'Database Schema'