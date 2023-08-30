#timewebcloud
sops -e -i inventory
mkpasswd --method=sha-512
ansible-vault encrypt_string '' --name worker_secret
ansible-playbook -i inventory --ask-vault-pass  -b -kK playbook.yaml