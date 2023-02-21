create or alter proc dbo.DevSubsectionElementGet(
    @DevSubsectionElementId int = 0,
    @All bit = 0,
    @Message varchar(500) = '' output 
)
as 
begin 
    select 
    d.DevSubsectionElementId,
    d.DevSubsectionId,
    s.DevSubsectionCode,
    d.DevSubSectionElementCode,
    d.ButtonText,
    d.HtmlTag,
    d.FileExtension, 
    DevSubsectionElementSequence = row_number() over (partition by s.DevSubsectionCode order by d.DevSubsectionElementPriority)
    from DevSubsectionElement d 
    join DevSubsection s 
    on s.DevSubsectionId = d.DevSubsectionId
    where d.DevSubsectionElementId = isnull(@DevSubsectionElementId, 0)
    or @All = isnull(@All, 0)
    order by s.DevSubsectionCode, DevSubsectionElementSequence
end 

go 

grant execute on DevSubsectionElementGet to portfolio_role

exec DevSubsectionElementGet @All = 1