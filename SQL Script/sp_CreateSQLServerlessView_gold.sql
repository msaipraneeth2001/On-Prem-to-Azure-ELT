    USE gold_db
    GO

    CREATE OR ALTER PROC CreateSQLServerlessView_gold @ViewName NVARCHAR(100)
    AS
    BEGIN

    DECLARE @statement VARCHAR(MAX)

        SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName +'  AS
            SELECT *
            FROM
                OPENROWSET(
                    BULK ''https://<yourdatalake>.dfs.core.windows.net/gold/SalesLT/' + @ViewName + '/'',
                    FORMAT = ''DELTA''
                ) as [result]
        '

    EXEC (@statement)

    END
    GO
