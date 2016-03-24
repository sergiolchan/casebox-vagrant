Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty32'
  config.vm.network 'private_network', ip: '192.168.33.3'

  config.vm.synced_folder '.', '/vagrant', disabled: true

  if Vagrant::Util::Platform.windows?
    config.vm.synced_folder './provision', '/var/provision', :mount_options => ['fmode=666'], :owner => 'vagrant', :group => 'vagrant'
  else
    config.vm.synced_folder './provision', '/var/provision', :nfs => { :mount_options => ['fmode=666'] }
  end

  config.vm.synced_folder './www', '/var/www', type: 'nfs'

  config.ssh.forward_agent = true

  config.vm.provider 'virtualbox' do |vb|
  	vb.memory = '2048'
  end

  config.vm.provision 'shell', inline: <<-SHELL
    sudo apt-get update --fix-missing;
    sudo apt-get install -y python-pip python-dev;
    sudo pip install markupsafe;
    sudo pip install ansible;
    sudo apt-get autoremove -y;
  SHELL

  config.vm.provision 'shell', run: 'always', inline: <<-SHELL, privileged: false
    echo "==========================================";
    echo "Please wait until installation is finished";
    echo "==========================================";
    ansible-playbook -i "localhost," -c local /var/provision/ansible/default.yml
  SHELL

   config.vm.provision 'shell', inline: <<-SHELL, privileged: false
    echo "=============================================";
    echo "Please wait until cbtest core will be created";
    echo "=============================================";
    ansible-playbook -i "localhost," -c local /var/provision/ansible/cbtest.yml
  SHELL

end
