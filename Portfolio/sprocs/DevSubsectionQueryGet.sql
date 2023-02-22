create or alter procedure dbo.DevSubsectionQueryGet(
 @DevSubsectionQueryId int = 0,
 @All bit = 0,
 @Message varchar(500) = '' output
)
as 
begin 

select q.DevSubsectionQueryId, q.DevSubsectionId, s.DevSubsectionCode, q.DevSubsectionQueryCaption, q.DevSubsectionQueryText, q.DevSubsectionQuerySequence
from DevSubsectionQuery q 
join DevSubsection s 
on s.DevSubsectionId = q.DevSubsectionid
order by s.DevSubsectionSequence, q.DevSubsectionQuerySequence

end

go 

exec DevSubsectionQueryGet @All = 1


