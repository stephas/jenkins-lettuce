# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.customize ["modifyvm", :id, "--rtcuseutc", "on"]
  config.vm.customize ["modifyvm", :id, "--nictype1", "Am79C973"]

  start_port = 10000

  config.vm.define :jenkins do |jenkins_config|
    jenkins_config.vm.box = "precise64"
    jenkins_config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    jenkins_config.vm.provision :shell, :path => "vagrant/jenkins.sh"
    jenkins_config.vm.provision :shell, :path => "vagrant/final_steps.sh"

    # for jenkins
    jenkins_config.vm.forward_port 8080, start_port + 8080

    # Boot with a GUI so you can see the screen. (Default is headless)
    # jenkins_config.vm.boot_mode = :gui
    #jenkins_config.vm.network :hostonly, "192.168.33.10"
    #jenkins_config.vm.network :bridged
  end

end
