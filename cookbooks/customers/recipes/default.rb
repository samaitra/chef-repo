#
# Cookbook Name:: customers
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'selinux::permissive'
include_recipe 'customers::user'
include_recipe 'customers::webserver'
include_recipe 'customers::firewall'
