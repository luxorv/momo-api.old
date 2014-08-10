#!/bin/bash
#Based on https://gorails.com/setup/ubuntu/14.04

#link project to home
vagrant ssh -c "ln -s /vagrant/ ./ & mv vagrant project"

#setup env
vagrant ssh -c "echo 'source ~/project/vagrant/git-config.sh' >> ~/.bashrc"
vagrant ssh -c "echo 'source ~/project/vagrant/setup.bashrc.sh' >> ~/.bashrc"
vagrant ssh -c "echo 'alias cls=clear' >> ~/.bashrc"
vagrant ssh -c "source ~/.bashrc"

vagrant ssh -c "sudo apt-get update"
vagrant ssh -c "sudo apt-get install vim"
vagrant ssh -c "sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties"
vagrant ssh -c "sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev"

#install ruby
vagrant ssh -c "sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev"
vagrant ssh -c "curl -L https://get.rvm.io | bash -s stable"
vagrant ssh -c "source ~/.rvm/scripts/rvm"
vagrant ssh -c "echo 'source ~/.rvm/scripts/rvm' >> ~/.bashrc"
vagrant ssh -c "rvm install 2.1.2"
vagrant ssh -c "rvm use 2.1.2 --default"
vagrant ssh -c "ruby -v"
vagrant ssh -c "echo 'gem: --no-ri --no-rdoc' > ~/.gemrc"

#configure git
vagrant ssh -c "git config --global color.ui true"
vagrant ssh -c "git config --global user.name Rapito"
vagrant ssh -c "git config --global user.email robert.apb@hotmail.com"
vagrant ssh -c "ssh-keygen -t rsa -C robert.apb@hotmail.com"
echo "Copy your public key and paste in github!"
vagrant ssh -c "cat ~/.ssh/id_rsa.pub"

#installing rails
vagrant ssh -c "sudo add-apt-repository ppa:chris-lea/node.js"
vagrant ssh -c "sudo apt-get update"
vagrant ssh -c "sudo apt-get install nodejs"
vagrant ssh -c "gem install rails"
vagrant ssh -c "rails -v"

#installing mongodb
vagrant ssh -c "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10"
vagrant ssh -c "echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list"
vagrant ssh -c "sudo apt-get update"
vagrant ssh -c "sudo apt-get install mongodb-org"
vagrant ssh -c "sudo service mongod start"

#setup project
vagrant ssh -c "gem install mongoid"
vagrant ssh -c "(cd project/; bundle install)"
vagrant ssh -c "(cd project/; rails server)"



#vagrant ssh -c "  "
