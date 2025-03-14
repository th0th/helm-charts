# listmonk

[![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)](#)
[![Version: 0.3.3](https://img.shields.io/badge/Version-0.3.3-informational?style=flat-square)](#)
[![AppVersion: 4.1.0](https://img.shields.io/badge/AppVersion-4.1.0-informational?style=flat-square)](#)

High performance, self-hosted, newsletter and mailing list manager with a modern dashboard.

## Install

```shell
$ helm upgrade listmonk listmonk \
  --create-namespace \
  --install \
  --namespace listmonk \
  --repo https://th0th.github.io/helm-charts \
  --values values.yaml \
  --version 0.3.3
```

## Uninstall

```shell
$ helm uninstall --namespace listmonk listmonk
```

## Values

| Key                                   | Type   | Default                 | Description                                            |
|---------------------------------------|--------|-------------------------|--------------------------------------------------------|
| ingress.annotations                   | object | `{}`                    | annotations for the ingress                            |
| ingress.enable                        | bool   | `false`                 | enable the ingress                                     |
| ingress.className                     | string | `""`                    | ingress class name                                     |
| ingress.host                          | string | `"listmonk.local"`      | host for the ingress                                   |
| ingress.tls                           | list   | `[]`                    | tls configuration for the ingress                      |
| listmonk.admin.password               | string | `""`                    | the admin password                                     |
| listmonk.admin.username               | string | `""`                    | the admin username                                     |
| listmonk.image.repository             | string | `"listmonk/listmonk"`   | the listmonk image repository                          |
| listmonk.image.tag                    | string | `"v4.1.0"`              | the listmonk image tag                                 |
| listmonk.replicas                     | int    | `1`                     | the number of listmonk deployment replicas             |
| postgresql.enabled                    | bool   | `true`                  | Deploy postgres server (see below)                     |
| postgresql.postgresqlDatabase         | string | `"listmonk"`            | Postgres database name                                 |
| postgresql.postgresqlUser             | string | `"postgres"`            | Postgres username                                      |
| postgresql.postgresqlHost             | string | `""`                    | External postgres host                                 |
| postgresql.postgresqlPassword         | string | `""`                    | External postgres password                             |
| postgresql.existingSecret             | string | `""`                    | Provide an existing Secret for postgres                |
| postgresql.existingSecretKey          | string | `"postgresql-password"` | The postgres password key in the existing Secret       |
| postgresql.postgresqlPort             | int    | `5432`                  | External postgres port                                 |
| postgresql.ssl                        | bool   | `false`                 | Enable external postgres SSL connection                |
| postgresql.ca                         | string | `""`                    | Certificate of Authority content for postgres          |
| postgresql.persistence.enabled        | bool   | `true`                  | Enable postgres persistence using PVC                  |
| postgresql.persistence.existingClaim  | string | `""`                    | Provide an existing PersistentVolumeClaim for postgres | 
| postgresql.persistence.storageClass   | string | `""`                    | Postgres PVC Storage Class (example: nfs)              |
| postgresql.persistence.size           | string | `"8Gi"`                 | Postgers PVC Storage Request                           |


## PostgresSQL

By default, PostgreSQL is installed as part of the chart.

### Using an external PostgreSQL server

To use an external PostgreSQL server, set `postgresql.enabled` to `false` and then set `postgresql.postgresqlHost` and `postgresql.postgresqlPassword`. To use an existing `Secret`, set `postgresql.existingSecret`. The other options (`postgresql.postgresqlDatabase`, `postgresql.postgresqlUser`, `postgresql.postgresqlPort` and `postgresql.existingSecretKey`) may also want changing from their default values.

To use an SSL connection you can set `postgresql.ssl` to `true` and if needed the path to a Certificate of Authority can be set using `postgresql.ca` to `/path/to/ca`. Default `postgresql.ssl` value is `false`.

If `postgresql.existingSecret` is not specified, you also need to add the following Helm template to your deployment in order to create the postgresql `Secret`:

```yaml
kind: Secret
apiVersion: v1
metadata:
  name: {{ template "listmonk.postgresql.secret" . }}
data:
  {{ template "listmonk.postgresql.secretKey" . }}: "{{ .Values.postgresql.postgresqlPassword | b64enc }}"
```