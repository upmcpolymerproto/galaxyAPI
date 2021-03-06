USE [galaxy_new]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		bonic
-- Create date: 2017-04-20
-- Description:	Get CoMIT Tag Permissions for a given Group Id and Tag Id
-- =============================================
ALTER PROCEDURE [dbo].[uspComitGetTagPermissions] (@tagId uniqueidentifier, @groupId uniqueidentifier)

AS 

SELECT 
	[Permission].[Id], [Permission].[Value], [PermissionType].[Id] AS [PermissionTypeId], 
	[PermissionType].[Code], [PermissionType].[Name], [PermissionType].[IsSystemPermission] 
FROM [CoMIT_GroupTagPermission]
	INNER JOIN [Permission] ON [CoMIT_GroupTagPermission].[PermissionId] = [Permission].[Id]
	INNER JOIN [PermissionType] ON [Permission].[PermissionTypeId] = [PermissionType].[Id]
WHERE [CoMIT_GroupTagPermission].[TagId] = @tagId AND [CoMIT_GroupTagPermission].[GroupId] = @groupId;