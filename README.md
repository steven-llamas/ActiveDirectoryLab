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

 <p> This is the diagram that is going to be used to set up the two main virtual machines (VMs) for the home lab environment. The first VM will be the Domain Controller (DC), which is the sever that runs Active Directory (AD) and all its components, so we need to set it up with all the following services. The Fully Qualified Domain Name (FQDN) is the complete domain name for AD, which we will need to set up within the DC in order to have clients connect to the AD server. Network Address Translation (NAT) will need to be setup as well in order to have the internal Network Interface Card (NIC) comunicate with the internet NIC, so that internet access is avilable within the domain when users sign in to the domain. Lastly, Dynamic Host Configuration Protocol (DHCP) is set up so that when Clients sign on to the domain, they automatically get leased an IP address and are immediatly connected to the Internet. </p>
<br />

<h2>Files to Download and Install</h2>

- <a href="https://www.virtualbox.org/">Oracle Virtual Box</a>
- <a href="https://www.microsoft.com/en-us/software-download/windows10">Windows 10 .iso</a>
- <a href="https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2019">Windows Server 2019</a>

<h2>Tutorial Portion</h2>

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

 
<p align="center"> Login to the client machine within the domain using a domain account. As you can see the client VM shows that we are now in the domain. <br/>
<img src="https://i.imgur.com/ShyiWPJ.png" height="80%" width="80%" alt="Logging in to Active Directory as an Administrator."/>

<h2>Additional Guides to other features in AD to tinker with (Not Required)</h2>

<p align="center"> To Create a new Organizational Unit (OU), go to Active Directory Users and Computers and then right click the domain (in this case THM) and select new, then Organizational Unit. <br />
<img src="https://i.imgur.com/pgk0PH3.png" height="80%" width="80%" alt="Creating an Organizational Unit."/>

<p align="center"> To Delete an OU, you must activate Advanced Features under view in order to be able to select the OU properties and uncheck Protect from accidental Deletion. <br />
<img src="https://i.imgur.com/ZNmCqKv.png" height="80%" width="80%" alt="Unable to delete OU."/>
<img src="https://i.imgur.com/vEMO7M0.png" height="80%" width="80%" alt="Selecting Advanced Features."/>
<img src="https://i.imgur.com/vEMO7M0.png" height="80%" width="80%" alt="Showing the difference when selecting Advanced Features."/>
<img src="https://i.imgur.com/o84JWyk.png" height="80%" width="80%" alt="Selecting Properties to be able to uncheck Prevent accidental Deletion."/>
<img src="https://i.imgur.com/tMUFjbI.png" height="80%" width="80%" alt="While in Properties, uncheck Prevent accidential Deletion."/>
<img src="https://i.imgur.com/j8TIe6T.png" height="80%" width="80%" alt="Deleting a OU right clicking on OU selecting Delete."/>
<img src="https://i.imgur.com/0MUuRxM.png" height="80%" width="80%" alt="Caution popup appears, to delete clck yes."/>

<p align="center"> Checking Login of a User, you must enable Advanced Features (if not enabled already), right click on the user, go to properties, within properties select the Attribute Editor tab and look for lastLogon. <br />
<img src="https://i.imgur.com/vEMO7M0.png" height="80%" width="80%" alt="Selecting Advanced Features."/>
<img src="https://i.imgur.com/iauD9Gu.png" height="80%" width="80%" alt="Showing the Last Logon of Bob for example."/>

<p align="center"> To Delegate control of a OU, or give privileges to certain users (giving IT privileges to reset passwords for the sales dept. for example) you must right click the OU and right click Delegate Control. There another popup appears where you click next and are able to give access to users or groups and specify what privileges they get to recieve.<br />
<img src="https://i.imgur.com/1G6CTld.png" height="80%" width="80%" alt="Right clicking on OU and selecting Delegate Control."/>
<img src="https://i.imgur.com/P1iN7C7.png" height="80%" width="80%" alt="popup that appears after seleting Delegate Control."/>
<img src="https://i.imgur.com/QHveZhM.png" height="80%" width="80%" alt="The next page that appears after clicking Next."/>
<img src="https://i.imgur.com/k6QF2m2.png" height="80%" width="80%" alt="Clicking Add on the Add Users/Groups, typing a User and clicking Verify to make sure the right User is selected."/>
<img src="https://i.imgur.com/G0G85la.png" height="80%" width="80%" alt="Showing the Change, when clicking verify."/>
<img src="https://i.imgur.com/V0zyaMR.png" height="80%" width="80%" alt="After clicking Next, the next page shows the users added, so double check to see if everything is correct."/>
<img src="https://i.imgur.com/zfYRv0c.png" height="80%" width="80%" alt="Next, you are able to pick and choose what options to give to the selected user(s) or group(s), here we selected to allow the user to reset passwords for the OU."/>
<img src="https://i.imgur.com/NvsFeaL.png" height="80%" width="80%" alt="After clicking next, shows everthing you have chosen to do and once again, it is a good idea to check everthing over once again."/>
<img src="https://i.imgur.com/HNuDmac.png" height="80%" width="80%" alt="Using Remote Desktop (RDP) in order to check to see if our changes worked"/>
<img src="https://i.imgur.com/j73KYqM.png" height="80%" width="80%" alt="Logging in to the IT users AD account to test the changes."/>
<img src="https://i.imgur.com/PlrFKVl.png" height="80%" width="80%" alt="using CMD to reset another user password through IT user AD account to make sure it works."/>
<img src="https://i.imgur.com/VqowlMC.png" height="80%" width="80%" alt="Logging in as User that we reset the password for."/>
<img src="https://i.imgur.com/CtYsBiI.png" height="80%" width="80%" alt="Showing that this User needs to reset their password before logging in"/>
<img src="https://i.imgur.com/t4Ly0yN.png" height="80%" width="80%" alt="Showing the Password change process a typical user would do."/>
<img src="https://i.imgur.com/EQ7MMyQ.png" height="80%" width="80%" alt="Showing that we were able to log in to the account after changing password."/>

<p align="center"> Managing Computers In AD, In this example, we created another OU to differentiate between workstations and servers, which can be helpful when managing the domain, as it would be easier to create different policies for each OU.<br />
<img src="https://i.imgur.com/pgk0PH3.png" height="80%" width="80%" alt="Creating an Organizational Unit."/>
<img src="https://i.imgur.com/ysLwLXq.png" height="80%" width="80%" alt="Nameing the new OU."/>
<img src="https://i.imgur.com/u39Ra2L.png" height="80%" width="80%" alt="Showing the New OU in the domain."/>
<img src="https://i.imgur.com/sfONJpy.png" height="80%" width="80%" alt="Moving the computers to the new OU."/>
<img src="https://i.imgur.com/ciWVkZc.png" height="80%" width="80%" alt="Shwoing the folder the objects will move to."/>
<img src="https://i.imgur.com/ej8Dc0J.png" height="80%" width="80%" alt="Showing where the objects have ended up."/>


<p align="center">Examples of Group policy editor, and examples of whats in a policy. Policies created are under the Group Policy Objects, when linked (when they are actively used) will show them under the OUs or Domain.<br />
<img src="https://i.imgur.com/w6nsOMQ.png" height="80%" width="80%" alt="Searching for the Group Policy Editor."/>
<img src="https://i.imgur.com/K77VAHC.png" height="80%" width="80%" alt="Showing the Group Policy Editor."/>
<img src="https://i.imgur.com/if2tmWk.png" height="80%" width="80%" alt="Example of a Default Domain Policy."/>
<img src="https://i.imgur.com/EJxRSso.png" height="80%" width="80%" alt="Showing the Computer configuration tab to show the policies."/>
<img src="https://i.imgur.com/FOhPMkY.png" height="80%" width="80%" alt="Showing what is under those policies."/>

<p align="center">Showing how to edit a poilicy example. In this example, we will be showing how one would go to edit the Minimum password length policy. <br />
<img src="https://i.imgur.com/sxzmwpP.png" height="80%" width="80%" alt="Right clicking a policy and selecting edit."/>
<img src="https://i.imgur.com/jc6GkSO.png" height="80%" width="80%" alt="Finding the Minimum password length policy."/>
<img src="https://i.imgur.com/Uy3SQoM.png" height="80%" width="80%" alt="Right clicking properties of selected policy to edit it."/>
<img src="https://i.imgur.com/lcWNUdw.png" height="80%" width="80%" alt="Showing the popup that appears when clicking properties on a policy."/>
<img src="https://i.imgur.com/uJxdIfc.png" height="80%" width="80%" alt="Showing that policies may have an explaination tab that details what the policy does."/>


<p align="center">After creating and editing a Group Policy Object, the next step would be to link the policy to OU(s) needed, in this example we will be linking the Prohibit Accesss to Control Panel and PC settings policy to 3 OUs inside the Domain, as well as the Auto Lock Screen policy to the whole domain instead of specific OUs.<br />
<img src="https://i.imgur.com/yP8DViH.png" height="80%" width="80%" alt="Editing another GPO"/>
<img src="https://i.imgur.com/KFxMt6g.png" height="80%" width="80%" alt="Selecting a Policy setting and editing it."/>
<img src="https://i.imgur.com/P9vJ7h5.png" height="80%" width="80%" alt="Showing the Prohibit access to control panel and PC settings popup."/>
<img src="https://i.imgur.com/gWm6g7S.png" height="80%" width="80%" alt="Right clicking the OU and linking the group policy to it."/>
<img src="https://i.imgur.com/8F9aQtI.png" height="80%" width="80%" alt="Selecting the correct Group Policy Object to link it to."/>
<img src="https://i.imgur.com/c7SUr7W.png" height="80%" width="80%" alt="Repeating the process so that Managment, Marketing, Research and Development, and Sales have the GPO"/>
<img src="https://i.imgur.com/BsfJwlT.png" height="80%" width="80%" alt=" Editing the Auto Lock Screen GPO."/>
<img src="https://i.imgur.com/ORj3BVW.png" height="80%" width="80%" alt="Editing the specific policy in the GPO"/>
<img src="https://i.imgur.com/uEC0Jvb.png" height="80%" width="80%" alt="Editing the Poliicy time limit for auto lock."/>
<img src="https://i.imgur.com/dCBh3aX.png" height="80%" width="80%" alt="popup that appears verifying that you want to place the GPO to the whole domain."/>
<img src="https://i.imgur.com/0t0iKqV.png" height="80%" width="80%" alt="Showing that the Domain has the Auto Lock Screen GPO."/>
<img src="https://i.imgur.com/NvrzGSJ.png" height="80%" width="80%" alt="using RDP to test out the GPO"/>
<img src="https://i.imgur.com/hHWEA6Q.png" height="80%" width="80%" alt="Trying to open the Control Panel application"/>
<img src="https://i.imgur.com/vZGQrgL.png" height="80%" width="80%" alt="Showing the error that occurs, prohibitng the use of Control Panel."/>
