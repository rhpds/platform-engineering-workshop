- hosts: localhost
  gather_facts: false
  collections:
    - rhdp.workshop
  roles:
    - role: ocp4_workload_platform_engineering_workshop
      vars:
        ACTION: provision
        common_password: REPLACE_ME
        ocp4_workload_platform_engineering_workshop_openshift_gitops_install: false
