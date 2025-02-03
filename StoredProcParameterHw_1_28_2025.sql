
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Developer:		<SadeeqBello>
-- Create date:		<1/28/2025>
-- Description:	<Creating Input Parameter for Observations>
-- =============================================
CREATE PROCEDURE sp_Observation
(@Category Varchar(50))

AS
BEGIN
Select * from Observations
Where Category = @Category

END
GO
