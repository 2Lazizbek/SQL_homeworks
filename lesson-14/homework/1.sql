declare @html_body nvarchar(max)

set @html_body = '
<html>
<head>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            font-family: Arial, sans-serif;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h2>Index Metadata Report</h2>
    <table>
        <tr>
            <th>Table Name</th>
            <th>Index Name</th>
            <th>Index Type</th>
            <th>Column Name</th>
            <th>Column Type</th>
        </tr>'

select @html_body = @html_body + 
    '<tr>' +
    '<td>' + quotename(s.name) + '.' + quotename(t.name) + '</td>' +
    '<td>' + i.name + '</td>' +
    '<td>' + i.type_desc + '</td>' +
    '<td>' + c.name + '</td>' +
    '<td>' + type_name(c.user_type_id) + 
        case 
            when c.max_length > 0 then ' (' + cast(c.max_length as varchar(10)) + ')'
            else ''
        end + '</td>' +
    '</tr>'
from sys.tables t
join sys.schemas s 
    on t.schema_id = s.schema_id
join sys.indexes i 
    on t.object_id = i.object_id
join sys.index_columns ic 
    on i.object_id = ic.object_id 
    and i.index_id = ic.index_id
join sys.columns c 
    on ic.object_id = c.object_id 
    and ic.column_id = c.column_id
where i.type > 0 -- Exclude heaps
order by s.name, t.name, i.name, ic.key_ordinal

set @html_body = @html_body + '
    </table>
</body>
</html>'

exec msdb.dbo.sp_send_dbmail
    @profile_name = 'DefaultMailProfile',
    @recipients = 'lazizbek26052007@example.com',
    @subject = 'Index Metadata Report',
    @body = @html_body,
    @body_format = 'HTML'