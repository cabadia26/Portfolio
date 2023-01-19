create or alter proc dbo.DevSectionToolGet(
@DevSectionToolId int = 0,
@All bit = 0,
@Message varchar (500) = '' output
)

as
begin

    select @DevSectionToolId = isnull(@DevSectionToolId, 0)
    declare @return int = 0 

    select distinct d.DevSectionId, d.DevSectionName, t.DevToolId, t.DevToolName, d.DevSectionSequence, t.DevToolSequence
    from DevSection d
    join DevSubsection ds 
    on d.DevSectionId = ds.DevSectionId
    join DevSubsectionTool dst
    on ds.DevSubsectionId = dst.DevSubsectionId
    join DevTool t
    on dst.DevToolId = t.DevToolId
    --where st.DevSectionToolId= @DevSectionToolId
    --or isnull(@All, 0) = 1
    order by d.DevSectionSequence, t.DevToolSequence 

    return @return
end 
go 

exec DevSectionToolGet