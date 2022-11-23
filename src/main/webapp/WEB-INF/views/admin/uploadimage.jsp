<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Image</title>
</head>
<body>
	<form method="POST" enctype="multipart/form-data"
		action="uploadimagectl">
		File to upload: <input type="file" name="upfile"
			accept="image/jpg, image/png"><br /> Notes about the file: <input
			type="text" name="note"><br /> <br /> <input type="submit"
			value="Press"> to upload the file!
	</form>
</body>
</html>