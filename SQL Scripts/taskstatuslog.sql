USE [TaskManagerDB]
GO

/****** Object:  Table [dbo].[TaskStatusLog]    Script Date: 4/27/2025 2:50:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TaskStatusLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskItemId] [int] NULL,
	[StatusChange] [bit] NOT NULL,
	[ChangedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TaskStatusLog] ADD  DEFAULT (getdate()) FOR [ChangedAt]
GO

ALTER TABLE [dbo].[TaskStatusLog]  WITH CHECK ADD FOREIGN KEY([TaskItemId])
REFERENCES [dbo].[TaskItems] ([Id])
GO


