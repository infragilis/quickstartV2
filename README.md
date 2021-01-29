# Ansible for OnTap Quickstart V2

This quickstart is created to expand the various examples that are listed on ansible.com and netapp.io to enable quick deployment and integration.

# Disclaimer
This Ansible quickstart and sample playbooks are written and compiled from various sources as best effort, and provide no warranties or SLAs, expressed or implied.

# Supported configurations:
1. Minimum Ansible 2.9
2. Minimum ONTAP version - ONTAP 9.7
3. netapp-lib
4. netapp collections from galaxy

# Configuration


# Overview
This quickstart will help you setup/configure Ansible and the included NetApp modules and contains a few working examples to easily expand/adjust in your environment.


**1  Add netapp bits to ansible
pip install netapp-lib
ansible-galaxy collection install netapp.ontap


**2  NetApp cluster settings**
Create a user and set the password for the ansible account:
Cluster::>security login create -user-or-group-name ansible -application ontapi -authentication-method password -role admin
Cluster::>security login create -user-or-group-name ansible -application console -authentication-method password -role admin

choose your password.

Enable the API endpoint on the cluster in advanced mode:

Cluster::> set adv
Cluster::> system services web modify -http-enabled true

**3   Set your variables**
Open the vars.myml file and adjust to your environment, most variables will work without changing, the minimal changes are;
netapp_hostname: "clusterIP or name"
netapp_username: "ansible"
netapp_password: "xxx"

**4   Test connectivity**
Inside the example playbooks  there is a playbook called ‘facts.yml’
run the following command to test your connectivity:
ansible-playbook facts.yml
This should result in a large amount of data being returned from the cluster, or
if anything is setup incorrect there will be clear errors to assist in
troubleshooting, if more detailed troubleshooting is required
run the playbook with debug enabled.
ansible-playbook facts.yml -vvv

**5   curl example**
curl -H "Content-Type: application/json" -X POST -s -u admin:netapp -d '{ "extra_vars": { "cluster": "cluster15", "svm234": "data_aggr", "state": "present"}}' -k https://172.30.3.51/api/v2/job_templates/7/launch/  







# Support
Please enter an issue https://github.com/infragilis/ansible-netapp-quickstartv2/issues if you would like to report a defect

