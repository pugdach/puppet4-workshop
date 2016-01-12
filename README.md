# puppet4-workshop

##Get docker running on your system
[install howto](https://docs.docker.com/engine/installation/)

**Ensure your docker host has at least 4G of memory and 2 or 3 cores**

##Clone the git

	git clone https://github.com/SimonHoenscheid/puppet4-workshop.git /somewhere/puppet4-workshop

##Download the containers
	
	docker pull pugberlin/puppet4workshop:puppet4agent_d8
	docker pull pugberlin/puppet4workshop:puppet4master_d8

##start the puppetserver container, 
**replace /somewhere/puppet4-workshop with your checkout**

	docker run -d --name puppet -v /somewhere/puppet4-workshop:/etc/puppetlabs/code/environments/production -t pugberlin/puppet4workshop:puppet4master_d8 tail -f /dev/null

##connect to the puppetserver container

	docker exec -i -t puppet bash

##add puppet to /etc/hosts 

	echo $(facter networking.ip) $(facter hostname) >> /etc/hosts

##do an agent run

	puppet agent -t --environment production


##start coding 

**changes inside the git repo, will be visible to the puppetmaster, no need to commit**

#start the agent container if needed

	docker run -d --name agent -t pugberlin/puppet4workshop:puppet4agent_d8 tail -f /dev/null

##connect to the agent container

	docker exec -i -t puppet bash

##add master to /etc/hosts

**replace $MASTERIP**

	echo $MASTERIP puppet >> /etc/hosts

##start the agent

	puppet agent -t --environment production


##on the master sign the agent

	puppet cert sign --all
