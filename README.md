# Platform Engineering Workshop Collection

Ansible collection for deploying a comprehensive Platform Engineering workshop environment on OpenShift.

## Installation

```bash
ansible-galaxy collection install rhdp.workshop
```

## Roles

### ocp4_workload_platform_engineering_workshop

Deploys a complete platform engineering stack on OpenShift, including developer portals, CI/CD pipelines, GitOps, security tools, and more. This role provides a comprehensive workshop environment for learning and demonstrating platform engineering best practices.

#### Components Deployed

The role deploys and configures the following components:

- **OpenShift GitOps** - ArgoCD-based GitOps solution for continuous deployment
- **OpenShift Pipelines** - Tekton-based CI/CD pipelines
- **Red Hat Developer Hub (RHDH)** - Internal developer portal based on Backstage
- **GitLab** - Source code management and CI/CD platform
- **Red Hat Build of Keycloak (RHBK)** - Identity and access management with OAuth integration
- **Quay** - Container image registry
- **HashiCorp Vault** - Secrets management
- **External Secrets Operator** - Integrates external secret management systems with Kubernetes
- **Red Hat Trusted Artifact Signer (RHTAS)** - Software supply chain security with Sigstore
- **NooBaa** - S3-compatible object storage (optional, configurable)
- **Parasol** - Demo application for workshop scenarios
- **Orchestrator** - Workflow orchestration for RHDH
- **Showroom** - Workshop content delivery platform
- **Web Terminal** - Browser-based terminal access (optional)

## Quick Start

```yaml
- name: Deploy Platform Engineering Workshop
  hosts: localhost
  tasks:
    - name: Install platform engineering workload
      ansible.builtin.include_role:
        name: rhdp.workshop.ocp4_workload_platform_engineering_workshop
      vars:
        ACTION: provision
        common_password: changeme
```

## Requirements

- OpenShift 4.x cluster
- cluster-admin access
- `kubernetes.core` collection
- Sufficient cluster resources for all components

## Configuration

The role provides extensive configuration options through variables. Key variables include:

- `ACTION` - Set to `provision` or `destroy`
- `common_password` - Default password for workshop users
- `ocp4_workload_platform_engineering_workshop_noobaa_install` - Enable/disable NooBaa installation (default: true)
- `ocp4_workload_platform_engineering_workshop_terminal_install` - Enable/disable Web Terminal (default: true)

See [defaults/main.yml](roles/ocp4_workload_platform_engineering_workshop/defaults/main.yml) for all available configuration options.

## License

GPL-2.0-or-later
