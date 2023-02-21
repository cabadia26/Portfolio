create or alter procedure dbo.DevToolGet(
 @DevToolId int = 0,
 @DevSubsectionCode varchar(25) = '',
 @All bit = 0,
 @Message varchar(500) = '' output
)

as
begin
    declare @DevSubsectionId int
    
    if(isnull(@DevSubsectionCode,'') != '')
    begin
        select @DevSubsectionId = s.DevSubsectionId
        from DevSubsection s
        where s.DevSubsectionCode = @DevSubsectionCode
    end

 select @DevSubsectionId = isnull(@DevSubsectionId, 0)
    
    if @DevSubsectionId != 0 
    begin
        select @All = 1
    end

 select
    t.DevToolId,
    dt.DevToolTypeCode,
    dt.DevToolTypeName,
    t.DevToolCode,
    t.DevToolName,
    t.HasIcon
 from DevTool t
 join DevToolType dt
 on t.DevToolTypeId = dt.DevToolTypeId
 left join DevSubsectionTool st
 on st.DevToolId = t.DevToolId
 and st.DevSubsectionId = @DevSubsectionId
 where
 (isnull(@All,0) = 1 or t.DevToolId = isnull(@DevToolId,0))
 and (@DevSubsectionId = 0 or st.DevSubsectionId is not null)
 order by dt.DevToolTypeSequence, t.DevToolSequence
end
go


grant execute on DevToolGet to portfolio_role
exec DevToolGet @All = 1

exec DevToolGet @All = 0, @DevSubsectionCode = 'recipeweb'
