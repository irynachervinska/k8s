{{/*
Define common labels for app-config.yaml
*/}}
{{- define "ms-app.labels" -}}
app.kubernetes.io/managed-by: {{ .Values.labels.managedBy | default "Helm" }}
{{- end }}

{{/*
Define annotation for app-config.yaml
*/}}
{{- define "ms-app.releaseNameAnnotation" -}}
meta.helm.sh/release-name: {{ .Release.Name | quote }}
{{- end }}

{{/*
Define annotation for app-config.yaml
*/}}
{{- define "ms-app.releaseNamespaceAnnotation" -}}
meta.helm.sh/release-namespace: {{ .Release.Namespace | quote }}
{{- end }}