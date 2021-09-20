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