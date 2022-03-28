data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

provider "aws" {
  region = "us-west-2"
}

terraform {
  required_version = ">= 1.0.1"
  required_providers {
    aws = {
      version = "~> 3.74"
    }
  }
}

data "aws_iam_policy_document" "queue_policy" {
  statement {
    sid    = "queue"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "SQS:SendMessage",
    ]

    resources = [
      "arn:aws:sqs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.teamid}-${var.prjid}",
    ]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"

      values = [
        "arn:aws:sns:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.teamid}-${var.prjid}-notify",
      ]
    }
  }
}

module "sqs" {
  source = "../../"

  deploy_sqs        = true
  dead_letter_queue = true
  encrypted_sqs     = false
  policy            = data.aws_iam_policy_document.queue_policy.json
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
