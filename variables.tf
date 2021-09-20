variable "name" {
    type        = string
    description = "SQS identifier queue identifier"
}

variable "fifo" {
  type          = bool
  description   = "Boolean designating a FIFO queue."
  default       = false
}

variable "fifo_deduplication_scope" {
  type          = string
  description   = "Specifies whether message deduplication occurs at the message group or queue level."
  default       = "messageGroup"
}

variable "fifo_throughput_limit" {
  type          = string
  description   = "Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group."
  default       = "perMessageGroupId"
}
variable "max_retry" {
  type      = number
  default   = 3
}

variable "max_message_size" {
  type          = number
  default       = 262144
}

variable "visibility_timeout_seconds" {
  type          = number
  default       = 60 
}   

variable "visibility_timeout_seconds_dlq" {
  type          = number
  default       = 180 
}  

variable "expiration_time_seconds" {
  type          = number
  description   = "The number of seconds Amazon SQS retains a message. Integer representing seconds"
  default       = 86400 
} 

variable "expiration_time_seconds_dlq" {
  type          = number
  description   = "The number of seconds Amazon SQS retains a message. Integer representing seconds"
  default       = 1209600 
} 

variable "delay" {
  type          = number
  description   = "The time in seconds that the delivery of all messages in the queue will be delayed"
  default       = 0 
} 

variable "delay_dlq" {
  type          = number
  description   = "The time in seconds that the delivery of all messages in the queue will be delayed"
  default       = 900
} 

variable "receive_wait_time_seconds" {
  type          = number 
  description   = "The time for which a ReceiveMessage call will wait for a message to arrive; Optimized to long polling"
  default       = 20
}

variable "receive_wait_time_seconds_dlq" {
  type          = number 
  description   = "The time for which a ReceiveMessage call will wait for a message to arrive; Optimized to long polling"
  default       = 20
}

variable "kms_key" {
    description = "The ARN of the key that you wish to use if encrypting at rest"
    type        = string
    default     = ""
}

variable "kms_cache_time" {
    description = "The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again"
    type    = number
    default = 3600
}

variable "tags" {
    type    = map(any)
    default = {}
}