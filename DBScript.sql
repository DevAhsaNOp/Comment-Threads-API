USE [master]
GO

CREATE DATABASE [Practice]

USE [Practice]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NULL,
	[ParentCommentID] [int] NULL,
	[Text] [text] NULL,
	[CreatedAt] [datetime] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NULL,
	[Content] [text] NULL,
	[CreatedAt] [datetime] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentID], [PostID], [ParentCommentID], [Text], [CreatedAt], [UserID]) VALUES (1, 1, NULL, N'This is a comment on the first post.', CAST(N'2023-10-01T09:30:00.000' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [PostID], [ParentCommentID], [Text], [CreatedAt], [UserID]) VALUES (2, 1, 1, N'I like this post!', CAST(N'2023-10-01T10:15:00.000' AS DateTime), 3)
INSERT [dbo].[Comments] ([CommentID], [PostID], [ParentCommentID], [Text], [CreatedAt], [UserID]) VALUES (3, 1, 2, N'Great job on the second post.', CAST(N'2023-10-02T10:45:00.000' AS DateTime), 4)
INSERT [dbo].[Comments] ([CommentID], [PostID], [ParentCommentID], [Text], [CreatedAt], [UserID]) VALUES (4, 3, NULL, N'Nice content in this post.', CAST(N'2023-10-02T11:30:00.000' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [PostID], [ParentCommentID], [Text], [CreatedAt], [UserID]) VALUES (5, 1, 3, N'I found the cool post!', CAST(N'2023-10-03T15:00:00.000' AS DateTime), 2)
INSERT [dbo].[Comments] ([CommentID], [PostID], [ParentCommentID], [Text], [CreatedAt], [UserID]) VALUES (6, 5, NULL, N'Looking forward to more posts.', CAST(N'2023-10-04T16:45:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [PostID], [ParentCommentID], [Text], [CreatedAt], [UserID]) VALUES (7, 6, NULL, N'Interesting topic discussed.', CAST(N'2023-10-05T19:15:00.000' AS DateTime), 3)
INSERT [dbo].[Comments] ([CommentID], [PostID], [ParentCommentID], [Text], [CreatedAt], [UserID]) VALUES (8, 1, 5, N'I agree with your point.', CAST(N'2023-10-05T20:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [PostID], [ParentCommentID], [Text], [CreatedAt], [UserID]) VALUES (9, 8, NULL, N'New content is awesome!', CAST(N'2023-10-07T23:30:00.000' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [PostID], [ParentCommentID], [Text], [CreatedAt], [UserID]) VALUES (10, 9, NULL, N'This post is indeed important.', CAST(N'2023-10-08T10:00:00.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([PostID], [Title], [Content], [CreatedAt], [UserID]) VALUES (1, N'First Post', N'This is the content of the first post.', CAST(N'2023-10-01T08:00:00.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [CreatedAt], [UserID]) VALUES (2, N'Second Post', N'The second post has some content.', CAST(N'2023-10-02T09:15:00.000' AS DateTime), 2)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [CreatedAt], [UserID]) VALUES (3, N'Another Post', N'This is another post with different content.', CAST(N'2023-10-02T10:30:00.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [CreatedAt], [UserID]) VALUES (4, N'A Cool Post', N'Check out this cool post!', CAST(N'2023-10-03T14:45:00.000' AS DateTime), 3)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [CreatedAt], [UserID]) VALUES (5, N'Latest Post', N'The most recent post is here.', CAST(N'2023-10-04T16:00:00.000' AS DateTime), 2)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [CreatedAt], [UserID]) VALUES (6, N'Interesting Post', N'Here is an interesting post for you.', CAST(N'2023-10-05T18:30:00.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [CreatedAt], [UserID]) VALUES (7, N'Exciting Post', N'This post will excite you!', CAST(N'2023-10-06T20:45:00.000' AS DateTime), 3)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [CreatedAt], [UserID]) VALUES (8, N'New Content', N'New content is available now.', CAST(N'2023-10-07T22:00:00.000' AS DateTime), 2)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [CreatedAt], [UserID]) VALUES (9, N'Important Post', N'Don''t miss this important post.', CAST(N'2023-10-08T09:30:00.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [CreatedAt], [UserID]) VALUES (10, N'Final Post', N'This is the last post in the series.', CAST(N'2023-10-09T11:45:00.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (1, N'Ahsan')
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (2, N'Ali')
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (3, N'Ahmed')
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (4, N'Hassan')
INSERT [dbo].[Users] ([UserID], [UserName]) VALUES (5, N'Waleed')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([ParentCommentID])
REFERENCES [dbo].[Comments] ([CommentID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [Practice] SET  READ_WRITE 
GO
