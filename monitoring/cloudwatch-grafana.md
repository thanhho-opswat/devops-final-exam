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
  --dimensions Name=ClusterName,Value=thanhho-eks-cluster \
  --evaluation-periods 2 \
  --alarm-actions arn:aws:sns:ap-southeast-2:123456789012:thanhho-alerts
```

## Example CloudWatch Alarm (5xx ELB Errors)
```
aws cloudwatch put-metric-alarm \
  --alarm-name "HighELB5xxErrors" \
  --metric-name HTTPCode_ELB_5XX_Count \
  --namespace AWS/ApplicationELB \
  --statistic Sum \
  --period 300 \
  --threshold 5 \
  --comparison-operator GreaterThanThreshold \
  --dimensions Name=LoadBalancer,Value=app/thanhho-alb/1234567890abcdef \
  --evaluation-periods 1 \
  --alarm-actions arn:aws:sns:ap-southeast-2:123456789012:thanhho-alerts
```

## Example Grafana Panel Query
- Namespace: `ContainerInsights`
- Metric: `pod_cpu_utilization`
- Filter by pod/service name

## IAM Permissions Note
- Ensure your EKS nodes and Grafana have permissions to read CloudWatch metrics and alarms.
