# Spring download & import

通过Gradle配置Spring

```gradle

ext {
    springVersion = '4.2.6.RELEASE'
    hibernateVersion='4.1.6.Final'
    jacksonVersion='2.6.0'
}

dependencies {

    compile(
            "org.springframework:spring-webmvc:${springVersion}",
            "org.springframework:spring-orm:${springVersion}",
            "org.springframework:spring-aop:${springVersion}",
            "org.springframework:spring-tx:${springVersion}",
            "org.springframework:spring-context:${springVersion}",
            "org.springframework:spring-context-support:${springVersion}",
            "org.springframework:spring-test:${springVersion}",
    )

}

```