select concat ('grant execute on ', r.specific_name, ' to portfolio_role ' ) from Information_schema.Routines r where r.SPECIFIC_NAME not like 'sp__%' and r.SPECIFIC_NAME not like 'fn__%'
union 
select concat('grant select on ',  t.TABLE_NAME, ' to portfolio_role ' )
from Information_Schema.Tables t
where t.TABLE_NAME not in ('sysdiagrams')