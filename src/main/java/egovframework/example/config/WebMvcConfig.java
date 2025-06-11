package egovframework.example.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // /resources/** 로 접근하면 /webapp/resources/ 디렉토리 내부 파일 제공
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");
    }
}
