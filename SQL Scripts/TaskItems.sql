USE [TaskManagerDB]
GO

/****** Object:  Table [dbo].[TaskItems]    Script Date: 4/27/2025 2:49:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TaskItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Category] [nvarchar](100) NULL,
	[IsCompleted] [bit] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[PriorityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TaskItems] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO

ALTER TABLE [dbo].[TaskItems] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO

ALTER TABLE [dbo].[TaskItems] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO

ALTER TABLE [dbo].[TaskItems]  WITH CHECK ADD  CONSTRAINT [FK_TaskItems_Priority] FOREIGN KEY([PriorityId])
REFERENCES [dbo].[TaskItemPriority] ([Id])
GO

ALTER TABLE [dbo].[TaskItems] CHECK CONSTRAINT [FK_TaskItems_Priority]
GO


