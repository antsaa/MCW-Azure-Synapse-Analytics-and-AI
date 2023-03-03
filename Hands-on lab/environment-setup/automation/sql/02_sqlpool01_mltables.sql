

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

