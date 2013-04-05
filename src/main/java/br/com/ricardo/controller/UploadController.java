package br.com.ricardo.controller;

import java.util.Collection;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

@Resource
public class UploadController {

	private final Result result;
	private static final String PATH_FOTO = System.getProperty("user.home") + "/img";

	UploadController(Result result) {
		this.result = result;
	}

	@Get
	@Path("/")
	public void upload() {
	}

	@Get
	@Path("/outro")
	public void outro() {
	}

	@Post("/upload/file")
	public void atualizarFoto(Collection<UploadedFile> files, String dado) {
		System.out.println("AKI MSM" + dado + "    " + files);
		// IOUtils.copy(file.getFile(), new FileOutputStream(new File(PATH_FOTO + "/" + file.getFileName())));
		result.redirectTo(UploadController.class).upload();
	}

}