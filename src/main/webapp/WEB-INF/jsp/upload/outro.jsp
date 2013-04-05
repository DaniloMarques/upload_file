<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery File Upload Example</title>
</head>
<body>
	<form id="file_upload" action="upload/file" method="POST"
		enctype="multipart/form-data">
		<div id="drop_zone_1">
			<input id="file_1" type="file" name="file_1" multiple>
			<div>Upload files</div>
		</div>
		<div id="drop_zone_2">
			<input id="file_2" type="file" name="file_2" multiple>
			<div>Upload files</div>
		</div>
		<div id="drop_zone_3">
			<input id="file_3" type="file" name="file_3" multiple>
			<div>Upload files</div>
		</div>
		<button>Upload</button>

		<table id="files_1" style="background: yellow;"></table>
		<table id="files_2" style="background: gold;"></table>
		<table id="files_3" style="background: orange;"></table>
	</form>


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.widget.js"></script>
	<script src="js/jquery-ui-1.9.0.custom.js"></script>
	<script src="js/jquery.fileupload.js"></script>
	<script src="js/jquery.fileupload-ui.js"></script>
	<script>
		/*global $ */
		$(function() {
			var initFileUpload = function(suffix) {
				$('#file_upload')
						.fileUploadUI(
								{
									namespace : 'file_upload_' + suffix,
									fileInputFilter : '#file_' + suffix,
									dropZone : $('#drop_zone_' + suffix),
									uploadTable : $('#files_' + suffix),
									downloadTable : $('#files_' + suffix),
									buildUploadRow : function(files, index) {
										return $('<tr><td>'
												+ files[index].name
												+ '<\/td>'
												+ '<td class="file_upload_progress"><div><\/div><\/td>'
												+ '<td class="file_upload_cancel">'
												+ '<button class="ui-state-default ui-corner-all" title="Cancel">'
												+ '<span class="ui-icon ui-icon-cancel">Cancel<\/span>'
												+ '<\/button><\/td><\/tr>');
									},
									buildDownloadRow : function(file) {
										return $('<tr><td>' + file.name
												+ '<\/td><\/tr>');
									}
								});
			};
			initFileUpload(1);
			initFileUpload(2);
			initFileUpload(3);
		});
	</script>

</body>
</html>