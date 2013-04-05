<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>jQuery File Upload Demo</title>
<meta name="description"
	content="File Upload widget with multiple file selection, drag&amp;drop support, progress bar and preview images for jQuery. Supports cross-domain, chunked and resumable file uploads. Works with any server-side platform (Google App Engine, PHP, Python, Ruby on Rails, Java, etc.) that supports standard HTML form file uploads.">
<meta name="viewport" content="width=device-width">
</head>
<body>

	<div class="container">
		<form id="fileupload" action="upload/file" method="POST"
			enctype="multipart/form-data">
			<div class="row fileupload-buttonbar">
					<span class="btn btn-success fileinput-button"> <i
						class="icon-plus icon-white"></i> <span>Add files...</span> <input
						type="file" name="files[]" multiple="">
					</span>
					<button type="submit" class="btn btn-primary start">
						<i class="icon-upload icon-white"></i> <span>Start upload</span>
					</button>
			</div>
			
			<table role="presentation" class="table table-striped">
				<tbody class="files" data-toggle="modal-gallery"
					data-target="#modal-gallery"></tbody>
			</table>
		</form>
		<br>
		
	</div>
	<div id="progress" class="progress progress-striped active"
			style="width: 30%">
			<div class='barall' style='width: 0%'></div>
			<br />
		</div>
	<!-- The template to display files available for upload -->
	<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td class="preview"><span class="fade"></span></td>
        <td class="name"><span>{%=file.name%}</span></td>
        <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
        {% if (file.error) { %}
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
        {% } else if (o.files.valid && !i) { %}
            <td>
                <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>
            </td>
            <td class="start">{% if (!o.options.autoUpload) { %}
                <button class="btn btn-primary">
                    <i class="icon-upload icon-white"></i>
                    <span>Start</span>
                </button>
            {% } %}</td>
        {% } else { %}
            <td colspan="2"></td>
        {% } %}
        <td class="cancel">{% if (!i) { %}
            <button class="btn btn-warning">
                <i class="icon-ban-circle icon-white"></i>
                <span>Cancel</span>
            </button>
        {% } %}</td>
    </tr>
{% } %}
</script>
	<!-- The template to display files available for download -->
	<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        {% if (file.error) { %}
            <td></td>
            <td class="name"><span>{%=file.name%}</span></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
        {% } else { %}
            <td class="preview">{% if (file.thumbnail_url) { %}
                <a href="{%=file.url%}" title="{%=file.name%}" rel="gallery" download="{%=file.name%}"><img src="{%=file.thumbnail_url%}"></a>
            {% } %}</td>
            <td class="name">
                <a href="{%=file.url%}" title="{%=file.name%}" rel="{%=file.thumbnail_url&&'gallery'%}" download="{%=file.name%}">{%=file.name%}</a>
            </td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td colspan="2"></td>
        {% } %}
        <td class="delete">
            <button class="btn btn-danger" data-type="{%=file.delete_type%}" data-url="{%=file.delete_url%}"{% if (file.delete_with_credentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                <i class="icon-trash icon-white"></i>
                <span>Delete</span>
            </button>
            <input type="checkbox" name="delete" value="1">
        </td>
    </tr>
{% } %}
</script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.widget.js"></script>
	<script src="js/tmpl.min.js"></script>
	<script src="js/load-image.min.js"></script>
	<script src="js/canvas-to-blob.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.iframe-transport.js"></script>
	<script src="js/jquery.fileupload.js"></script>
	<script src="js/jquery.fileupload-fp.js"></script>
	<script src="js/jquery.fileupload-ui.js"></script>
	<script>
		var array = {};

		$('#fileupload')
				.fileupload(
						{
							done : function(e, data) {
								console.info(data);
							},
							result : function(e, data) {
								console.info(data);
							},

							/* Gera Multiplas barras */
							progress : function(e, data) {

								if (array[data.files[0].name] == undefined) {
									array[data.files[0].name] = $("<div class='bar' style='width: 0%'></div>");
									$("#progress").append(
											array[data.files[0].name]);
								}

								var progress = parseInt(data.loaded
										/ data.total * 100, 10);
								array[data.files[0].name].css('width', progress
										+ '%');
								array[data.files[0].name].html(progress + '%');
							},

							/* Barra Geral*/
							progressall : function(e, data) {
								var tempo = parseInt((data.total - data.loaded)
										/ (data.bitrate / 8));
								var progress = parseInt(data.loaded
										/ data.total * 100, 10);

								$("#progress .barall").css('width',
										progress + '%');
								$("#progress .barall").html(
										progress + '% Total');
								$("#time").html(tempo + " s");
							},

							start : function(e) {
								console.info("Iniciou o upload");
							},

							stop : function(e) {
								console.info("Terminou o upload");
							}
						});
	</script>
</body>
<style type="text/css">
.bar {
	background-color: #d0e4fe;
}

#progress .barall {
	background-color: #d0e4fe;
}
</style>
</html>