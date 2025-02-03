
-- =============================================
-- Developer:		Sadeeq Bello
-- Create date:		1/25/2025
-- Description:	    Input parameter for Encounterclass 
-- =============================================
CREATE PROCEDURE sp_EncounterClass
@EncounterClass Varchar(50)

AS
BEGIN
Select* from Encounters
Where EncounterClass = @EncounterClass
END
GO
