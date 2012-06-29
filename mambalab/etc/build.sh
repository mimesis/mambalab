CLASSPATH=$(find "../jetty/lib" -name '*.jar' |xargs echo  |tr ' ' ':')
javac -classpath ${CLASSPATH} HelloWorld.java