@echo off
SET version=1.0

:: Main function
:main

echo.        
echo      ######      #########     ####   ####
echo    ###    ###   ###    ####   ###### ######
echo    ###          ###          ###  #####  ###
echo     #######     ###          ###   ###   ###
echo           ###   ###          ###         ###
echo    ###    ###   ####   ####  ###         ###
echo      ######      #########   ###         ###
echo    SCM project frame tool v1.0
echo.

::Check arguments
if "%1"=="" (
   echo No arguments were provided.
   echo Usage: scmframe -help
   exit /b 1
) else if "%1"=="-version" (
   echo  scmframe version %version%.
   exit /b
) else if "%1"=="-help" (
   echo scmframe version %version%
   echo.
   echo Usage: scmframe [option]
   echo.
   echo Available options:
   echo   -version                              Display the version of scmframe.
   echo   -help                                 Display this help message.
   echo   -springmvc group_id artifect_id       Create new Spring MVC project.
   echo.
   
   exit /b
) else if "%1"=="-springmvc" (
   if "%2"=="" (
      echo Please provides group id.
      echo Usage: scmframe -springmvc group_id artifect_id.
      echo.
      echo scmframe -help
      exit /b
   ) else if "%3"=="" (
      echo Please provides artifect id.
      echo Usage: scmframe -springmvc group_id artifect_id.
      echo.
      echo scmframe -help
      exit /b
   ) else (
      call :springmvc %2 %3
   )
) else (
   :: insert the code for your actual command here
   echo Unknown argument was provided!
   echo Type scmframe -help to see available arguments.
   exit /b 1
)
goto :EOF

:: Create spring mvc project
:springmvc
:: Check if Maven is available on the system
where mvn >nul 2>nul
if %errorlevel% equ 0 (
   if "%1"=="" (
      echo Please provides group id.
   ) else if "%2"=="" (
      echo Please provides artifect id.
   ) else (
      :: Creating SpringMVC project...
      echo Creating SpringMVC project...
      echo.
      mvn archetype:generate ^
         -DgroupId=%1 ^
         -DartifactId=%2 ^
         -Dversion=1.0-SNAPSHOT ^
         -Dpackage=%1.%2 ^
         -DinteractiveMode=false ^
         -DarchetypeArtifactId=maven-archetype-webapp ^
         -DarchetypeVersion=1.4 ^
         -Dpackaging=war ^
         -DarchetypeCatalog=internal ^
         -Dmaven.compiler.source=17 ^
         -Dmaven.compiler.target=17 ^
         -Dmaven-compiler-plugin.version=3.8.1 ^
         -Dmaven-war-plugin.version=3.3.2 ^
         -Dmaven-clean-plugin.version=3.1.0 ^
         -Dmaven-resources-plugin.version=3.2.0 ^
         -Dmaven-install-plugin.version=2.5.2 ^
         -Dmaven-site-plugin.version=3.9.0

      echo Adding required dependencies...
      ::org.springframework.spring-web
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-web" "5.3.14"
      echo [0] org.springframework.spring-web v5.3.14 has been added.
      ::org.springframework.spring-core
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-core" "5.3.14"
      echo [1] org.springframework.spring-core v5.3.14 has been added.
      ::org.springframework.spring-orm
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-orm" "5.3.14"
      echo [2] org.springframework.spring-orm v5.3.14 has been added.
      ::org.springframework.spring-webmvc
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-webmvc" "5.3.14"
      echo [3] org.springframework.spring-webmvc v5.3.14 has been added.
      ::org.springframework.spring-context
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-context" "5.3.14"
      echo [4] org.springframework.spring-context v5.3.14 has been added.
      ::org.springframework.spring-jdbc
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-jdbc" "5.3.14"
      echo [5] org.springframework.spring-jdbc v5.3.14 has been added.
      ::javax.servlet.jstl
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "javax.servlet" "jstl" "1.2"
      echo [6] javax.servlet.jstl v1.2 has been added.
      ::javax.servlet.servlet-api
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "javax.servlet" "servlet-api" "2.5"
      echo [7] javax.servlet.servlet-api v2.5 has been added.
      ::javax.servlet.javax.servlet.jsp-api
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "javax.servlet.jsp" "javax.servlet.jsp-api" "2.3.3" "provided"
      echo [8] javax.servlet.javax.servlet.jsp-api v2.3.3 has been added.
      ::org.projectlombok.lombok
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.projectlombok" "lombok" "1.18.24" "provided"
      echo [9] org.projectlombok.lombok v1.18.24 has been added.
      ::taglibs.standart
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "taglibs" "standard" "1.1.2"
      echo [10] taglibs.standart v1.1.2 has been added.
      ::org.hibernate.hibernate-core
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.hibernate" "hibernate-core" "5.5.7.Final"
      echo [11] org.hibernate.hibernate-core v5.5.7.Final has been added.
      ::org.hibernate.hibernate-entitymanager
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.hibernate" "hibernate-entitymanager" "5.5.7.Final"
      echo [12] org.hibernate.hibernate-entitymanager v5.5.7.Final has been added.
      ::mysql.mysql-connector-java
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "mysql" "mysql-connector-java" "8.0.32"
      echo [13] mysql.mysql-connector-java v8.0.32 has been added.

      
      cd %2
      mvn clean install -Dmaven-compiler-plugin.version=3.8.1 -Dmaven.compiler.source=17 -Dmaven.compiler.target=17
      cd ..

      echo Updating compiler version.
      java -jar %SCM_HOME%\projectmodifier.jar "-compiler-version" "%2/pom.xml" "17" "17"
      echo Compiler updated to 17.
      echo.

      echo Project setting up ...
      echo Deploying project's web.xml...
      java -jar %SCM_HOME%\projectmodifier.jar "-deploy-web-servlet" "%2\src\main\webapp\WEB-INF\web.xml" "%2"
      echo web.xml has bean updated.

      echo.

      echo Deploying project's dispatcher-servlet.xml...
      java -jar %SCM_HOME%\projectmodifier.jar "-deploy-dispatcher-servlet" "%2\src\main\webapp\WEB-INF\dispatcher-servlet.xml" "%1.%2"
      echo dispatcher-servlet.xml has bean added.

      echo.

      echo Creating resources files...
      ::resources files
      mkdir "%2\src\main\resources"
      xcopy /q "%SCM_HOME%\includes\resources" "%2\src\main\resources"

      mkdir "%2\src\main\webapp\resources"
      mkdir "%2\src\main\webapp\resources\css"
      mkdir "%2\src\main\webapp\resources\img"
      mkdir "%2\src\main\webapp\resources\js"

      echo Resources files created.
      echo.
      echo Creating index page...
      ::index
      del "%2\src\main\webapp\index.jsp"
      xcopy /q "%SCM_HOME%\includes\home\index.jsp" "%2\src\main\webapp\"
      ::views
      mkdir "%2\src\main\webapp\WEB-INF\pages"
      xcopy /q "%SCM_HOME%\includes\pages\index.jsp" "%2\src\main\webapp\WEB-INF\pages"
      echo Page has been added.

      echo Creating Java resources...
      mkdir "%2\src\main\java"
      ::make controller
      java -jar %SCM_HOME%\projectmodifier.jar "-build-controller" "%2\src\main\java" "%1.%2.web.controllers"
      ::make form
      java -jar %SCM_HOME%\projectmodifier.jar "-build-form" "%2\src\main\java" "%1.%2.web.forms"
      ::make service
      java -jar %SCM_HOME%\projectmodifier.jar "-build-service" "%2\src\main\java" "%1.%2.bl.service"
      java -jar %SCM_HOME%\projectmodifier.jar "-build-service-impl" "%2\src\main\java" "%1.%2.bl.service.impl"
      ::make dto
      java -jar %SCM_HOME%\projectmodifier.jar "-build-service-dto" "%2\src\main\java" "%1.%2.bl.dto"
      ::make daos 
      java -jar %SCM_HOME%\projectmodifier.jar "-build-dao" "%2\src\main\java" "%1.%2.persistence.dao"
      java -jar %SCM_HOME%\projectmodifier.jar "-build-dao-impl" "%2\src\main\java" "%1.%2.persistence.dao.impl"
      java -jar %SCM_HOME%\projectmodifier.jar "-build-dao-entity" "%2\src\main\java" "%1.%2.persistence.entity"

      echo Successfully create java resources.
      echo.
      echo Successfully create Spring mvc project with the name of %2.
      echo.
      echo Note: Before running the project you need to change your database information inside jdbc.properties file.
      echo.
   )
  
) else (
  :: Maven is not installed
  echo Maven is not available on the system. Please install mvn to your system first.
  echo Download Maven latest Maven software from https://maven.apache.org/download.cgi
)
exit /b
