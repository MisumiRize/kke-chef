#
# Cookbook Name:: imagelibs
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(libjpeg libjpeg-devel libpng libpng-devel giflib giflib-devel libtiff libtiff-devel).each do |pkg|
  package pkg
end
