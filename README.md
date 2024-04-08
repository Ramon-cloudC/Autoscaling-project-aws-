# Autoscaling-project-aws-
 simple architecture consisting in deploying an asg and an elb.

Deploying an Auto Scaling Group (asg) and Elastic Load Balancer (elb)

Overview

This repository provides step-by-step instructions for deploying an Auto Scaling Group and an Elastic Load Balancer to ensure your application can handle varying traffic loads and maintain high availability.

Prerequisites

Before you begin, make sure you have the following in place:

An AWS account: If you don’t have one, sign up at AWS.

Basic knowledge of AWS services and concepts.

Steps:
1. Set Up a Launch Template or Launch Configuration

-A launch template defines the configuration for your EC2 instances. You can create one using the EC2 Dashboard.

-Specify instance details, such as the AMI, instance type, security groups, and user data (if needed).

3. Create an Auto Scaling Group (ASG)

-An ASG automatically adjusts the number of EC2 instances based on demand.

-Define your ASG using the launch template or launch configuration you created.

-Set scaling policies (e.g., minimum, maximum, desired capacity).

-Choose the same Availability Zones for the ASG as your load balancer.

4. Attach Your Load Balancer

-Create an Elastic Load Balancer (ELB) using the Elastic Load Balancing service.

-Configure listeners (e.g., HTTP on port 80) and associate them with your ASG.

-Ensure your security group allows traffic from the load balancer on the listener port (usually port 80).

5. Verify Load Balancer Attachment

-Confirm that your ASG instances are registered with the load balancer.

-Test your setup by accessing the load balancer’s DNS name in a web browser.

6. Next Steps

-Monitor your ASG and ELB using AWS CloudWatch.

-Consider adding health checks to ensure instances are healthy.

-Explore other features like auto scaling policies and alarms.

Clean Up

-When you’re done experimenting, remember to clean up your resources to avoid unnecessary charges:

-Delete your ASG and associated EC2 instances.

-Remove the launch template or launch configuration.

-Delete the Elastic Load Balancer.
