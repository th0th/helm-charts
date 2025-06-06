# listmonk

[![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)](#)
[![Version: 5.0.0](https://img.shields.io/badge/Version-5.0.0-informational?style=flat-square)](#)
[![AppVersion: 5.0.0](https://img.shields.io/badge/AppVersion-5.0.0-informational?style=flat-square)](#)

High performance, self-hosted, newsletter and mailing list manager with a modern dashboard.

## Install

```shell
$ helm upgrade listmonk listmonk \
  --create-namespace \
  --install \
  --namespace listmonk \
  --repo https://th0th.github.io/helm-charts \
  --values values.yaml \
  --version 5.0.0
```

## Uninstall

```shell
$ helm uninstall --namespace listmonk listmonk
```

## Values

| Key                       | Type   | Default               | Description                                          |
|---------------------------|--------|-----------------------|------------------------------------------------------|
| ingress.annotations       | object | `{}`                  | annotations for the ingress                          |
| ingress.enabled           | bool   | `false`               | enable the ingress                                   |
| ingress.className         | string | `""`                  | ingress class name                                   |
| ingress.host              | string | `"listmonk.local"`    | host for the ingress                                 |
| ingress.tls               | list   | `[]`                  | tls configuration for the ingress                    |
| listmonk.admin.password   | string | `""`                  | the admin password                                   |
| listmonk.admin.username   | string | `""`                  | the admin username                                   |
| listmonk.image.repository | string | `"listmonk/listmonk"` | the listmonk image repository                        |
| listmonk.image.tag        | string | `"v5.0.0"`            | the listmonk image tag                               |
| listmonk.replicas         | int    | `1`                   | the number of listmonk deployment replicas           |
| postgres.enabled          | bool   | `true`                | enable internal postgres                             |
| postgres.hostname         | string | `""`                  | external postgres hostname                           |
| postgres.database         | string | `"listmonk"`          | the postgres database name                           |
| postgres.image.repository | string | `"postgres"`          | the postgres image repository                        |
| postgres.image.tag        | string | `"16-alpine"`         | the postgres image tag                               |
| postgres.password         | string | `""`                  | the postgres password                                |
| postgres.resources        | object | `{}`                  | resources configuration for the postgres statefulset |
| postgres.user             | string | `""`                  | the postgres username                                |
