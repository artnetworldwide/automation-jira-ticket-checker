{{/*
The resource base name, usually the chart name but can be overridden
*/}}
{{- define "name" -}}
{{-  .Values.name | default .Chart.Name -}}
{{- end -}}

{{/*
Image tag override, usually this is the version of the chart but it can be overridden
*/}}
{{- define "imageTag" -}}
{{-  .Values.imageTag | default .Chart.Version -}}
{{- end -}}