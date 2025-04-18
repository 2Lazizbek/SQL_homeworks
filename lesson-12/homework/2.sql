create procedure get_procedures_and_functions
    @database_name nvarchar(128) = null
as
begin
    set nocount on

    declare @sql nvarchar(max) = ''
    
    if @database_name is not null
    begin
        set @sql = '
        select 
            ''' + quotename(@database_name) + ''' as database_name,
            s.name as schema_name,
            p.name as procedure_name,
            case 
                when p.type = ''p'' then ''stored procedure''
                when p.type in (''fn'', ''if'', ''tf'') then ''function''
            end as object_type,
            param.name as parameter_name,
            type_name(param.user_type_id) as parameter_type,
            param.max_length as max_length
        from ' + quotename(@database_name) + '.sys.procedures p
        join ' + quotename(@database_name) + '.sys.schemas s 
            on p.schema_id = s.schema_id
        left join ' + quotename(@database_name) + '.sys.parameters param 
            on p.object_id = param.object_id
        union all
        select 
            ''' + quotename(@database_name) + ''' as database_name,
            s.name as schema_name,
            p.name as procedure_name,
            ''function'' as object_type,
            param.name as parameter_name,
            type_name(param.user_type_id) as parameter_type,
            param.max_length as max_length
        from ' + quotename(@database_name) + '.sys.objects p
        join ' + quotename(@database_name) + '.sys.schemas s 
            on p.schema_id = s.schema_id
        left join ' + quotename(@database_name) + '.sys.parameters param 
            on p.object_id = param.object_id
        where p.type in (''fn'', ''if'', ''tf'')'
    end
    else
    begin
        select @sql = @sql + 
            'select 
                ''' + quotename(name) + ''' as database_name,
                s.name as schema_name,
                p.name as procedure_name,
                case 
                    when p.type = ''p'' then ''stored procedure''
                    when p.type in (''fn'', ''if'', ''tf'') then ''function''
                end as object_type,
                param.name as parameter_name,
                type_name(param.user_type_id) as parameter_type,
                param.max_length as max_length
            from ' + quotename(name) + '.sys.procedures p
            join ' + quotename(name) + '.sys.schemas s 
                on p.schema_id = s.schema_id
            left join ' + quotename(name) + '.sys.parameters param 
                on p.object_id = param.object_id
            union all
            select 
                ''' + quotename(name) + ''' as database_name,
                s.name as schema_name,
                p.name as procedure_name,
                ''function'' as object_type,
                param.name as parameter_name,
                type_name(param.user_type_id) as parameter_type,
                param.max_length as max_length
            from ' + quotename(name) + '.sys.objects p
            join ' + quotename(name) + '.sys.schemas s 
                on p.schema_id = s.schema_id
            left join ' + quotename(name) + '.sys.parameters param 
                on p.object_id = param.object_id
            where p.type in (''fn'', ''if'', ''tf'')
            union all '
        from sys.databases
        where name not in ('master', 'tempdb', 'model', 'msdb')

        set @sql = left(@sql, len(@sql) - len('union all '))
    end

    exec sp_executesql @sql
end