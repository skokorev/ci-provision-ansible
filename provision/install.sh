sudo apt-get install dirmngr --install-recommends -y
sudo apt-get install software-properties-common -y
sudo apt-key add gpg
sudo add-apt-repository "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt-get update
sudo apt-get install ansible --allow-unauthenticated -y