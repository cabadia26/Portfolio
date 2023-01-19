create or alter procedure dbo.DevToolDelete(@DevToolId int, @Message VARCHAR(1000)= '' output)
as
begin

    declare @return int = 0
   
    delete DevSectionTool where DevToolId = @DevToolId
    delete DevSubsectionTool where DevToolId = @DevToolId
    delete DevTool  where DevToolId = @DevToolId

    RETURN @return
end 


go 
