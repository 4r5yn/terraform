  variable "event_rules" {
  type = list(object({
    name               = string
    description = string
    schedule_expression   = string
    lambda_function_arn = string
    event_data         = object({
      apiEndPointTobeCalled = string
      httpMethod             = string
      payload                  = object({
        modulename  = string
        arguments   = list(string)  # Make "arguments" a list with a default value of an empty list
        options     = list(string)  # Add more attributes if needed
        cronname    = string
        though      = string
      })
    })
  }))
}

