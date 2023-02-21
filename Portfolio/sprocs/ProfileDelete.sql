create or alter procedure dbo.ProfileDelete(@ProfileId int, @Message VARCHAR(1000)= '' output)
AS
BEGIN

    DECLARE @return int = 0

    delete Profile  where ProfileId = @ProfileId

    RETURN @return
end 


go 

grant execute on ProfileDelete to portfolio_role