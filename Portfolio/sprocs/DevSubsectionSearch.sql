create or alter procedure dbo.DevSubsectionSearch(@SearchCriteria varchar(1000), @Message varchar(1000) = '' output)
as 
begin 

    declare @return int = 0

    select *
    from DevSubsection ds
    where ds.DevSubsectionCode like '%' + @SearchCriteria + '%'
    RETURN @return
end
go 

exec DevSubsectionSearch @SearchCriteria = 'bookstoredb'