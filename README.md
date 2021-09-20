# Simple Queue Service (SQS) Module for SRE's 

# Features by Default

* Encryption at rest
* Dead-Letter Queue 
* Optimization for Long Polling
* Content-based Deduplication for FIFO Mode
* High throughput optimization for FIFO queues


# Variables 

| Variable                          | Default               | Required  | Type      |  Additional Info  |
|-----------------------------------|-----------------------|-----------|-----------|-------------------|
| `name`                            | NA                    | yes       | `string`  |                   |
| `fifo`                            | false                 | no        | `bool`    |                   |
| `max_retry`                       | `3`                   | no        | `number`  |                   |  
| `delay`                           | `0`                   | no        | `number`  |                   |  
| `expiration_time_seconds`         | `86400`               | no        | `number`  |                   |    
| `receive_wait_time_seconds`       | `20`                  | no        | `number`  |                   |   
| `max_message_size`                | `262144`              | no        | `number`  |                   |   
| `visibility_timeout`              | `60`                  | no        | `number`  |                   |   
| `kms_key`                         | `""`                  | no        | `string`  |                   |     
| `kms_cache_time`                  | `3600`                | no        | `number`  |                   |  
| `fifo_deduplication_scope`        | `messageGroup`        | no        | `string`  |                   |
| `fifo_throughput_limit`           | `perMessageGroupId`   | no        | `string`  |                   |
| `tags`                            | `{}`                  | no        | `map(any)`| Tags to resources |
|---                                |---                    |---        |---        |---                |
| `delay_dlq`                       | `900`                 | no        | `number`  |                   |  
| `expiration_time_seconds_dlq`     | `1209600`             | no        | `number`  |                   |  
| `receive_wait_time_seconds_dlq`   | `20`                  | no        | `number`  |                   |  
| `visibility_timeout_dlq`          | `180`                 | no        | `number`  |                   |

# Outputs 

| Variable  | Value                 |
|-----------|-----------------------|
| `queue`   | `aws_sqs_queue.main`  | 
| `dlq`     | `aws_sqs_queue.dlq`   | 
| `kms`     | `aws_kms_key.main`    | 

# Basic Usage 

```hcl
module "dummy" {
    source      = "github.com/production-ready-toolkit/aws-sre-sqs"

    name                = "dummy"
    max_retry           = 3
    visibility_timeout  = 30
    tags        = {
        "environment" = "production"
    }
}
```

## Basic usage for FIFO Queues Support

```hcl
module "dummy_fifo" {
    source      = "github.com/production-ready-toolkit/aws-sre-sqs"

    name                = "example"

    fifo                = true
    visibility_timeout  = 30
    max_retry           = 3
    
    tags        = {
        "environment" = "production"
    }
}
```

# Examples

# Todo 

* ...