


IF NOT EXISTS (SELECT * FROM sys.database_credentials WHERE name = 'StorageCredential') 
	CREATE DATABASE SCOPED CREDENTIAL StorageCredential WITH 
	IDENTITY = 'SHARED ACCESS SIGNATURE',
	SECRET = '#DATALAKESTORAGEKEY#' 
GO

IF NOT EXISTS (SELECT * FROM sys.database_credentials WHERE name = 'WorkspaceIdentity') 
    CREATE DATABASE SCOPED CREDENTIAL WorkspaceIdentity WITH 
    IDENTITY = 'Managed Identity'  
GO


IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'ASAMCWModelStorage') 
	CREATE EXTERNAL DATA SOURCE [ASAMCWModelStorage] 
	WITH (
		LOCATION = 'abfss://wwi-02@#DATALAKESTORAGEACCOUNTNAME#.dfs.core.windows.net', 
		CREDENTIAL =  WorkspaceIdentity
	)
GO

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
GO

/*
CREATE EXTERNAL TABLE [wwi_mcw].[ASAMCWMLModelExt]([Model] [varbinary](max) NULL) WITH(
    LOCATION = 'ml/onnx-hex',
	DATA_SOURCE = [ASAMCWModelStorage],
    FILE_FORMAT = csv,
    REJECT_TYPE = VALUE,
    REJECT_VALUE = 0
) 


CREATE TABLE [wwi_mcw].[ASAMCWMLModel](
    [Id] [int] IDENTITY(1, 1) NOT NULL,
    [Model] [varbinary](max) NULL,
    [Description] [varchar](200) NULL
) WITH(DISTRIBUTION = REPLICATE, HEAP)

*/