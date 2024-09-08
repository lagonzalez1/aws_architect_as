
#Create a new maven project

''' sh
mvn -B archetype:generate \
 -DarchetypeGroupId=software.amazon.awssdk \
 -DarchetypeArtifactId=archetype-lambda -Dservice=s3 -Dregion=US_WEST_1 \
 -DarchetypeVersion=2.21.28 \
 -DgroupId=com.example.myapp \
 -DartifactId=myapp

'''