create or alter proc dbo.DevSectionGet(
@DevSectionId int = 0,
@All bit = 0,
@Message varchar (500) = '' output 
)

as 
begin 

    select @DevSectionId = isnull(@DevSectionId, 0)

    declare @return int = 0

    select d.DevSectionId, d.DevSectionCode, d.DevSectionName, d.DevSectionOverview, d.DevSectionBlurb, d.HasPicture, d.DevSectionSequence
    from DevSection d
    where d.DevSectionId= @DevSectionId
    or isnull(@All, 0) = 1
    order by d.DevSectionSequence

    return @return 

end

go 

exec DevSectionGet
exec DevSectionGet @All =1