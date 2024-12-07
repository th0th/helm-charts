# listmonk

[![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)](#)
[![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square)](#)
[![AppVersion: 5.103.0](https://img.shields.io/badge/AppVersion-5.103.0-informational?style=flat-square)](#)

Independent technology for modern publishing, memberships, subscriptions and newsletters.

## Install

```shell
$ helm upgrade ghost ghost \
  --create-namespace \
  --install \
  --namespace ghost \
  --repo https://th0th.github.io/helm-charts \
  --values values.yaml \
  --version 0.0.2
```

## Uninstall

```shell
$ helm uninstall --namespace ghost ghost
```

## Values

| Key                    | Type   | Default          | Description                                                       |
|------------------------|--------|------------------|-------------------------------------------------------------------|
| extraEnvVars           | object | `{}`             | extra env variables for ghost (see https://ghost.org/docs/config) |
| image.pullPolicy       | string | `"IfNotPresent"` | ghost image pull policy                                           |
| image.repository       | string | `"ghost"`        | ghost image repository                                            |
| image.tag              | string | `""`             | ghost image tag                                                   |
| ingress.annotations    | object | `{}`             | ingress annotations                                               |
| ingress.enabled        | bool   | `false`          | enable ingress                                                    |
| ingress.hosts          | list   | `[]`             | ingress hosts                                                     |
| mail.from              | string | `""`             | default from e-mail address                                       |
| mail.host              | string | `""`             | SMTP host                                                         |
| mail.password          | string | `""`             | SMTP password                                                     |
| mail.port              | string | `""`             | SMTP port                                                         |
| mail.secure            | bool   | `true`           | SMTP protocol (true means SSL is enabled)                         |
| mail.user              | string | `""`             | SMTP user                                                         |
| mysql.database         | string | `"ghost"`        | mysql database name                                               |
| mysql.image.pullPolicy | string | `"IfNotPresent"` | mysql image pull policy                                           |
| mysql.image.repository | string | `"mysql"`        | mysql image repository                                            |
| mysql.image.tag        | int    | `8`              | mysql image tag                                                   |
| mysql.password         | string | `""`             | mysql password                                                    |
| mysql.persistence.size | string | `"10Gi"`         | mysql pvc size                                                    |
| mysql.resources        | object | `{}`             | resources for mysql                                               |
| mysql.rootPassword     | string | `""`             | mysql root password                                               |
| mysql.user             | string | `"ghost"`        | mysql user                                                        |
| persistence.size       | string | `"10Gi"`         | ghost pvc size                                                    |
| resources              | object | `{}`             | resources for ghost                                               |
| url                    | string | `""`             | url for ghost                                                     |
