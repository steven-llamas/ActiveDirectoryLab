<img src="https://i.imgur.com/OGEbYxf.jpeg" alt="Thumbnail of Project"/>
<h1>Active Directory (AD) Home Lab Setup Tutorial w 1000 Users</h1>

 ### [YouTube Demonstration](https://www.youtube.com/watch?v=B0DALTcGSHc)

<h2>Description</h2>
This tutorial demonstrates the process of setting up Active Directory in a home lab environment using Oracle Virtual Box Based on the tutorial by <a href="https://www.youtube.com/@JoshMadakor/featured">Josh Madakor</a>. Engaging in the configuration and operation of this lab will greatly enhance your comprehension of Active Directory and Windows networking principles. If you have any inquiries, don't hesitate to reach out to me.
<br />

<h2>Languages and Utilities Used</h2>

- <b>PowerShell</b> 
- <b>Oracle Virtual Box</b>

<h2>Environments Used </h2>

- <b>Windows 10</b> (22H2)
- <b>Windows Server 2019</b> 

<h2> Diagram Template of Home Lab</h2>

<p align="center">
Diagram of Project <br/>
<img src="https://github.com/steven-llamas/ActiveDirectoryLab/blob/main/active_directory_diagram.jpg" height="80%" width="80%" alt="Diagram of Project."/>
 <p> This is the diagram that is going to be used to set up the two main virtual machines (VMs) for the home lab environment. The first VM will be the Domain Controller (DC), which is the sever that runs Active Directory (AD) and all its components, so we need to set it up with all the following services. The Fully Qualified Domain Name (FQDN) is the complete domain name for AD, which we will need to set up within the DC in order to have Client1 connect to the AD server. Network Address Translation (NAT) will need to be setup as well in order to have the internal Network Interface Card (NIC) comunicate with the internet NIC, so that internet access is avilable within the domain when users sign in to the domain. Lastly, Dynamic Host Configuration Protocl (DHCP) is set up so that when Clients sign on to the domain, they automaticly get leased an IP address and are immediatly connected to the Internet. </p>
<br />

<h2>Files to Download and Install</h2>

- <a href="https://www.virtualbox.org/">Oracle Virtual Box</a>
- <a href="https://www.microsoft.com/en-us/software-download/windows10">Windows 10 .iso</a>
- <a href="https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2019">Windows Server 2019</a>

<h2>Tutorial Portion:</h2>

<p align="center">
Create a new VM machine by clicking on "New" in VirtualBox, to avoid confusion name VM "Domain Controller" and make sure to set "Windows 2019" as version. We Will load boot media after setting up VM.
 <br />
<img src="https://i.imgur.com/bOYn23w.png" height="80%" width="80%" alt="Creating new VM for Domain Contoller"/>
 <img src="https://i.imgur.com/8S6Vlvn.png" height="80%" width="80%" alt="Creating new VM for Domain Contoller"/>

<p align="center"> Configure the DC VM with two Network Interface Cards (NICs). One internal NIC for the Domain and the External NIC to be able to connect to the Internet on the Host Computer.<br />
<img src="https://i.imgur.com/wLTUU3O.png" height="80%" width="80%" alt="External Network Interface Card Setup"/>
 <img src="https://i.imgur.com/ESKrGFJ.png" height="80%" width="80%" alt="Internal Network Interface Card"/>

 <p align="center"> Install Windows Server 2019 on DC VM (Make sure to Select Desktop Experience), Identify the Internal & External NICs and assign IP address for internal Network Card.<br />
<img src="https://i.imgur.com/7DR5ctp.png" height="80%" width="80%" alt="Mounting Windows Server 2019 .iso file to DC VM"/>
<img src="https://i.imgur.com/ZiXx6KW.png" height="80%" width="80%" alt="Selecting Desktop Experiene Windows Server 2019"/>
<img src="https://i.imgur.com/1tkuqWo.png" height="80%" width="80%" alt="Logging in to the DC for the first time"/>
 
<p align="center">
Installing DHCP tool to AD: <br/>
<img src="https://i.imgur.com/dOItTTP.png" height="80%" width="80%" alt="Installing DHCP to AD."/>
<br />
 
<p align="center"> Download and run the <a href="https://github.com/joshmadakor1/AD_PS">PowerShell </a> script within the DC VM to create 1000 users in AD.<br/>
<img src="https://i.imgur.com/C9rAmd9.png" height="80%" width="80%" alt="Powershell add users picture"/>
<img src="https://i.imgur.com/JqbPbwj.png" height="80%" width="80%" alt="List of users in AD"/>
<br />
 
 
<p align="center"> Login to the client machine within the domain using a domain account.<br />
<img src="https://i.imgur.com/ShyiWPJ.png" height="80%" width="80%" alt="Logging in to Active Directory as an Administrator."/>
