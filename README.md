Bulk deployment of Site24x7 Linux agent using SaltStack
===========

Bulk deployment using SaltStack installs Site24x7 Server Monitoring agent on Linux platforms. Please create a Site24x7 account to install the Linux agent using Chef. Sign Up Now for a Free Trial!


Supported Platforms 
============

All Linux platforms with Glibc version - 2.5 and above,  including Centos, Debian, Fedora, 
Redhat, Suse, Ubuntu

Params
============

apikey: SITE24X7APIKEY 

Your API Key is available under the Site24x7 "Add Server Monitor" page. Log In and navigate to Home > Monitors > Click on the (+) icon > Linux Server Monitoing.

Site24x7 API key is unique for your account. Alternate API Key can also be generated from your Site24x7 account under Admin > Developer > Device Key.

proxy: None

Proxy server required to connect to the Site24x7 servers. Example : user:password@proxyhost:proxyport


Installation Steps
============
1. Ensure you have salt-master and salt-minion set up in your infrastructure.
2. Download the saltstack-site24x7.zip in your salt-master
3. Copy paste the following files :
      a. Copy the file pillar/site24x7.sls to your pillar home directory [ /srv/pillar/ for most users ]. If pillar directory is not there, create it and also add a corresponding entry for pillars in /etc/salt/master.
      b. Copy the files states/install.sls, states/uninstall.sls and states/status.sls into your salt state home directory [ /srv/salt/ for most users ]. If salt state directory is not there, create it and also add a corresponding entry for salts in /etc/salt/master.
3. Make the following changes :
      a. Edit your salt state top.sls file [ /srv/salt/top.sls ]. Add "- install" , "- status" , " -uninstall" entries under your required environment.
      b. Edit your pillar top.sls file [ /srv/pillar/top.sls]. Add "- site24x7" entry under your required environment.
      c. Edit the /srv/pillar/site24x7.sls file. Replace the apikey with the actual device key obtained from our portal. Replace proxy values if required in the proxy field (Let it be "None" if no proxy is required. )
4. Now your setup is complete and you can exectue the below sample commands :
      a. To bulk install our agent in all minions : sudo salt '*' state.sls install
      b. To bulk uninstall our agent in all minions : sudo salt '*' state.sls uninstall
      c. To find out agent status in all minions : sudo salt '*' state.sls status
5. View your servers from your Site24x7 account. https://www.site24x7.com/login.html

Related Links
=====
* [Site24x7 Server Monitoring] (https://www.site24x7.com/server-monitoring.html)
* [Site24x7 Signup] (https://www.site24x7.com/signup.html?pack=5&l=en)
* [Site24x7 Help Documentation] (https://www.site24x7.com/help/admin/adding-a-monitor/linux-server-monitoring.html)

License
=======

(The MIT License)

Copyright © 2015, 2016 Site24x7
Terms of Use (http://www.site24x7.com/terms.html)
Privacy Policy (http://www.site24x7.com/privacypolicy.html)
Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons
to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
