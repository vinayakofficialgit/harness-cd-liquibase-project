# harness-cd-liquibase-project





##################when you want to run jenkin file and build and push to dockerhub 
####run through rootuser in terminal before running jenkin pipelines

 chown jenkins:jenkins /var/run/docker.sock                            ---add jenkins to docker group 
 
 usermod -aG docker jenkins                                          -----add jenkins to docker group   



 then in jenkins  go to manage jenkin add credential for 

 docker      give username password  but id as docker-hub-credentials 
 github    give username password    but id as github-credentials     ######we are giving github cred for commit the version id of docker image when pushing so that next when its clone it will look on VERSION file 
 

#####################for liquibase run mysql container
 


docker run -d --name mysql-db-container \
  -e MYSQL_ROOT_PASSWORD=root_password \
  -e MYSQL_DATABASE=data-db \
  -e MYSQL_USER=db_user \
  -e MYSQL_PASSWORD=db_password \
  -p 3306:3306 \
  mysql:latest



#after entering in container
mysql -u root -p


USE data-db;
SHOW TABLES;


##to check id Author or used to retrieve the "actual" data from the DATABASECHANGELOG table
SELECT * FROM DATABASECHANGELOG;


###used to get "metadata" about the structure or Schema of the DATABASECHANGELOG table
DESCRIBE  DATABASECHANGELOG;



Liquibase applies schema changes using "change sets" inside the db.changelog.xml file.



#run this in liquibase folder
liquibase --classpath=mysql-connector-j-9.1.0.jar  update



###this is how you add comment
 <!-- commented one This XML file contains the database changes (schema changes, tables, columns, etc.). -->

###############################################################################################
create this shell script in harness cd pipeline
#!/bin/bash

pwd


liquibase --driver=com.mysql.cj.jdbc.Driver \
  --url="jdbc:mysql://${DB_HOST}:${DB_PORT}/data-db" \
  --username="${DB_USER}" \
  --password="${DB_PASSWORD}" \
  --classpath="mysql-connector-j-9.1.0.jar" \
  --changeLogFile=db.changelog.xml update







and in optional configuration

give 'host' mean IP
'ssh'
'working dir'
/var/lib/jenkins/workspace/jenkinsCI-prod/liquibase

