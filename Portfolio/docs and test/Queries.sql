use PortfolioDB
go 

select * from profile p
select * from DevSection d order by d.DevSectionSequence
select * from DevSubsection ds
select * from DevTool dt order by dt.DevToolSequence

select d.DevSectionName, ds.DevSubsectionName, t.DevToolName
from DevSection d 
join DevSubsection ds
on d.DevSectionId = ds.DevSectionId
join DevSubSectionTool dst
on ds.DevSubsectionId = dst.DevSubsectionId
join DevTool t
on ds.DevSubsectionId = dst.DevSubsectionId
join DevTool dt
on dt.DevToolId = dst.DevToolId
order by d.DevSectionSequence, ds.DevSubsectionSequence,ds.DevSubsectionName, dt.DevToolSequence

select distinct d.DevSectionName, t.DevToolName,  d.DevSectionSequence, t.DevToolSequence
from DevSection d
join DevSubsection ds
on d.DevSectionId = ds.DevSectionId
join DevSubsectionTool dst
on ds.DevSubsectionId = dst.DevSubsectionId
join DevTool t
on t.DevToolId = dst.DevToolId
order by d.DevSectionSequence, t.DevToolSequence