# Java Web Project Structure

## Tools

Gradle Spring SpringMVC

## Project Structure
.
├── build.gradle
├── settings.gradle
├── smvcthree.iml
└── src
    ├── main
    │   ├── java
    │   │   └── com
    │   │       └── groupName
    │   │           └── projectName
    │   │               ├── service
    │   │               │   └── HelloWorldService.java
    │   │               └── web
    │   │                   └── WelcomeController.java
    │   ├── resources
    │   │   └── logback.xml
    │   └── webapp
    │       ├── resources
    │       │   └── core
    │       │       ├── css
    │       │       │   ├── bootstrap.min.css
    │       │       │   └── hello.css
    │       │       ├── images
    │       │       └── js
    │       │           ├── bootstrap.min.js
    │       │           └── hello.js
    │       └── WEB-INF
    │           ├── lib
    │           │   ├── aopalliance-1.0.jar
    │           │   ├── commons-logging-1.2.jar
    │           │   ├── jstl-1.2.jar
    │           │   ├── logback-classic-1.1.3.jar
    │           │   ├── logback-core-1.1.3.jar
    │           │   ├── slf4j-api-1.7.7.jar
    │           │   ├── spring-aop-4.1.6.RELEASE.jar
    │           │   ├── spring-beans-4.1.6.RELEASE.jar
    │           │   ├── spring-context-4.1.6.RELEASE.jar
    │           │   ├── spring-core-4.1.6.RELEASE.jar
    │           │   ├── spring-expression-4.1.6.RELEASE.jar
    │           │   ├── spring-web-4.1.6.RELEASE.jar
    │           │   └── spring-webmvc-4.1.6.RELEASE.jar
    │           ├── spring-core-config.xml
    │           ├── spring-mvc-config.xml
    │           ├── views
    │           │   └── jsp
    │           │       └── index.jsp
    │           └── web.xml
    └── test
        ├── java
        └── resources