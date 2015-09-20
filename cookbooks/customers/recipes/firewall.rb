#
# Cookbook Name:: customers
# Recipe:: firewall
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'iptables::default'

node['customers']['enabled_firewall_rules'].each do |rule|
  iptables_rule rule do
    action :enable
  end
end
