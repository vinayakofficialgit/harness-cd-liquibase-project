# harness-cd-liquibase-project





##################when you want to run jenkin file and build and push to dockerhub 
####run through rootuser in terminal before running jenkin pipelines

 chown jenkins:jenkins /var/run/docker.sock                            ---add jenkins to docker group 
 
 usermod -aG docker jenkins                                          -----add jenkins to docker group   



 then in jenkins  go to manage jenkin add credential for 

 docker   username password
 github   username password  
 


 






