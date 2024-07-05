test pve connections

ansible pvenodes -i inventory -m ping --user+root -k

than run the playbook

ansible-playbook pve_onboard.yml -i inventory --user=root -k

then test connection with new ssh key 

ansible pvenodes -m ping -i inventory --user=ansible --private-key ~/.ssh/ansible-key

