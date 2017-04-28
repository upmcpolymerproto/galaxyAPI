USE [galaxy_new]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		bonic
-- Create date: 2017-04-20
-- Description:	Get CoMIT Tags for a given Group Id
-- =============================================
ALTER PROCEDURE [dbo].[uspComitGetTagsByGroupId] (@groupId uniqueidentifier)

AS 

SELECT DISTINCT [Tag].[Id], [Tag].[Name] 
FROM [CoMIT_GroupTagPermission]
INNER JOIN [Tag] ON [CoMIT_GroupTagPermission].[TagId] = [Tag].[Id]
WHERE [CoMIT_GroupTagPermission].[GroupId] = @groupId;