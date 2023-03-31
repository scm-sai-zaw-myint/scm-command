# SCM Command (project-frame)
The command line tool that helps you building java project with scm frame. 

## Version description
- v1.0 (current) support spring mvc project
- Maven (mvn) 3.9.1 
- Java jdk 17 or above 

## Setting up
Before using, make sure mvn and java are installed in your system. 

Check mvn version
```powershell
mvn --version
```
If mvn is not in your system you can download and install Maven here<br/> 
https://maven.apache.org/download.cgi<br/>

Check java version
```powershell
java -version
```
If java is not in your system you can download and install java here<br/>
https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html<br/>
<br/>
Now let's setup to use the command line tool.
- Download the zip file.
- Extract it whereever you want.
- After extracted, you need to add SCM_HOME in your system enviroment

- Open <b>Edit the system environment > Environment Variables > Under System Variables > Click New > add new variable with name SCM_HOME and variable value must be the location of the extracted the zip file. </b>

Now we have system environment variable named "SCM_HOME". Let's configure to use it in our command prompt.
- Under System Variable <b> select Path and click Edit > add new variable Click New and Enter %SCM_HOME% as a value.</b>

Done, you are now able to use the scm command. Open the command prompt and run the command 
```powershell
scmframe -help
```

## Usage
There are currently provided three options.
  - -version
  - -help
  - -springmvc.
 
#### -Version
Display the current version.
#### -help
Display the help message.
#### -springmvc
Create new SpringMVC project with scm frame format. This options required two parameters,
  - [group_id] - the group id of the project (e.g: "com.example")
  - [artifact_id] - the artifact id of the project(e.g: "test")

e.g: Usage
```powershell
scmframe -springmvc "com.example" "test"
```
After project created, you can import the poject in your IDE and start developing your mvc project.
```
NOTE: The compilier version of mvc project is 17. Your IDE must support the java jdk 17 to run the created project.
```

### Thank You

