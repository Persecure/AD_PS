# Active Directory Bulk User Creation
<!-- wp:paragraph -->
<p>This project will showcase how Windows Server 2019 Active Directory can create and add users with PowerShell Automation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>**<em>Special Thanks to<strong> Josh Madakor</strong> on YouTube for the tutorial.</em></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5415,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-586.png?w=1011" alt="" class="wp-image-5415"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center"} -->
<p class="has-text-align-center"><strong>Steps</strong></p>
<!-- /wp:paragraph -->

<!-- wp:group {"layout":{"type":"flex","orientation":"vertical"},"fontSize":"small"} -->
<div class="wp-block-group has-small-font-size"><!-- wp:list {"ordered":true} -->
<ol><!-- wp:list-item -->
<li><a href="#1">Setting up the Network</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#2">Installing Guest Additions</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#3">Identify and Configure the Network adapters</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#4">Rename the PC</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#5">Install Active Directory Domain Services</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#6">Create Domain Admin account</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#7">Install and configure RAS/NAT</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#8">Install and configure a DHCP</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#9">Download Powershell scripts from Github</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#10">PowerShell script setup and explanation</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#11">Change directory to script director</a>y</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#12">Run Script</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#13">Install Windows 10</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="#14">Test a new user</a></li>
<!-- /wp:list-item --></ol>
<!-- /wp:list --></div>
<!-- /wp:group -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph -->
<p><em>Requirements:</em></p>
<!-- /wp:paragraph -->

<!-- wp:list {"fontSize":"small"} -->
<ul class="has-small-font-size"><!-- wp:list-item -->
<li>Oracle VirtualBox</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Windows Server 2019</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Windows 10</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><em>Download Requirements:</em></p>
<!-- /wp:paragraph -->

<!-- wp:list {"fontSize":"small"} -->
<ul class="has-small-font-size"><!-- wp:list-item -->
<li><a href="https://www.virtualbox.org/wiki/Downloads">https://www.virtualbox.org/wiki/Downloads</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2019" target="_blank" rel="noreferrer noopener">https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2019</a></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><a href="https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise" target="_blank" rel="noreferrer noopener">https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise</a></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="1"><strong>Setting up the Network</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Before installing the server we need to create two adapters for the network. This can be configured in the <em>Network</em> settings in VirtualBox. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>One for connecting to the internet.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":4999,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-413.png?w=632" alt="" class="wp-image-4999"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>The other for an internal network.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5001,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-414.png?w=639" alt="" class="wp-image-5001"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="2"><strong>Installing Guest Additions</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>After the setup is done we need to Install VirtualBox Guest Additions to make the virtual machine run smoothly.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>On the top of the tab click on <strong><em>Devices</em></strong> and then <strong><em>Install Guest Addition CD image</em></strong>. Then head<strong><em> File Explorer</em></strong> click on the <strong><em>This PC</em></strong> tab and click <strong><em>CD Drive (D:) VirtualBox Guest Additions</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5005,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-415.png?w=1018" alt="" class="wp-image-5005"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Click on the<strong><em> amd64</em></strong> application and install the program. </p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5006,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-416.png?w=790" alt="" class="wp-image-5006"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="3"><strong>Identify and Configure the Network adapters</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Head to the network options on the bottom right of the screen and click on <strong><em>Change adapter options</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5055,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-437.png?w=787" alt="" class="wp-image-5055"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Let's identify which network connects to the internet and which is the internal network.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Right click on each network <strong><em>status</em></strong> and look at the <strong><em>details</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5056,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-438.png?w=660" alt="" class="wp-image-5056"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>The IP address below connects to the internet.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5057,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-439.png?w=366" alt="" class="wp-image-5057"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>And the one below is an internal network.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5058,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-440.png?w=364" alt="" class="wp-image-5058"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Let's rename both networks to easily identify them.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5060,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-441.png?w=626" alt="" class="wp-image-5060"/><figcaption class="wp-element-caption">Now assign a IP address to the internal network. </figcaption></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Right click on the internal network and click on <strong><em>properties</em></strong>. Double click on <strong><em>IPv4 </em></strong>to assign an address.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5061,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-442.png?w=359" alt="" class="wp-image-5061"/></figure>
<!-- /wp:image -->

<!-- wp:image {"id":5062,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-443.png?w=399" alt="" class="wp-image-5062"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Input the following IP addresses.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5064,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-444.png?w=394" alt="" class="wp-image-5064"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="4"><strong>Rename the PC</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Right click the start menu and head to system and <strong><em>Rename this PC</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5066,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-445.png?w=793" alt="" class="wp-image-5066"/></figure>
<!-- /wp:image -->

<!-- wp:image {"id":5068,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-446.png?w=679" alt="" class="wp-image-5068"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="5"><strong>Install Active Directory Domain Services</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In the <strong>Server Manage</strong>r we click <strong><em>Add roles and features</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5080,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-448.png?w=996" alt="" class="wp-image-5080"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>In the installation <strong>Server Roles</strong> section we click on the <strong><em>Active Directory Domain Services</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5082,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-449.png?w=754" alt="" class="wp-image-5082"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Click next until installation is complete. We will receive a flag notification on the top right of the screen.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5084,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-450.png?w=997" alt="" class="wp-image-5084"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Click on the notification and <strong><em>Promote this server to a domain controller</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5086,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-451.png?w=961" alt="" class="wp-image-5086"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>In the Deployment Configuration menu, <strong><em>Add a new forest</em></strong> and insert a <strong><em>root domain name</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5088,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-452.png?w=976" alt="" class="wp-image-5088"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Enter the password.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5090,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-453.png?w=955" alt="" class="wp-image-5090"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Once the entire installation is done you will be signed out of the machine.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5092,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-454.png?w=851" alt="" class="wp-image-5092"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>There will be a new login page with your domain.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5094,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-455.png?w=818" alt="" class="wp-image-5094"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="6"><strong>Create Domain Admin account</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Head to the <strong><em>Windows Administrative Tools</em></strong> folder and click on <strong><em>Active Directory Users and Computers</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5096,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-456.png?w=816" alt="" class="wp-image-5096"/></figure>
<!-- /wp:image -->

<!-- wp:image {"id":5098,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-457.png?w=756" alt="" class="wp-image-5098"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Right click on <strong>mydomain.com </strong>--&gt; <strong><em>New </em></strong>--&gt; <strong><em>Organizational Unit</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5099,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-458.png?w=751" alt="" class="wp-image-5099"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Add a new Organizational Unit.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5100,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-459.png?w=437" alt="" class="wp-image-5100"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Once added , right click on the <strong>new folder</strong> --&gt;<strong><em> New </em></strong>--&gt; <strong><em>User</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5102,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-460.png?w=801" alt="" class="wp-image-5102"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Enter the details for the new user.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5104,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-461.png?w=434" alt="" class="wp-image-5104"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Create a password , since it is a lab account click on the <strong><em>Password never expires</em></strong> box.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5107,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-463.png?w=437" alt="" class="wp-image-5107"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Once the new user is added, right click --&gt; <strong><em>Properties</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5108,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-464.png?w=752" alt="" class="wp-image-5108"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Click on the <strong><em>Member of</em></strong> tab and <strong><em>Add</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5109,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-465.png?w=410" alt="" class="wp-image-5109"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Enter <strong><em>Domain Admins</em></strong> into the object names --&gt; <strong><em>Check Names</em></strong> --&gt;<strong><em> ok</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5111,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-466.png?w=457" alt="" class="wp-image-5111"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>The new user will have Administrative rights.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5113,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-467.png?w=408" alt="" class="wp-image-5113"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Log out of the current user click on the <strong><em>Other User</em></strong> and enter the new account with password.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5115,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-468.png?w=877" alt="" class="wp-image-5115"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="7"><strong>Install and configure RAS/NAT</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In the <strong>Server Manage</strong>r we click <strong><em>Add roles and features</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5162,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-484.png?w=877" alt="" class="wp-image-5162"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Add the <strong><em>Remote Access</em></strong> role.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5163,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-485.png?w=585" alt="" class="wp-image-5163"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>In the <strong><em>Role Services</em></strong> part of the installation add the <strong><em>Routing </em></strong>option.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5165,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-486.png?w=756" alt="" class="wp-image-5165"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Once installed head to <strong><em>Tools</em></strong> --&gt; <strong><em>Routing and Remote Access</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5167,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-487.png?w=895" alt="" class="wp-image-5167"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Right click on the Domain Controller --&gt; <strong><em>Configure and Enable Routing and Remote Access</em></strong> option</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5169,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-488.png?w=619" alt="" class="wp-image-5169"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Add the <strong><em>NAT</em></strong> configuration</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5171,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-489.png?w=494" alt="" class="wp-image-5171"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Select the Network interface that is has the internet.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5173,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-490.png?w=494" alt="" class="wp-image-5173"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>If done right, DC will be in the green.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5175,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-491.png?w=622" alt="" class="wp-image-5175"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="8"><strong>Install and configure a DHCP</strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5268,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-528.png?w=814" alt="" class="wp-image-5268"/><figcaption class="wp-element-caption"><a rel="noreferrer noopener" href="https://www.infoblox.com/glossary/dhcp-server/" target="_blank"><em>https://www.infoblox.com/glossary/dhcp-server/</em></a></figcaption></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>In the <strong>Server Manage</strong>r we click <strong><em>Add roles and features</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5080,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-448.png?w=996" alt="" class="wp-image-5080"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>In the installation <strong>Server Roles</strong> section we click on the <strong><em>DHCP Server</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5236,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-514.png?w=782" alt="" class="wp-image-5236"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Click next for everything and once installed head to <strong><em>Tools</em></strong> --&gt; <strong>DHCP</strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5237,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-515.png?w=1011" alt="" class="wp-image-5237"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Right click on the <strong><em>DHCP server icon</em></strong> --&gt; <strong><em>New Scope</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5238,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-516.png?w=729" alt="" class="wp-image-5238"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>In the <strong><em>Scope Name</em></strong> section add a name , I have chose to put the DHCP IP range.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5240,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-517.png?w=509" alt="" class="wp-image-5240"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>In the <strong><em>IP Address Range</em></strong> fille in the <strong><em>Start</em></strong> and <strong><em>End</em></strong> IP addresses and change the<strong><em> length</em></strong> to <strong><em>24</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5242,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-518.png?w=512" alt="" class="wp-image-5242"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong><em>Add</em></strong> the <strong><em>Router IP address</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5244,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-519.png?w=514" alt="" class="wp-image-5244"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Once installation is done right click on the <strong><em>DHCP server</em></strong> and <strong><em>Authorize</em></strong> it.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5246,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-520.png?w=726" alt="" class="wp-image-5246"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>And then <strong><em>Refresh</em></strong> it to make the server in the green.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5248,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-521.png?w=727" alt="" class="wp-image-5248"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Now we need to install a Router. Head to the <strong><em>IPv4 </em></strong>--&gt; <strong><em>Server Option</em></strong> --&gt;<strong><em> Right click &amp; Configure Options</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In the General tab add the <strong><em>003 Router</em></strong> and add the<strong><em> IP address</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5387,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-578.png?w=951" alt="" class="wp-image-5387"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Restart the server</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5389,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-579.png?w=785" alt="" class="wp-image-5389"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Installation of the DHCP server is done.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5250,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-522.png?w=734" alt="" class="wp-image-5250"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="9"><strong>Download Powershell scripts from Github</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In this chapter we are going to download some prebuilt powershell scripts from Github. First head to the <strong><em>Server Manager</em></strong> and <strong><em>Configure this local server</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5252,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-523.png?w=1002" alt="" class="wp-image-5252"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>In the properties section click on <strong><em>IE Enhanced Security Configuration</em></strong> and <strong><em>off</em></strong> both options. This will make the browsing on your lab less spamy from windows security.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5254,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-524.png?w=986" alt="" class="wp-image-5254"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Head to the internet browser and head to this link below:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><a rel="noreferrer noopener" href="https://github.com/Persecure/AD_PS" target="_blank"><strong>https://github.com/Persecure/AD_PS</strong></a></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Download the 1_CREATE_USERS &amp; names.txt files</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5258,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-526.png?w=788" alt="" class="wp-image-5258"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>There are randomly generated names list that we will be using on our lab.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5260,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-527.png?w=685" alt="" class="wp-image-5260"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="10"><strong>PowerShell script setup and explanation</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In this section we are going to run the prebuilt PowerShell script in PowerShell ISE. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Right click on<strong><em> Windows PowerShell ISE</em></strong> --&gt; <strong><em>Run as administrator</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5360,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-570.png?w=856" alt="" class="wp-image-5360"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Before running the script we need to input a command to disable a safety feature. Since it is a lab. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Run <strong><em>Set-ExecutionPolicy Unrestricted</em></strong> in the command line.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5361,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-571.png?w=955" alt="" class="wp-image-5361"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Load up the powershell script in the ISE.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5363,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-572.png?w=1024" alt="" class="wp-image-5363"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Here I'll explain the PowerShell script in detail.</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"powershell"} -->
<pre class="wp-block-syntaxhighlighter-code"># ----- Edit these Variables for your own Use Case ----- #
$PASSWORD_FOR_USERS   = "Password1"
$USER_FIRST_LAST_LIST = Get-Content .\names.txt
# ------------------------------------------------------ #

# --- Converts plain text or encrypted strings to secure strings --- #
$password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force

# --- Creates an Active Directory organizational unit --- #
New-ADOrganizationalUnit -Name _USERS -ProtectedFromAccidentalDeletion $false

# --- A loop function that takes the first alphabet in the first name and combines with the last name--- #
foreach ($n in $USER_FIRST_LAST_LIST) {
    $first = $n.Split(" ")[0].ToLower()
    $last = $n.Split(" ")[1].ToLower()
    $username = "$($first.Substring(0,1))$($last)".ToLower()
    Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Cyan
    
# --- Creates an Active Directory user with the details provided--- #

    New-AdUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=_USERS,$(([ADSI]`"").distinguishedName)" `
               -Enabled $true
}
</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="11"><strong>Change directory to script directory</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Before running the script we need to change the directory to the script directory. Insert the following command:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong><em>cd C:\Users\&lt;YOUR USER NAME&gt;\Desktop\AD_PS-master</em></strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5366,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-573.png?w=1024" alt="" class="wp-image-5366"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="12"><strong>Run Script</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Let's run the script by clicking on the play which is a green button on the top toolbar.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Once done we can open up <strong><em>Active Directory Users and Computers</em></strong> --&gt; <strong><em>_USERS</em></strong> to see our newly created users.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5369,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-574.png?w=1024" alt="" class="wp-image-5369"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>To confirm the users we can search for our own user.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5370,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-575.png?w=1024" alt="" class="wp-image-5370"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="13"><strong>Install Windows 10 </strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Check for ip address and ping to check for internet connectivity.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5391,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-580.png?w=1019" alt="" class="wp-image-5391"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Ping the domain.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5393,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-581.png?w=710" alt="" class="wp-image-5393"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Head to <strong><em>System </em></strong>--&gt; <strong><em>Rename this PC (advanced)</em></strong> --&gt; <strong><em>Change</em></strong> and Insert the new <strong><em>Computer name</em></strong> and insert <strong><em>Domain</em></strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5395,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-582.png?w=931" alt="" class="wp-image-5395"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Head back to the <strong><em>Windows server</em></strong> --&gt; <strong><em>DHCP</em></strong> --&gt; <strong><em>Address Leases</em></strong> and we can the Client1 machine connecting to our server.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5396,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-583.png?w=820" alt="" class="wp-image-5396"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>In the <strong><em>Active Directory Users and Computers</em></strong> we can see a newly added computer.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5397,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-584.png?w=747" alt="" class="wp-image-5397"/></figure>
<!-- /wp:image -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"pale-cyan-blue"} -->
<p class="has-text-align-center has-pale-cyan-blue-background-color has-background" id="14"><strong>Test a new user</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Head back to the Windows 10 machine and log in with any list of users that was created via PowerShell script and we have access to the user with internet connectivity.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":5399,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://persecure.files.wordpress.com/2022/09/image-585.png?w=880" alt="" class="wp-image-5399"/></figure>
<!-- /wp:image -->

<!-- wp:separator {"className":"is-style-dots"} -->
<hr class="wp-block-separator has-alpha-channel-opacity is-style-dots"/>
<!-- /wp:separator -->

<!-- wp:paragraph {"align":"center","backgroundColor":"cyan-bluish-gray"} -->
<p class="has-text-align-center has-cyan-bluish-gray-background-color has-background"><em>This is the end of the tutorial</em></p>
<!-- /wp:paragraph -->
