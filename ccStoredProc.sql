use ccport
go
drop procedure if exists sp_ins_visitor
go
create procedure sp_ins_visitor
@Name nchar(50),
@Email nchar(50),
@Message nchar(200)
as
insert into [dbo].[visitor]
				([Name]
				,[Email]
				,[Message])
			values
				(@Name
				,@Email
				,@Message)
go

/*exec sp_ins_visitor 'bob', 'bob@me.com', 'this is funner!'

select * from visitor*/

CREATE LOGIN [CCApp] WITH PASSWORD='Pa$$w0rd', DEFAULT_DATABASE=[ccport]
go
use ccport
go
CREATE USER [CCApp] FOR LOGIN [CCApp] WITH DEFAULT_SCHEMA=[dbo]
GO
grant execute on sp_ins_visitor to CCApp
go
