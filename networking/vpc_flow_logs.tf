# VPC Flow Logs for network monitoring and troubleshooting
# Captures information about IP traffic going to and from network interfaces in the VPC

# CloudWatch Log Group for VPC Flow Logs
resource "aws_cloudwatch_log_group" "vpc_flow_log" {
  name              = "/aws/vpc/flowlogs/project-production-vpc"
  retention_in_days = 14  # Adjust based on your needs (1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653)
  
  tags = {
    Name        = "project-vpc-flow-logs"
    Environment = "production"
  }
}

# IAM Role for VPC Flow Logs
resource "aws_iam_role" "flow_log" {
  name = "project-vpc-flow-logs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name        = "project-vpc-flow-logs-role"
    Environment = "production"
  }
}

# IAM Policy for VPC Flow Logs to write to CloudWatch
resource "aws_iam_role_policy" "flow_log" {
  name = "project-vpc-flow-logs-policy"
  role = aws_iam_role.flow_log.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]
        Effect = "Allow"
        Resource = "${aws_cloudwatch_log_group.vpc_flow_log.arn}:*"
      }
    ]
  })
}

# VPC Flow Log
resource "aws_flow_log" "vpc_flow_log" {
  iam_role_arn    = aws_iam_role.flow_log.arn
  log_destination = aws_cloudwatch_log_group.vpc_flow_log.arn
  traffic_type    = "ALL"  # Options: ACCEPT, REJECT, ALL
  vpc_id          = aws_vpc.production_vpc.id
  
  tags = {
    Name        = "project-vpc-flow-log"
    Environment = "production"
  }
}   
