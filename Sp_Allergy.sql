
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Developer:		Sadeeq Bello
-- Create date:     1/25/25
-- Description:	Initial Process to pull Allergy data
--1/25/25 Adding parameter to the stored proc using the category field
-- =============================================
CREATE or alter PROCEDURE sp_PullAllergyData
	-- Add the parameters for the stored procedure here
 (@Category Varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP (1000) [START]
      ,[STOP]
      ,[PATIENT]
      ,[ENCOUNTER]
      ,[CODE]
      ,[SYSTEM]
      ,[DESCRIPTION]
      ,[TYPE]
      ,[CATEGORY]
      ,[REACTION1]
      ,[DESCRIPTION1]
      ,[SEVERITY1]
      ,[REACTION2]
      ,[DESCRIPTION2]
      ,[SEVERITY2]
  FROM [EmadeDev].[dbo].[allergies]
  Where Category = @category
END
GO
