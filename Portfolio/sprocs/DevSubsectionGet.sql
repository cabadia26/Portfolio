create or alter proc dbo.DevSubsectionGet(
@DevSubsectionId int = 0,
@All bit = 0,
@Message varchar(500)= '' output
)

as 
begin 
select @DevSubsectionId = isnull(@DevSubsectionId, 0)
declare @return int = 0

select ds.DevSubsectionId, 
ds.DevSectionId, 
d.DevSectionCode, 
ds.DevSubsectionCode, 
ds.DevSubsectionName, 
ds.DevSubsectionDesc, 
GitHubRepoName = concat((select top 1 p.GitHubAccount from Profile p),('/'), ds.GitHubRepoName), 
ds.DevSubsectionSequence
from DevSubsection ds
join DevSection d 
on d.DevSectionId = ds.DevSectionId
where ds.DevSubsectionId= @DevSubsectionId
or isnull(@All, 0) = 1
order by ds.DevSubsectionSequence
return @return
end 
go 

exec DevSubsectionGet @All = 1