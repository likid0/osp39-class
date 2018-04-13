ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/adhoc/uninstall.yml 
ansible nodes -m shell -a "rm -rf /etc/origin"
ansible nfs -m shell -a "rm -Rf /srv/nfs/*"
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/prerequisites.yml 
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/deploy_cluster.yml 
ansible masters[0] -b -m fetch -a "src=/root/.kube/config dest=/root/.kube/config flat=yes"
