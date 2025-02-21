## OVERVIEW
## INFRASTRUCTURE

Use Terraform to provision AWS services, including VPC, EC2 instances, subnets, security groups, and elastic IPs. I also setup S3 bucket and DynamoDB for remote work and state lock ! 

Infrastructure setup includes:

5 EC2 instances: Jenkins, Monitoring Server, Database Server, Sonarqube and Redis

1 VPC

Networking components: Subnets, Security Groups, and Elastic IPs

## PIPELINE
Integrate SonarQube into the Jenkins pipeline using a token-based credential. Additionally, install the Dependency-Check plugin on the Jenkins Master and Trivy on the Jenkins Slave for security scanning.

- DAST: OWASP ZAP

- SAST: Sonarqube

- Docker Image: Trivy

- Dependency: OWASP Dependency-Check


## MONITORING
Deploy the Datadog Agent as a Docker container to collect logs and metrics from all Docker containers within the same Docker socket.
Configure Prometheus to scrape metrics from 5 instances and Jenkins's work, which is exposed via the Prometheus plugin.



## SCREENSHOTS

![Build Stages](https://github.com/DatNguyenPT/JWT-Pipeline-Screenshots/blob/main/Build%20Stage%20trong%20pipeline.png?raw=true)

![Low Code Coverage](https://github.com/DatNguyenPT/JWT-Pipeline-Screenshots/blob/main/Code%20ch%C6%B0a%20ho%C3%A0n%20thi%E1%BB%87n%20t%E1%BB%91t.png?raw=true)

![DAST](https://github.com/DatNguyenPT/JWT-Pipeline-Screenshots/blob/main/DAST.png?raw=true)

![Sonarqube](https://github.com/DatNguyenPT/Netflix-Clone-DevSecOps-Pipeline/blob/master/Screenshot%202025-02-13%20201445.png?raw=true) 

![Telegram Notifications](https://github.com/DatNguyenPT/JWT-Pipeline-Screenshots/blob/main/Tele%20noti.png?raw=true) 

![Monitoring](https://github.com/DatNguyenPT/JWT-Pipeline-Screenshots/blob/main/Gi%C3%A1m%20s%C3%A1t%20c%C3%A1c%20instance.png?raw=true) 


![SWAGGER UI](https://github.com/DatNguyenPT/JWT-Pipeline-Screenshots/blob/main/API%20Document%20%C4%91%C6%B0%E1%BB%A3c%20deploy%20th%C3%A0nh%20c%C3%B4ng.png?raw=true)







## Authors

- [@DatNguyenPT](https://github.com/DatNguyenPT)

