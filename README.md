<img src="https://i.imgur.com/OGEbYxf.jpeg" alt="Thumbnail of Project."/>
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
<img src="https://i.imgur.com/bOYn23w.png" height="80%" width="80%" alt="Creating new VM for Domain Contoller."/>
 <img src="https://i.imgur.com/8S6Vlvn.png" height="80%" width="80%" alt="Creating new VM for Domain Contoller."/>

<p align="center"> Configure the DC VM with two Network Interface Cards (NICs). One internal NIC for the Domain and the External NIC to be able to connect to the Internet on the Host Computer.<br />
<img src="https://i.imgur.com/wLTUU3O.png" height="80%" width="80%" alt="External Network Interface Card Setup."/>
 <img src="https://i.imgur.com/ESKrGFJ.png" height="80%" width="80%" alt="Internal Network Interface Card."/>

 <p align="center"> Install Windows Server 2019 on DC VM (Make sure to Select Desktop Experience), Identify the Internal (the one with no network access) & External NICs and assign IP address for internal Network Card. <br />
<img src="https://i.imgur.com/7DR5ctp.png" height="80%" width="80%" alt="Mounting Windows Server 2019 .iso file to DC VM."/>
<img src="https://i.imgur.com/ZiXx6KW.png" height="80%" width="80%" alt="Selecting Desktop Experiene Windows Server 2019."/>
<img src="https://i.imgur.com/1tkuqWo.png" height="80%" width="80%" alt="Logging in to the DC for the first time."/>
<img src="https://i.imgur.com/RxyMZXQ.png" height="80%" width="80%" alt="Finding and Renaming internal Network."/>
<img src="https://i.imgur.com/q994cyU.png" height="50%" width="60%" alt="Configuring Internal NW IP address."/>
 
<p align="center"> Go to Server Manager then add the AD Domain services role and create the the domain (example- mydomain.com). <br/>
<img src="https://i.imgur.com/HcQdQF5.png" height="80%" width="80%" alt="Opening the Server Manager in the DC."/>
<img src="https://i.imgur.com/qmHj6zb.png" height="80%" width="80%" alt="Adding AD Domain Services role."/>
 <img src="https://i.imgur.com/kdBQbQO.png" height="80%" width="80%" alt="Creating a New Forest."/>
<img src="https://i.imgur.com/Z13QqtF.png" height="80%" width="80%" alt="Naming the Domain."/>
<img src="https://i.imgur.com/aHczpRu.png" height="80%" width="80%" alt="Creating a DC Password."/>
 
<p align="center">Next go to the Server Manager again and add the RAT/NAT service and configure to be able to allow clients access to internet while in the domain. Make sure to select the external NIC when setting up NAT internet connection. <br/>
<img src="https://i.imgur.com/OTcM9h2.png" height="80%" width="80%" alt="Adding RAT/NAT Service on the DC."/>
<img src="https://i.imgur.com/gWOxVJd.png" height="80%" width="80%" alt="Configuring which services to use."/>
<img src="https://i.imgur.com/MNypWcs.png" height="80%" width="80%" alt="Going to the Routing and Remote Access tool."/>
<img src="https://i.imgur.com/JJHhaXV.png" height="80%" width="80%" alt="Configuring the DC's NAT routing."/>
<img src="https://i.imgur.com/l4o5Cde.png" height="80%" width="80%" alt="Making sure to select NAT so that the right configuration is set."/>
<img src="https://i.imgur.com/dSj2FPn.png" height="80%" width="80%" alt="Selecting the right NIC for the NAT serivce."/>

<p align="center"> Now go back to the Server Manager yet again to set up the Dynamic Host Configuration Protocol (DHCP) on the DC based on the Diagram Specifications.<br/>
<img src="https://i.imgur.com/XyfXpWx.png" height="80%" width="80%" alt="Selecting DHCP Service."/>
 <img src="https://i.imgur.com/dOItTTP.png" height="80%" width="80%" alt="Installing DHCP to AD."/>
<img src="https://i.imgur.com/lOFz6cT.png" height="80%" width="80%" alt="Configuring the DHCP server."/>

<p align="center"> Download and run the <a href="https://github.com/joshmadakor1/AD_PS">PowerShell </a> script within the DC VM to create 1000 users in AD.<br/>
<img src="https://i.imgur.com/C9rAmd9.png" height="80%" width="80%" alt="Powershell add users picture"/>
<img src="https://i.imgur.com/JqbPbwj.png" height="80%" width="80%" alt="List of users in AD"/>
<br />

<p align="center"> Create a new VM and name it (Example- Client1) and install Windows 10 (Make sure to Select Windows 10 PRO) in order to be able to use this VM to connect to our new domain. Connect the Client VM to the network, then to the domain by adding it to the System Properties.<br />
<img src="https://i.imgur.com/yeXFsMB.png" height="80%" width="80%" alt="Creating the Client VM"/>
<img src="https://i.imgur.com/o3f6BNw.png" height="80%" width="80%" alt="Making sure to use the Windows 10 .iso File to mount it to."/>
<img src="https://i.imgur.com/sfWh9Cu.png" height="80%" width="80%" alt="Making sure to select Windows 10 Pro"/>
<img src="https://i.imgur.com/vwfOydS.png" height="80%" width="80%" alt="Adding the client to the Domain"/>

 
<p align="center"> Login to the client machine within the domain using a domain account. As you can see the client VM shows that we are now in the domain. <br />
<img src="https://i.imgur.com/ShyiWPJ.png" height="80%" width="80%" alt="Logging in to Active Directory as an Administrator."/>
