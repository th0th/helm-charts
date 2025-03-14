{{- define "listmonk.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "listmonk.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "listmonk.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "listmonk.labels" -}}
helm.sh/chart: {{ include "listmonk.chart" . }}
{{ include "listmonk.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "listmonk.selectorLabels" -}}
app.kubernetes.io/name: {{ include "listmonk.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "listmonk.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "listmonk.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "listmonk.postgresHostname" -}}
{{- if .Values.postgres.enabled }}
{{- printf "%s-postgres" (include "listmonk.fullname" .) -}}
{{- else }}
{{- required ".Values.postgres.hostname is required when chart's postgres is disabled"  .Values.postgres.hostname }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "listmonk.postgresql.fullname" -}}
{{- if .Values.postgresql.fullnameOverride -}}
{{- .Values.postgresql.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{ printf "%s-%s" .Release.Name "postgresql"}}
{{- end -}}
{{- end -}}

{{/*
Set postgres host
*/}}
{{- define "listmonk.postgresql.host" -}}
{{- if .Values.postgresql.enabled -}}
{{- template "listmonk.postgresql.fullname" . -}}
{{- else -}}
{{- .Values.postgresql.host -}}
{{- end -}}
{{- end -}}

{{/*
Set postgres secret
*/}}
{{- define "listmonk.postgresql.secret" -}}
{{- if .Values.postgresql.enabled -}}
{{- template "listmonk.postgresql.fullname" . -}}
{{- else -}}
{{- template "listmonk.fullname" . -}}
{{- end -}}
{{- end -}}

{{/*
Set postgres secretKey
*/}}
{{- define "listmonk.postgresql.secretKey" -}}
{{- if .Values.postgresql.enabled -}}
"password"
{{- else -}}
{{- default "password" .Values.postgresql.auth.secretKeys.userPasswordKey | quote -}}
{{- end -}}
{{- end -}}