# Monitoring Setup

This directory contains monitoring and alerting configuration for the coffeeshop project.

## CloudWatch
- Enable Container Insights for EKS to collect node, pod, and service metrics
- Create CloudWatch Alarms for:
  - HPA max replicas
  - ELB/ALB anomalies
  - High CPU/memory usage
  - 5xx HTTP errors
- Example alarm setup in `cloudwatch-grafana.md`

## Grafana
- Deploy Grafana in EKS or use AWS Managed Grafana
- Add CloudWatch as a data source
- Example dashboards:
  - Node/Pod metrics
  - HTTP error rates
- Example queries and panel setup in `cloudwatch-grafana.md`

## Usage
1. Enable Container Insights in EKS via AWS Console or CLI.
2. Deploy Grafana and connect to CloudWatch.
3. Import example dashboards and set up alerts as needed.

## Exam Notes
- Monitoring and alerting are required for full marks.
- Dashboards must show node/pod metrics and HTTP errors.
- Alerts must cover HPA, ELB, CPU/memory, and 5xx errors.
