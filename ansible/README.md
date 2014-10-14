## Ansible Playbooks

### Setup dev enviroment

1. Run ../ vagrant up
2. Copy user ssh keys to root user on 192.168.42.3 and 192.168.42.4

3. Add dev.epyme.co and client.epyme.co to /etc/hosts

4. Create folders ../odoo and ../epyme_platform and clone the repositories into it

5. Install apt-cacher-ng in the host machine
 
6. Run ansible-playbook site.yml

   ```sh
$ ansible-playbook -i develop site.yml 
```

7. Go to 192.168.42.3:8069
