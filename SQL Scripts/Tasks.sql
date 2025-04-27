USE [TaskManagerDB]
GO

/****** Object:  Table [dbo].[Tasks]    Script Date: 4/27/2025 2:50:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsCompleted] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Category] [nvarchar](100) NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Tasks] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO

ALTER TABLE [dbo].[Tasks] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO


