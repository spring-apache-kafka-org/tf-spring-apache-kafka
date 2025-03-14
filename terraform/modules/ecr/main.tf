resource "aws_ecr_repository" "spring_apache_kafka_producer" {
  name                 = var.ecr_repositories[0]
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name       = "${var.env}-${var.ecr_repositories[0]}"
    Owner      = var.owner
    Discipline = var.discipline
    Purpose    = var.purpose
  }
}

resource "aws_ecr_repository" "spring_apache_kafka_consumer" {
  name                 = var.ecr_repositories[1]
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name       = "${var.env}-${var.ecr_repositories[1]}"
    Owner      = var.owner
    Discipline = var.discipline
    Purpose    = var.purpose
  }
}