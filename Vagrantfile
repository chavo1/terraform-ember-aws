Vagrant.configure("2") do |config|
  config.vm.box = "chavo1/bionic64-ember"
  config.vm.network "forwarded_port", guest:4200, host: 4200
  config.vm.provision "shell", path: "ember/ember.sh"
end


