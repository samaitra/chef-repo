#
# Cookbook Name:: customers
# Recipe:: user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

group node['customers']['group']

user node['customers']['user'] do
  group node['customers']['group']
  system true
  shell '/bin/bash'
end

