create or alter proc dbo.ProfileGet(
@ProfileId int = 0,
@All bit = 0,
@Message varchar (500) ='' output
)
as 
begin 

    select @ProfileId = isnull(@ProfileId, 0)
    declare @result int = 0

    select p.ProfileId, p.FirstName, p.LastName, p.PhoneNumber, p.EmailAddress, p.GitHubAccount, p.ProfileDesc, p.HasResume
    from Profile p
    where p.ProfileId = @ProfileId 
    or isnull(@All, 0) = 1

    return @result
end 
go 

exec ProfileGet
exec ProfileGet @All =1