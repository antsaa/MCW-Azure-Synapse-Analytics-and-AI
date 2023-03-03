


IF NOT EXISTS (SELECT * FROM sys.database_credentials WHERE name = 'StorageCredential') 
	CREATE DATABASE SCOPED CREDENTIAL StorageCredential WITH 
	IDENTITY = 'SHARED ACCESS SIGNATURE',
	SECRET = '#DATALAKESTORAGEKEY#' 


IF NOT EXISTS (SELECT * FROM sys.database_credentials WHERE name = 'WorkspaceIdentity') 
    CREATE DATABASE SCOPED CREDENTIAL WorkspaceIdentity WITH 
    IDENTITY = 'Managed Identity'  



IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'ASAMCWModelStorage') 
	CREATE EXTERNAL DATA SOURCE [ASAMCWModelStorage] 
	WITH (
		LOCATION = 'abfss://wwi-02@#DATALAKESTORAGEACCOUNTNAME#.dfs.core.windows.net', 
		CREDENTIAL =  WorkspaceIdentity
	)


IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'csv') 
CREATE EXTERNAL FILE FORMAT csv WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '',
        DATE_FORMAT = '',
        USE_TYPE_DEFAULT = False
    )
) 
