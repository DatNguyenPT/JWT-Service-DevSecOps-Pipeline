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

![Build Stage trong pipeline](https://github.com/user-attachments/assets/c885e32f-2a07-41a9-ba04-08d1551e7e9f)

![Low Code Coverage](https://github.com/user-attachments/assets/66f617db-531c-483b-b65d-95b7c6263eee)

![DAST](https://github.com/user-attachments/assets/bd6c639b-3f81-4455-9d90-8509a2799a63)

![Tele notifications](https://github.com/user-attachments/assets/39b1aa19-d214-4bbf-9e12-dfbf185018b7)

![Monitoring](https://github.com/user-attachments/assets/4db799cc-224f-4cc1-99be-6c114bdb49b0)

![SWAGGER UI](https://github.com/user-attachments/assets/19b17104-a13b-4896-a52f-5401840c9622)


## Authors

- [@DatNguyenPT](https://github.com/DatNguyenPT)

