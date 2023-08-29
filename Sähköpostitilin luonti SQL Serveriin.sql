USE MASTER 
GO 
SP_CONFIGURE 'show advanced options', 1 RECONFIGURE WITH OVERRIDE 
GO 

/* Enable Database Mail XPs Advanced Options in SQL Server */ 
SP_CONFIGURE 'Database Mail XPs', 1 
RECONFIGURE WITH OVERRIDE 
GO 

SP_CONFIGURE 'show advanced options', 0 
RECONFIGURE WITH OVERRIDE 
GO

--Sähköpostitilien ja profiilien tarkistus
EXECUTE msdb.dbo.sysmail_help_profileaccount_sp

-- Create a Database Mail account
EXECUTE msdb.dbo.sysmail_add_account_sp
    @account_name = 'Projektit Administrator',
    @description = 'Mail account for administrative e-mail.',
    @email_address = 'tero.kilpelainen1@outlook.com',
    @display_name = 'Projektit SQL Server maili',
    @mailserver_name = 'smtp.live.com' ;

-- Create a Database Mail profile
EXECUTE msdb.dbo.sysmail_add_profile_sp
    @profile_name = 'Projektit Administrator Profile',
    @description = 'Profile used for administrative mail.' ;

	-- Add the account to the profile
EXECUTE msdb.dbo.sysmail_add_profileaccount_sp
    @profile_name = 'Projektit Administrator Profile',
    @account_name = 'Projektit Administrator',
    @sequence_number =1 ;

-- Grant access to the profile to the DBMailUsers role
EXECUTE msdb.dbo.sysmail_add_principalprofile_sp
    @profile_name = 'Projektit Administrator Profile',
    @principal_name = 'public',
    @is_default = 1 ;

EXECUTE	msdb.dbo.sysmail_update_account_sp
  @account_id = 1, 
  @email_address = 'juha.sonck64@gmail.com',
  @mailserver_name = 'mail.inet.fi' ;


EXECUTE	msdb.dbo.sysmail_help_queue_sp @queue_type = 'Mail' ;

--Sähköpostilokin tarkistus
SELECT * FROM msdb.dbo.sysmail_event_log

--Viestien tilanteen tarkistus
SELECT * FROM msdb.dbo.sysmail_allitems

--Kaikki kentät
EXECUTE msdb.dbo.sysmail_update_account_sp
    ,@account_name = 'AdventureWorks Administrator'
    ,@description = 'Mail account for administrative e-mail.'
    ,@email_address = 'dba@Adventure-Works.com'
    ,@display_name = 'AdventureWorks Automated Mailer'
    ,@replyto_address = NULL
    ,@mailserver_name = 'smtp.Adventure-Works.com'
    ,@mailserver_type = 'SMTP'
    ,@port = 587
    ,@timeout = 60
    ,@username = NULL
    ,@password = NULL
    ,@use_default_credentials = 0
    ,@enable_ssl = 0;

EXECUTE msdb.dbo.sysmail_update_account_sp
	@account_id = 1, 
	@port = 25;