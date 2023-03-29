# SCM Command (project-frame)
The command line tool that help you building java project with scm frame. 

## Version description
v1.0 (current)
- support spring mvc project

## Setting up
Before using, make sure mvn and java are installed in your system. 

Check mvn version<br/>
``
mvn --version
``
<br/>
If mvn is not in your system you can download and install Maven here<br/> 
https://maven.apache.org/download.cgi<br/>

Check java version<br/>
``
java -version
``
<br/>
If java is not in your system you can download and install java here<br/>
https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html<br/>
<br/>
Now let setup to use the command line tool.
- Download the zip file.
- Extract it whatever you want.
- After extract complete you need to add SCM_HOME in your system enviroment

- Open <b>Edit the system environment > Environment Variables > Under System Variables > Click New > add new variable with name SCM_HOME and variable value must be the location you has been extracted the zip file. </b>

Now we have system environment variable named "SCM_HOME". Let configure to use it in our command prompt.
- Under System Variable <b> select Path and click Edit > add new variable Click New and Enter %SCM_HOME% as a value.</b>

Done, you are now able to use the scm command.Open the command prompt and type 
``
scmframe -help
``
<br/>

