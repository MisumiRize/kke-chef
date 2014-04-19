# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "aws-dummy"
  config.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

  config.vm.provider "aws" do |aws, override|
    aws.access_key_id = ENV["AWS_ACCESS_KEY_ID"]
    aws.secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]
    aws.region = "ap-northeast-1"
    aws.instance_type = "t1.micro"
    aws.ami = "ami-5769f956"
    aws.keypair_name = "beloved-ellie"
    aws.security_groups = ["web"]
    override.ssh.username = "ec2-user"
    override.ssh.private_key_path = "~/.ssh/beloved-ellie.pem"
    override.ssh.pty = true
  end

  config.omnibus.chef_version = :latest

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.add_recipe "imagelibs"
    chef.add_recipe "opencv"
    chef.add_recipe "imagemagick"
    chef.add_recipe "imagemagick::devel"
    chef.add_recipe "ruby"
    chef.add_recipe "git"
    chef.add_recipe "nginx"
  
    chef.json = {
      nginx: {
        repo_source: "nginx",
        default_site_enabled: false
      },
      rbenv: { group_users: ["ec2-user"] },
      opencv: { install_method: "source" }
    }
  end
end
