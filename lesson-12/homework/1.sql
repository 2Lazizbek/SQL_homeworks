declare @sql nvarchar(max) = ''

select @sql = @sql + 
    'select 
        ''' + name + ''' as database_name,
        s.name as schema_name,
        t.name as table_name,
        c.name as column_name,
        type_name(c.user_type_id) as data_type
    from ' + quotename(name) + '.sys.tables t
    join ' + quotename(name) + '.sys.schemas s 
        on t.schema_id = s.schema_id
    join ' + quotename(name) + '.sys.columns c 
        on t.object_id = c.object_id
    union all '
from sys.databases
where name not in ('master', 'tempdb', 'model', 'msdb')

set @sql = left(@sql, len(@sql) - len('union all '))

exec sp_executesql @sql