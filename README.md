Momo-api
========

This is the official API for the momo application family.

Contributing
-------
To start developing for ***momo*** we recommend you to use our vagrant environment, though is not required.

**Running on Vagrant:**
  - Install vagrant [http://www.vagrantup.com/]
  - Install VirtualBox [https://www.virtualbox.org/]
  - Clone repo and do:

  ```
  cd <project directory>
  vagrant up
  vagrant-setup.ssh <github username> <github email>
  ```

**Without Vagrant:**
  - setup your ruby environment (required ruby version >= 1.9)
  - clone repo
  
  ```
    cd <project directory>
    bundle install
  ```

Testing
-------

To test files just run ```bundle exec rspec``` on project root folder.

**Gems:**
- FactoryGirl Rails [https://github.com/thoughtbot/factory_girl]
- Rspec Rails [https://github.com/rspec/rspec-rails]

