# n8n

![Version: 0.1.4](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.68.0](https://img.shields.io/badge/AppVersion-1.68.0-informational?style=flat-square)

An extendable workflow automation tool.

## Install

```shell
$ helm upgrade n8n n8n \
  --create-namespace \
  --install \
  --namespace n8n \
  --repo https://th0th.github.io/helm-charts \
  --values values.yaml \
  --version 0.1.4
```

## Uninstall

```shell
$ helm uninstall --namespace n8n n8n
```

## Values

| Key                       | Type   | Default                     | Description                                                                                                              |
|---------------------------|--------|-----------------------------|--------------------------------------------------------------------------------------------------------------------------|
| encryptionKey             | string | `""`                        | n8n encryption key (see [docs](https://docs.n8n.io/hosting/configuration/environment-variables/deployment/))             |
| env                       | object | `{}`                        | environment variables to be passed to n8n (see [docs](https://docs.n8n.io/hosting/configuration/environment-variables/)) |
| image.pullPolicy          | string | `"IfNotPresent"`            | n8n image pull policy                                                                                                    |
| image.repository          | string | `"docker.n8n.io/n8nio/n8n"` | n8n image repository                                                                                                     |
| image.tag                 | string | `"1.68.0"`                  | n8n image tag                                                                                                            |
| ingress.annotations       | object | `{}`                        | the ingress annotations                                                                                                  |
| ingress.enabled           | bool   | `false`                     | enable the ingress                                                                                                       |
| ingress.hosts             | list   | `[]`                        | the ingress host                                                                                                         |
| postgres.database         | string | `"n8n"`                     | the postgres database name                                                                                               |
| postgres.enabled          | bool   | `true`                      | enable the postgres statefulset                                                                                          |
| postgres.image.repository | string | `"postgres"`                | the postgres image repository                                                                                            |
| postgres.image.tag        | string | `"17-alpine"`               | the postgres image tag                                                                                                   |
| postgres.password         | string | `"n8n"`                     | the postgres password                                                                                                    |
| postgres.resources        | object | `{}`                        | resources configuration for the postgres statefulset                                                                     |
| postgres.user             | string | `"n8n"`                     | the postgres user                                                                                                        |
| replicas                  | int    | `1`                         | number of n8n deployment replicas                                                                                        |                                                                                                         |
