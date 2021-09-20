module "dummy_fifo" {
    source      = "github.com/production-ready-toolkit/aws-sre-sqs"

    name        = "champs"
    fifo        = true

    max_retry   = 3
    
    tags        = {
        "environment" = "production"
    }
}