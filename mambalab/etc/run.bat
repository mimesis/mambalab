set CLASSPATH=
setlocal enabledelayedexpansion
for %%i in (..\jetty\lib\*.jar) do SET CLASSPATH=%%i;!CLASSPATH!
echo !CLASSPATH!
javac -cp .;!CLASSPATH! HelloWorld
java -cp .;!CLASSPATH! HelloWorld
