USE [master]
GO

/****** Object:  UserDefinedFunction [dbo].[splitString]    Script Date: 26.04.2020 23:36:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[splitString](@text VARCHAR(MAX),@seperator CHAR(1))
RETURNS
  @temptable TABLE(word varchar(max),seq int)
AS
BEGIN
       DECLARE @str VARCHAR(MAX)
	   DECLARE @position INT
	   DECLARE @i INT=0
	   WHILE CHARINDEX(' ',@text) >0
	   BEGIN
	     SET @i=@i+1
	     SELECT @position=CHARINDEX(@seperator,@text)
		 SELECT @str=SUBSTRING(@text,1,@position-1)

		 INSERT INTO @temptable
		 SELECT @str,@i

		 SELECT @text=SUBSTRING(@text,@position+1,LEN(@text)-@position)
	   END
	   SET @i=@i+1
	   INSERT INTO @temptable
	   SELECT @text,@i

   RETURN
END


GO


