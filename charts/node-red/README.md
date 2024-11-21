# node-red

[![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)](#)
[![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square)](#)
[![AppVersion: 4.0.3-debian](https://img.shields.io/badge/AppVersion-4.0.3--debian-informational?style=flat-square)](#)

Low-code programming for event-driven applications.

## Install

> [!WARNING]  
> You won't be able to authenticate without setting `nodeRed.settings.adminAuth.users` properly.

```shell
$ helm upgrade \
  --create-namespace \
  --install node-red node-red \
  --namespace node-red \
  --repo https://th0th.github.io/helm-charts \
  --values values.yaml \
  --version 0.2.0
```

## Uninstall

```shell
$ helm uninstall --namespace node-red node-red
```

## Values

| Key                              | Type   | Default                                           | Description                            |
|----------------------------------|--------|---------------------------------------------------|----------------------------------------|
| ingress.annotations              | object | `{}`                                              | annotations for the ingress            |
| ingress.enabled                  | bool   | `false`                                           | enable the ingress                     |
| ingress.host                     | string | `"node-red.local"`                                | host for the ingress                   |
| ingress.tls                      | list   | `[]`                                              | tls configuration for the ingress      |
| nodeRed.image.repository         | string | `"th0th/node-red"`                                | node-red image repository              |
| nodeRed.image.tag                | string | `"4.0.2-debian"`                                  | node-red image tag                     |
| nodeRed.persistence.enabled      | bool   | `true`                                            | enable persistence                     |
| nodeRed.resources                | object | `{}`                                              | resources for the node-red statefulset |
| nodeRed.settings                 | object | `{"adminAuth":{"type":"credentials","users":[]}}` | node-red settings                      |
| nodeRed.settings.adminAuth       | object | `{"type":"credentials","users":[]}`               | admin authentication config            |
| nodeRed.settings.adminAuth.users | list   | `[]`                                              | list of users                          |
| nodeRed.timeZone                 | string | `"America/New_York"`                              | time zone                              |                                                                                                                                            | time zone                              |

