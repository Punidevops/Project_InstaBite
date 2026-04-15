# InstaBite – DevOps CI/CD Pipeline

A complete CI/CD automation project for deploying a food ordering web application using Jenkins, Maven, and Apache Tomcat on AWS EC2.

## Overview

This project demonstrates an end-to-end DevOps workflow where code pushed to GitHub is automatically built and deployed to production. The pipeline eliminates manual deployment steps and ensures consistent, reliable application delivery.

## Tech Stack

- **Version Control:** GitHub
- **CI/CD Tool:** Jenkins
- **Build Tool:** Maven
- **Application Server:** Apache Tomcat (Port 8080)
- **Cloud Platform:** AWS EC2
- **Language:** Java

## Architecture

```
Developer → GitHub → Jenkins → Maven Build → Tomcat Deployment → AWS EC2
```

## Pipeline Flow

1. Developer pushes code to GitHub
2. Jenkins detects changes via webhook
3. Jenkins pulls latest code from repository
4. Maven builds project and creates WAR file
5. Jenkins deploys WAR to Tomcat server
6. Application goes live on EC2 instance

## Key Features

- Automated CI/CD pipeline with zero manual steps
- GitHub and Jenkins integration
- Maven-based build automation
- Deployment to Apache Tomcat on AWS EC2
- Real-time build logs and notifications
- Scalable and production-ready architecture

## Setup Requirements

### Prerequisites

- AWS EC2 instance (t2.medium or higher)
- Ubuntu 22.04 LTS or Amazon Linux 2
- Java JDK 11+
- Git, Maven 3.8+

### Quick Setup

1. Launch EC2 instance with security groups allowing SSH (22), HTTP (8080), Jenkins (8081)
2. Install Java, Maven, Jenkins, and Apache Tomcat
3. Configure Jenkins with GitHub credentials
4. Create Jenkins job with Maven build and Tomcat deployment
5. Set up GitHub webhook to trigger Jenkins on code push
6. Deploy and access application at http://EC2-IP:8080/instabite

## Deployment

Application is deployed on Apache Tomcat server hosted on AWS EC2. Jenkins automates the entire build and deployment process triggered by code commits to GitHub.

## Technologies & Tools

| Component | Technology |
|-----------|-----------|
| Source Control | Git, GitHub |
| CI/CD Platform | Jenkins |
| Build Tool | Apache Maven |
| Application Server | Apache Tomcat |
| Cloud Infrastructure | AWS EC2 |
| Programming Language | Java |
| Database | MySQL |

## Key Accomplishments

- Successfully implemented fully automated CI/CD pipeline
- Integrated GitHub with Jenkins for continuous integration
- Automated build process using Maven
- Deployed application to production on AWS EC2
- Reduced manual deployment effort by 100%
- Configured Tomcat for seamless application deployment

## Learning Outcomes

- CI/CD pipeline design and implementation
- Jenkins job creation and automation
- Maven build automation and dependency management
- Apache Tomcat server configuration and deployment
- AWS EC2 instance setup and management
- DevOps best practices and workflows
- Git and GitHub integration with CI/CD tools

## Tools & Technologies Used

- Jenkins – Continuous Integration and Deployment
- Maven – Build automation and project management
- Apache Tomcat – Java application server
- AWS EC2 – Cloud infrastructure
- GitHub – Version control and code repository
- Git – Version control system
- Java – Programming language
- MySQL – Database management

## Future Enhancements

- Docker containerization
- Kubernetes orchestration
- Automated testing with JUnit and Selenium
- Code quality analysis with SonarQube
- Blue-green deployment strategy
- Infrastructure as Code with Terraform
- ELK stack for monitoring and logging

## Troubleshooting

**Jenkins cannot connect to GitHub**
- Verify GitHub credentials in Jenkins
- Check Personal Access Token expiration
- Verify firewall/proxy settings

**Maven build failure**
- Check Maven installation: mvn --version
- Verify Java version: java -version
- Clear Maven cache: mvn clean

**Tomcat deployment error**
- Check Tomcat service status
- Review logs: tail -f /opt/tomcat/logs/catalina.out
- Verify WAR file in webapps directory

## Contact & Support

**Author:** Puneeth B N  
**Role:** DevOps Engineer (Fresher)  
**Email:** bnpuni3@gmail.com  
## License

MIT License – Feel free to use this project for learning and development purposes.

---

**Status:** Active | **Last Updated:** April 2024
