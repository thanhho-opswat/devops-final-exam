# CloudWatch/Grafana Monitoring Setup

## CloudWatch
- Enable Container Insights for EKS cluster (node, pod, and service metrics)
- Set up CloudWatch Alarms for:
  - HPA max replicas
  - ELB anomalies
  - High CPU/memory
  - 5xx errors

## Grafana
- Deploy Grafana in EKS or use AWS Managed Grafana
- Add CloudWatch as a data source
- Example dashboards:
  - Node/Pod metrics
  - HTTP error rates

## Example CloudWatch Alarm (CPU)
```
aws cloudwatch put-metric-alarm \
  --alarm-name "HighCPUUtilization" \
  --metric-name CPUUtilization \
  --namespace AWS/EKS \
  --statistic Average \
  --period 300 \
  --threshold 80 \
  --comparison-operator GreaterThanThreshold \
  --dimensions Name=ClusterName,Value=<your-eks-cluster> \
  --evaluation-periods 2 \
  --alarm-actions <sns-topic-arn>
```

## Example Grafana Panel Query
- Namespace: `ContainerInsights`
- Metric: `pod_cpu_utilization`
- Filter by pod/service name
