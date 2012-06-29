CLASSPATH=$(find "../jetty/lib" -name '*.jar' |xargs echo  |tr ' ' ':')
java -classpath .:${CLASSPATH} HelloWorld