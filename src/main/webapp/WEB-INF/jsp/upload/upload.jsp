<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/jquery.ui.widget.js"></script>
<script src="js/jquery.fileupload.js"></script>
<script src="js/jquery.fileupload-fp.js"></script>
<script src="js/jquery.iframe-transport.js"></script>
<title>Upload File</title>
</head>
<body>
	<form id="fileupload" action="<c:url value="upload/file"/>"
		method="POST" enctype="multipart/form-data">
		<input id="file" type="file" name="files[]" multiple> <input
			type="submit" />
	</form>
	<br /> tempo restante:
	<span id="time"></span>

	<div id="progress" class="progress progress-striped active"
		style="width: 30%">
		<div class='barall' style='width: 0%'></div>
		<br />
	</div>

</body>
<script>
	
	$('#fileupload').fileupload();

	$('#fileupload').fileupload('option', {
		url : 'upload/file',
		maxFileSize : 5000000,
		process : [ {
			action : 'load',
			maxFileSize : 20000000
		}, {
			action : 'resize',
			maxWidth : 1440,
			maxHeight : 900
		}, {
			action : 'save'
		} ]
	});
</script>
<style type="text/css">
.bar {
	background-color: #d0e4fe;
}

#progress .barall {
	background-color: #d0e4fe;
}
</style>
</html>