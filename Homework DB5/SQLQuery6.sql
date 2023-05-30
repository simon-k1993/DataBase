SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE CreateGradeDetail

	@GradeID INT,
	@AchievementTypeID INT,
	@AchievementPoints INT,
	@AchievementMaxPoints INT,
	@AchievementDate DATE
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO GradeDetails (GradeID, AchievementTypeId, AchievementPoints, AchievementMaxPoints, AchievementDate)
	VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate);

	DECLARE @TotalGradePoints DECIMAL(18, 2);

	SELECT @TotalGradePoints = SUM(CAST(gd.AchievementPoints AS DECIMAL(18, 2)) / CAST(gd.AchievementMaxPoints AS DECIMAL(18, 2)) * CAST(a.ParticipationRate AS DECIMAL(18, 2)))
  FROM
    GradeDetails gd
    INNER JOIN AchievementType a ON GD.AchievementTypeId = a.Id
  WHERE
    gd.GradeID = @GradeID;

  SELECT @TotalGradePoints AS TotalGradePoints;
END
GO

EXEC CreateGradeDetail
  @GradeID = 1,
  @AchievementTypeID = 1,
  @AchievementPoints = 80,
  @AchievementMaxPoints = 100,
  @AchievementDate = '11.11.2023'
 GO

 EXEC CreateGradeDetail
  @GradeID = 2,
  @AchievementTypeID = 3,
  @AchievementPoints = 70,
  @AchievementMaxPoints = 100,
  @AchievementDate = '10.09.2013'
 GO