IF NOT EXISTS (SELECT * FROM sys.change_tracking_tables WHERE object_id = OBJECT_ID(N'[dbo].[Table2]')) 
   ALTER TABLE [dbo].[Table2] 
   ENABLE  CHANGE_TRACKING
GO
