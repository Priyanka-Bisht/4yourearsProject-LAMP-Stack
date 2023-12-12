
# 4yourears-project




## Tool Used

* Ansible
* Packer
* Azure Devops
* GCP
* Terraform



## Troubleshooting
* When you create a VM image from packer, you have to enter the details along with the source and destination in the ansible playbook, task k and specific block.

* To configure nginx reverse proxy, the server block in nginx.conf has to be removed because it includes /etc/nginx/conf.d/*.conf; If nginx.conf redirects to the server block, it will direct to the location of the same server block, but we have to redirect the reverse proxy to the file location of conf.d.

* default.conf and web.conf have to be created inside conf.d folder.

