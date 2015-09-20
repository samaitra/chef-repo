default['customers']['user'] = 'web_admin'
default['customers']['group'] = 'web_admin'

default['customers']['document_root'] = '/var/www/customers/public_html'

default['customers']['enabled_firewall_rules'] = %w(firewall_http firewall_sshd)
default['customers']['passwords']['secret_path'] = '/etc/chef/encrypted_data_bag_secret'

default['customers']['database']['dbname'] = 'products'
default['customers']['database']['host'] = '127.0.0.1'
default['customers']['database']['username'] = 'root'
default['customers']['database']['app']['username'] = 'db_admin'
