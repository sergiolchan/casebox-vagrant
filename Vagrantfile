Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty32'
  config.vm.network 'private_network', ip: '192.168.33.11'

  config.vm.synced_folder '.', '/vagrant', disabled: true

  if Vagrant::Util::Platform.windows?
    config.vm.synced_folder 'provision', '/var/www/provision', :mount_options => ['fmode=666'], :owner => 'vagrant', :group => 'vagrant'
  else
    config.vm.synced_folder 'provision', '/var/www/provision', :nfs => { :mount_options => ['fmode=666'] }
  end

  config.vm.synced_folder './www', '/var/www/html', type: 'nfs'

  config.ssh.forward_agent = true

  config.vm.provider 'virtualbox' do |vb|
  	vb.memory = '2048'
  end

  config.vm.provision 'shell', inline: <<-SHELL
    sudo apt-get update --fix-missing;
    sudo apt-get install -y python-pip;
    sudo pip install ansible;
    sudo apt-get autoremove -y;
  SHELL

  config.vm.provision 'shell', run: 'always', inline: <<-SHELL, privileged: false
    echo "==========================================";
    echo "Please wait until installation is finished";
    echo "==========================================";
    ansible-playbook --inventory-file=/var/www/provision/ansible/hosts --connection=local /var/www/provision/ansible/casebox.local.yml
  SHELL

end
