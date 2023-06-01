@echo off
SET version=1.1
SET projectVersion=1.0-SNAPSHOT
SET springVersion=5.3.27
SET springDataJPAVersion=2.7.12
SET tilesVersion=3.0.8
SET jspVersion=2.3.3
SET jstlVersion=1.2
SET servletAPI=4.0.1
SET securityVersion=5.8.3
SET hibernateVersion=5.6.15.Final
SET hibernateValidatorVersion=6.0.13.Final
SET loggerVersion=2.20.0
SET javaxAnnotaionVersion=1.3.2
SET javaxPersistenceAPIVersion=2.2
SET mysqlConnectorVersion=8.0.32
SET lombokVersion=1.18.24

:: Main function
:main

echo.        
echo      ####   ####    ################    ####   ####
echo     ###### ######   ################   ###### ######
echo    ###  #####  ###        ###         ###  #####  ###
echo    ###   ###   ###        ###         ###   ###   ###
echo    ###         ###        ###         ###         ###
echo    ###         ###        ###         ###         ###
echo    ###         ###        ###         ###         ###
echo    MTM project frame tool %version%
echo.

::Check arguments
if "%1"=="" (
   echo No arguments were provided.
   echo Usage: mtm -help
   exit /b 1
) else if "%1"=="-version" (
   echo  mtm version %version%.
   exit /b
) else if "%1"=="-help" (
   echo mtm version %version%
   echo.
   echo Usage: mtm [option]
   echo.
   echo Available options:
   echo   -version                              Display the version of mtm.
   echo   -help                                 Display this help message.
   echo   -springmvc group_id artifect_id       Create new Spring MVC project.
   echo.
   
   exit /b
) else if "%1"=="-springmvc" (
   if "%2"=="" (
      echo Please provides group id.
      echo Usage: mtm -springmvc group_id artifect_id.
      echo.
      echo mtm -help
      exit /b
   ) else if "%3"=="" (
      echo Please provides artifect id.
      echo Usage: mtm -springmvc group_id artifect_id.
      echo.
      echo mtm -help
      exit /b
   ) else (
      call :springmvc %2 %3
   )
) else (
   :: insert the code for your actual command here
   echo Unknown argument was provided!
   echo Type mtm -help to see available arguments.
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
         -Dversion=%projectVersion% ^
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
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-web" "%springVersion%"
      echo [0] org.springframework.spring-web v%springVersion% has been added.

      ::org.springframework.spring-core
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-core" "%springVersion%"
      echo [1] org.springframework.spring-core v%springVersion% has been added.

      ::org.springframework.spring-orm
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-orm" "%springVersion%"
      echo [2] org.springframework.spring-orm v%springVersion% has been added.

      ::org.springframework.spring-webmvc
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-webmvc" "%springVersion%"
      echo [3] org.springframework.spring-webmvc v%springVersion% has been added.

      ::org.springframework.spring-context
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-context" "%springVersion%"
      echo [4] org.springframework.spring-context v%springVersion% has been added.

      ::org.springframework.spring-aop
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-aop" "%springVersion%"
      echo [5] org.springframework.spring-aop v%springVersion% has been added.

      ::org.springframework.spring-tx
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework" "spring-tx" "%springVersion%"
      echo [6] org.springframework.spring-tx v%springVersion% has been added.

      ::org.springframework.data.spring-data-jpa
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework.data" "spring-data-jpa" "%springDataJPAVersion%"
      echo [7] org.springframework.data.spring-data-jpa v%springDataJPAVersion% has been added.

      ::org.apache.tiles-core
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.apache.tiles" "tiles-core" "%tilesVersion%"
      echo [8] org.apache.tiles.tiles-core v%tilesVersion% has been added.

      ::org.apache.tiles-api
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.apache.tiles" "tiles-api" "%tilesVersion%"
      echo [9] org.apache.tiles.tiles-api v%tilesVersion% has been added.

      ::org.apache.tiles-el
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.apache.tiles" "tiles-el" "%tilesVersion%"
      echo [10] org.apache.tiles.tiles-el v%tilesVersion% has been added.

      ::org.apache.tiles-jsp
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.apache.tiles" "tiles-jsp" "%tilesVersion%"
      echo [11] org.apache.tiles.tiles-jsp v%tilesVersion% has been added.

      ::org.apache.tiles-extras
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.apache.tiles" "tiles-extras" "%tilesVersion%"
      echo [12] org.apache.tiles.tiles-extras v%tilesVersion% has been added.

      ::org.apache.tiles-servlet
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.apache.tiles" "tiles-servlet" "%tilesVersion%"
      echo [13] org.apache.tiles.tiles-servlet v%tilesVersion% has been added.

      ::javax.servlet.jsp.javax.servlet.jsp-api
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "javax.servlet.jsp" "javax.servlet.jsp-api" "%jspVersion%" "provided"
      echo [14] javax.servlet.jsp.javax.servlet.jsp-api v%jspVersion% has been added.

      ::javax.servlet.jstl
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "javax.servlet" "jstl" "%jstlVersion%"
      echo [15] javax.servlet.jstl v%jstlVersion% has been added.

      ::javax.servlet.servlet-api
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "javax.servlet" "javax.servlet-api" "%servletAPI%"
      echo [16] javax.servlet.javax.servlet-api v%servletAPI% has been added.

      ::javax.persistence.javax.persistence-api
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "javax.persistence" "javax.persistence-api" "%javaxPersistenceAPIVersion%"
      echo [17] javax.persistence.javax.persistence-api v%javaxPersistenceAPIVersion% has been added.

      ::javax.annotation:javax.annotation-api
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "javax.annotation" "javax.annotation-api" "%javaxAnnotaionVersion%"
      echo [18] javax.annotation:javax.annotation-api v%javaxAnnotaionVersion% has been added.

      ::org.projectlombok.lombok
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.projectlombok" "lombok" "%lombokVersion%" "provided"
      echo [19] org.projectlombok.lombok v%lombokVersion% has been added.

      ::taglibs.standart
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "taglibs" "standard" "1.1.2"
      echo [20] taglibs.standart v1.1.2 has been added.

      ::org.springframework.security.spring-security-core
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework.security" "spring-security-core" "%securityVersion%"
      echo [21] org.springframework.security.spring-security-core v%securityVersion% has been added.
      
      ::org.springframework.security.spring-security-web
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework.security" "spring-security-web" "%securityVersion%"
      echo [22] org.springframework.security.spring-security-web v%securityVersion% has been added.

      ::org.springframework.security.spring-security-config
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.springframework.security" "spring-security-config" "%securityVersion%"
      echo [23] org.springframework.security.spring-security-config v%securityVersion% has been added.

      ::org.hibernate.hibernate-core
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.hibernate" "hibernate-core" "%hibernateVersion%"
      echo [24] org.hibernate.hibernate-core v%hibernateVersion% has been added.

      ::org.hibernate.validator.hibernate-validator
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.hibernate.validator" "hibernate-validator" "%hibernateValidatorVersion%"
      echo [25] org.hibernate.validator v%hibernateValidatorVersion% has been added.

      ::mysql.mysql-connector-java
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "mysql" "mysql-connector-java" "%mysqlConnectorVersion%"
      echo [26] mysql.mysql-connector-java v%mysqlConnectorVersion% has been added.

      ::org.apache.logging.log4j:log4j-core
      java -jar %SCM_HOME%\projectmodifier.jar "-add-dependency" "%2/pom.xml" "org.apache.logging.log4j" "log4j-core" "%loggerVersion%"
      echo [27] org.apache.logging.log4j:log4j-core v%loggerVersion% has been added.

      cd %2
      mvn clean install -Dmaven-compiler-plugin.version=3.8.1 -Dmaven.compiler.source=17 -Dmaven.compiler.target=17
      cd ..
      ::Removing the index file because we have the mapping inside our controller.
      if exist "%2\src\main\webapp\index.jsp" (
         del "%2\src\main\webapp\index.jsp"
         echo File deleted.
      ) else (
         echo File does not exist.
      )

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
      java -jar %SCM_HOME%\projectmodifier.jar "-deploy-dispatcher-servlet" "%2\src\main\webapp\WEB-INF\dispatcher-servlet.xml" "%1"
      echo dispatcher-servlet.xml has bean added.

      echo.

      echo Deploying project's tiles-config.xml...
      java -jar %SCM_HOME%\projectmodifier.jar "-deploy-tiles-config" "%2\src\main\webapp\WEB-INF\tiles-config.xml" "%1"
      echo tiles-config.xml has bean configured.

      echo.

      echo Deploying project's security-servlet.xml...
      java -jar %SCM_HOME%\projectmodifier.jar "-deploy-security-servlet" "%2\src\main\webapp\WEB-INF\security-servlet.xml" "%1"
      echo security-servlet.xml has bean configured.

      echo.

      echo Creating resources files...
      ::resources files
      mkdir "%2\src\main\resources"
      xcopy /q "%SCM_HOME%\includes\resources" "%2\src\main\resources" /S /E /I /Y

      mkdir "%2\src\main\webapp\resources"
      mkdir "%2\src\main\webapp\resources\css"
      mkdir "%2\src\main\webapp\resources\img"
      mkdir "%2\src\main\webapp\resources\js"

      echo Resources files created.
      echo.
      
      echo Creating views...
      ::views
      mkdir "%2\src\main\webapp\WEB-INF\pages"
      xcopy /q "%SCM_HOME%\includes\pages" "%2\src\main\webapp\WEB-INF\pages" /S /E /I /Y
      echo Views has been created.
      echo.
      echo Configuration layout...
      ::layout
      mkdir "%2\src\main\webapp\WEB-INF\layout"
      xcopy /q "%SCM_HOME%\includes\layout" "%2\src\main\webapp\WEB-INF\layout" /S /E /I /Y
      echo Layout configuration files have been added.
      echo.

      echo Creating Java resources...
      mkdir "%2\src\main\java"
      echo.
      echo Creating configuration file...
      ::make configuration files
      java -jar %SCM_HOME%\projectmodifier.jar "-build-configurations" "%2\src\main\java" "%1.common.conifg" "%1"
      echo Configuration Files have been created.
      echo.

      echo Creating utility files...
      ::make utility files
      java -jar %SCM_HOME%\projectmodifier.jar "-build-utils" "%2\src\main\java" "%1.utils" "%1"
      echo Utility Files have been created.
      echo.

      echo Creating controllers...
      ::make controller
      java -jar %SCM_HOME%\projectmodifier.jar "-build-controller" "%2\src\main\java" "%1.web.controllers" "%1"
      echo Controllers have been created.
      echo.
      
      echo Creating forms...
      ::make form
      java -jar %SCM_HOME%\projectmodifier.jar "-build-form" "%2\src\main\java" "%1.web.forms" "%1"
      echo Forms have been created.
      echo.

      echo Createing services...
      ::make service
      java -jar %SCM_HOME%\projectmodifier.jar "-build-service" "%2\src\main\java" "%1.bl.service" "%1"
      java -jar %SCM_HOME%\projectmodifier.jar "-build-service-impl" "%2\src\main\java" "%1.bl.service.impl" "%1"
      echo Services have been created.

      echo.

      echo Creating DTOs...
      ::make dto
      java -jar %SCM_HOME%\projectmodifier.jar "-build-service-dto" "%2\src\main\java" "%1.bl.dto" "%1"
      echo DTOs have been created.
      echo.

      echo Creating Repositories...
      ::make repository 
      java -jar %SCM_HOME%\projectmodifier.jar "-build-repository" "%2\src\main\java" "%1.persistence.repository" "%1"
      echo Repositories have been created.
      echo.

      echo Creating Entities...
      ::make entity
      java -jar %SCM_HOME%\projectmodifier.jar "-build-dao-entity" "%2\src\main\java" "%1.persistence.entity" "%1"
      echo Entities have been created.
      echo.
      echo Successfully create java resources.
      echo.
      echo Successfully create Spring mvc project with the name of %2.
      echo.
      echo Note: Before running the project you need to change your database information inside jdbc.properties file.
      echo       And you might change your log file setting inside app.properties file.
      echo.
      echo METATEAM MYANMAR https://metateammyanmar.com/en/.
      echo.
   )
  
) else (
  :: Maven is not installed
  echo Maven is not available on the system. Please install mvn to your system first.
  echo Download Maven latest Maven software from https://maven.apache.org/download.cgi
)
exit /b