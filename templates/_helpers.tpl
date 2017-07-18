{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 24 -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 24 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 24 -}}
{{- end -}}

{{/*
Create a fully qualified Cog name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cog.fullname" -}}
{{- printf "%s-%s" .Release.Name "cog" | trunc 63 -}}
{{- end -}}

{{/*
Create a fully qualified Relay name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "relay.fullname" -}}
{{- printf "%s-%s" .Release.Name "relay" | trunc 63 -}}
{{- end -}}

{{/*
Create a full qualified Nginx name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "nginx.fullname" -}}
{{- printf "%s-%s" .Release.Name "nginx" | trunc 63 -}}
{{- end -}}

{{/*
Create a default fully qualified postgresql name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "postgresql.fullname" -}}
{{- printf "%s-%s" .Release.Name "postgresql" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the URL for connecting to postgresql
*/}}
{{- define "postgresql.url" -}}
{{ $releasename := include "postgresql.fullname" . }}
{{- printf "ecto://%s:%s@%s:5432/%s" .Values.postgresql.postgresUser .Values.postgresql.postgresPassword (include "postgresql.fullname" .) .Values.databaseName | b64enc | quote -}}
{{- end -}}
