# IaC_Assignment-2
## Aims/Description
The aim of this lab is to design and deploy a secure mini-network infrastructure in AWS using Terraform. The architecture includes:

* A public subnet containing a bastion server. <br>
*	A private subnet with an EC2 instance accessible only through a bastion host. <br>
*	Security Groups to enforce access control: <br>
    * HTTPS access to the private EC2 instance. <br>
    * SSH access to the private instance restricted to the bastion host. <br>
    * SSH access to the bastion host <br>
*	Networking components such as an Internet Gateway, NAT Gateway, Routing Tables, and route associations. <br>
*	Emphasis on code best practices. <be>


![image](https://github.com/user-attachments/assets/a397d6c8-9d06-4c48-b1b6-727b4797151c)
