create table dbo.Employees (
	id_Employee int identity(1, 1) not null,
	id_Contractor int,
	FirstName nvarchar(50),
	LastName nvarchar(50),
	PhoneNumber nvarchar(50),
	EmailAddress nvarchar(50),
	CreatedAt datetime default getdate(),
	LastModified datetime,
	DeletedAt datetime,
	Active bit default 1 not null
	constraint PK_Employees primary key clustered
	(
		id_Employee asc
	)
);
go
create table dbo.Contractors (
	id_Contractor int identity(1, 1) not null,
	CompanyName nvarchar(50),
	ContactPerson nvarchar(50),
	PhoneNumber nvarchar(50),
	EmailAddress nvarchar(50),
	Vatid nvarchar(50),
	CreatedAt datetime default getdate(),
	LastModified datetime,
	DeletedAt datetime,
	Active bit default 1 not null
	constraint PK_Contractors primary key clustered
	(
		id_Contractor asc
	)
);
go
alter table dbo.Employees
add constraint [FK_Employees_Contractors]
foreign key ([id_Contractor]) references dbo.Contractors ([id_Contractor]);
go
create table dbo.Customers (
	id_Customer int identity(1, 1) not null,
	CustomerName nvarchar(50),
	ContactName nvarchar(50),
	PhoneNumber nvarchar(50),
	EmailAddress nvarchar(50),
	CreatedAt datetime default getdate(),
	LastModified datetime,
	DeletedAt datetime,
	Active bit default 1 not null
	constraint PK_Customers primary key clustered
	(
		id_Customer asc
	)
);
go
create table dbo.WorkAssignments (
	id_WorkAssignment int identity(1, 1) not null,
	id_Customer int,
	Title nvarchar(100),
	[Description] nvarchar(1000),
	Deadline datetime,
	InProgress bit default 0 not null,
	WorkStartedAt datetime,
	Completed bit default 0 not null,
	CompletedAt datetime,
	CreatedAt datetime default getdate(),
	LastModified datetime,
	DeletedAt datetime,
	Active bit default 1 not null
	constraint PK_WorkAssignments primary key clustered
	(
		id_WorkAssignment asc
	)
);
go
alter table dbo.WorkAssignments
add constraint [FK_WorkAssignments_Customers]
foreign key ([id_Customer]) references dbo.Customers ([id_Customer]);
go
create table dbo.TimeSheet (
	id_TimeSheet int identity(1, 1) not null,
	id_Customer int,
	id_Contractor int,
	id_Employee int,
	id_WorkAssignment int,
	StartTime datetime,
	StopTime datetime,
	Comments nvarchar(1000),
	CreatedAt datetime default getdate(),
	LastModified datetime,
	DeletedAt datetime,
	Active bit default 1 not null
	constraint PK_TimeSheet primary key clustered
	(
		id_TimeSheet asc
	)
);
go
alter table dbo.TimeSheet
add constraint [FK_TimeSheet_Customers]
foreign key ([id_Customer]) references dbo.Customers ([id_Customer]);
go
alter table dbo.TimeSheet
add constraint [FK_TimeSheet_Contractors]
foreign key ([id_Contractor]) references dbo.Contractors ([id_Contractor]);
go
alter table dbo.TimeSheet
add constraint [FK_TimeSheet_Employees]
foreign key ([id_Employee]) references dbo.Employees ([id_Employee]);
go
alter table dbo.TimeSheet
add constraint [FK_TimeSheet_WorkAssignments]
foreign key ([id_WorkAssignment]) references dbo.WorkAssignments ([id_WorkAssignment]);
go