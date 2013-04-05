package br.com.ricardo.infra;

import br.com.caelum.vraptor.interceptor.multipart.DefaultMultipartConfig;
import br.com.caelum.vraptor.ioc.ApplicationScoped;
import br.com.caelum.vraptor.ioc.Component;

@Component
@ApplicationScoped
public class CustomMultipartConfig extends DefaultMultipartConfig {

	// Limite de Upload
	public long getSizeLimit() {
		return 800 * 1024 * 1024; // 800MB
	}

}