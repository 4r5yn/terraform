locals {
  event_rule_map = { for rule in var.event_rules : rule.name => rule }
}

# Create CloudWatch Event Rules and Targets using the provided variables
resource "aws_cloudwatch_event_rule" "event_rules" {
  for_each = local.event_rule_map
  name                = each.value.name
  description         = each.value.description
  schedule_expression = "cron(${each.value.schedule_expression})"
}

resource "aws_cloudwatch_event_target" "event_targets" {
  for_each = local.event_rule_map
  rule      = each.key
  target_id = "lambda"
  arn       = each.value.lambda_function_arn
  depends_on = [
    aws_cloudwatch_event_rule.event_rules,
  ]
  input     = jsonencode(each.value.event_data)
}



resource "null_resource" "lambda_permission" {
  triggers = {
    function_arn = "arn:aws:lambda:us-east-1:076755271724:function:idfc-dec25"
  }

  provisioner "local-exec" {
    command = <<EOT
aws lambda add-permission \
  --function-name arn:aws:lambda:regionname:awsaccountno:function:function_name \
  --statement-id 'statement_name' \
  --action 'lambda:InvokeFunction' \
  --principal 'events.amazonaws.com' \
  --source-arn 'arn:aws:events:us-east-1:awsaccountno:rule/event_name*'
EOT
  }
}


