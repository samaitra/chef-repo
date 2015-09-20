#
# Cookbook Name:: customers
# Recipe:: database
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# Configure the mysql2 Ruby gem.

mysql2_chef_gem 'default' do
  action :install
end

# Configure the MySQL client.
mysql_client 'default' do
  action :create
end

# Load the secrets file and the encrypted data bag item that holds the root password.
password_secret = Chef::EncryptedDataBagItem.load_secret(node['customers']['passwords']['secret_path'])
root_password_data_bag_item = Chef::EncryptedDataBagItem.load('passwords', 'sql_server_root_password', password_secret)

# Configure the MySQL service.
mysql_service 'default' do
  initial_root_password root_password_data_bag_item['password']
  action [:create, :start]
end

# Create the database instance.
mysql_database node['customers']['database']['dbname'] do
  connection(
    :host => node['customers']['database']['host'],
    :username => node['customers']['database']['username'],
    :password => root_password_data_bag_item['password']
  )
  action :create
end


# Load the encrypted data bag item that holds the database user's password.
user_password_data_bag_item = Chef::EncryptedDataBagItem.load('passwords', 'db_admin_password', password_secret)


# Add a database user.
mysql_database_user node['customers']['database']['app']['username'] do
  connection(
    :host => node['customers']['database']['host'],
    :username => node['customers']['database']['username'],
    :password => root_password_data_bag_item['password']
  )
  password user_password_data_bag_item['password']
  database_name node['customers']['database']['dbname']
  host node['customers']['database']['host']
  action [:create, :grant]
end
