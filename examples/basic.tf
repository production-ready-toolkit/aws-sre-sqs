module "dummy" {
    source      = "github.com/production-ready-toolkit/aws-sre-sqs"

    name                = "dummy"
    max_retry           = 3
    visibility_timeout  = 30
    tags        = {
        "environment" = "production"
    }
}