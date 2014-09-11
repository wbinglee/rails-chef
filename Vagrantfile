# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "Opscode-Ubuntu-14.04"

  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  
  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Vagrant omnibus plugin to install chef  
  config.omnibus.chef_version = '11.10.4'

  # Vagrant librarian chef plugin to update chef community cookbooks
  # config.librarian_chef.cheffile_dir = "ops/chef"

  config.vm.define "rails" do
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path = "roles"
      chef.data_bags_path = "data_bags"

      chef.add_role "db"
      chef.add_role "redis"
      chef.add_role "rails"
    
      # You may also specify custom JSON attributes:
      chef.json = {
                    mysql: {
                      server_root_password: "rootpassword"                    
                    },
                    rails: {
                      app: {
                        name: "vagrant",
                        domain_names: ["vagrant.dev"],
                        deploy_path: "/var/data/rails"
                      },
                      database: {
                        name: "railsdb",
                        user: "railsuser",
                        password: "railspassword"
                      }
                    }            
                  }
    end
  end
  
end
