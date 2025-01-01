-- Created a VIEW named Calendar for Calendar data
CREATE VIEW GoldLayer.Calendar
AS
SELECT * FROM OPENROWSET (
    BULK('https://advworksdatalake.dfs.core.windows.net/transformed-data-silver-level/AdvWorks_Calendar/'),
    FORMAT = 'PARQUET'
) AS query1

-- Created a VIEW name Customer for Customer data
CREATE VIEW GoldLayer.Customer
AS
SELECT * FROM OPENROWSET (
    BULK('https://advworksdatalake.dfs.core.windows.net/transformed-data-silver-level/AdvWorks_Customers/'),
    FORMAT = 'PARQUET'
) as query2

-- Created a VIEW name for Product Categories data
CREATE VIEW GoldLayer.ProductCategory
AS
SELECT * FROM OPENROWSET (
    BULK('https://advworksdatalake.dfs.core.windows.net/transformed-data-silver-level/AdvWorks_ProductCategories/'),
    FORMAT = 'PARQUET'
) as query3

-- Created a VIEW name for Products data
CREATE VIEW GoldLayer.Product
AS
SELECT * FROM OPENROWSET (
    BULK('https://advworksdatalake.dfs.core.windows.net/transformed-data-silver-level/AdvWorks_Products/'),
    FORMAT = 'PARQUET'
) as query4

-- Created a VIEW name for Product Subcategories data
CREATE VIEW GoldLayer.ProdSub
AS
SELECT * FROM OPENROWSET (
    BULK('https://advworksdatalake.dfs.core.windows.net/transformed-data-silver-level/AdvWorks_ProductSubcategories/'),
    FORMAT = 'PARQUET'
) as query5

-- Created a VIEW name for Returns data
CREATE VIEW GoldLayer.Returns
AS
SELECT * FROM OPENROWSET (
    BULK('https://advworksdatalake.dfs.core.windows.net/transformed-data-silver-level/AdvWorks_Returns/'),
    FORMAT = 'PARQUET'
) as query6

-- Created a VIEW name for Territory data
CREATE VIEW GoldLayer.Territory
AS
SELECT * FROM OPENROWSET (
    BULK('https://advworksdatalake.dfs.core.windows.net/transformed-data-silver-level/AdvWorks_Territory/'),
    FORMAT = 'PARQUET'
) as query7

-- Created a VIEW name for Sales data
CREATE VIEW GoldLayer.Sales
AS
SELECT * FROM OPENROWSET (
    BULK('https://advworksdatalake.dfs.core.windows.net/transformed-data-silver-level/AdvWorks_Sales/'),
    FORMAT = 'PARQUET'
) as query8