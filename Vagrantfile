require 'getoptlong'

opts = GetoptLong.new(
  [ '-f', GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--env', GetoptLong::OPTIONAL_ARGUMENT ],
  [ '--provision', GetoptLong::OPTIONAL_ARGUMENT ],
)

env='prod'

opts.each do |opt, arg|
  case opt
    when '--env'
      env=arg
  end
end

Vagrant.configure(2) do |config|
    config.vm.box = 'ubuntu/trusty32'
    config.vm.network 'private_network', ip: '192.168.33.3'

    config.vm.synced_folder '.', '/vagrant', disabled: true

    config.vm.synced_folder './provision', '/var/provision', :nfs => { :mount_options => ['fmode=666'] }

    config.ssh.forward_agent = true

    config.vm.provider 'virtualbox' do |vb|
        vb.name = 'casebox'
        vb.memory = '2048'
    end

    config.vm.provision 'shell', inline: <<-SHELL, privileged: true
        echo "================================================================";
        echo "Installing common software...";
        echo "================================================================";
        chmod +x /var/provision/bash/preinstall.sh
        source /var/provision/bash/preinstall.sh
    SHELL

    config.vm.provision 'shell', inline: <<-SHELL, privileged: false
        echo "================================================================";
        echo "Installing (core software) Nginx, PHP, MySQL, LibreOffice etc...";
        echo "================================================================";
        ansible-playbook -i "localhost," -c local /var/provision/ansible/default.yml
    SHELL

    config.vm.provision 'shell', inline: <<-SHELL, privileged: false
        echo "================================================================";
        echo "Installing Casebox Admin UI...";
        echo "================================================================";
        ansible-playbook -i "localhost," -c local /var/provision/ansible/dashboard.yml
    SHELL

    if env == 'dev'
        config.vm.provision 'shell', inline: <<-SHELL, privileged: false
            echo "================================================================";
            echo "Installing SAMBA...";
            echo "================================================================";
            ansible-playbook -i "localhost," -c local /var/provision/ansible/sharing/casebox.yml
        SHELL
    end

    config.vm.provision 'shell', run: 'always', inline: <<-SHELL, privileged: false
        echo "================================================================";
        echo "Restart vagrant services...";
        echo "================================================================";
        ansible-playbook -i "localhost," -c local /var/provision/ansible/services.yml
    SHELL

    config.vm.provision 'shell', run: 'always', inline: <<-SHELL, privileged: false
        echo "================================================================";
        echo " ";
        echo " ";
        echo "Launch Casebox Admin UI: http://192.168.33.3:8000";
        echo " ";
        echo " ";
        echo "================================================================";
    SHELL
end
