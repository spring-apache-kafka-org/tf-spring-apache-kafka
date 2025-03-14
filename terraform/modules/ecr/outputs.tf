output "spring_apache_kafka_producer_repository_url" {
  value = aws_ecr_repository.spring_apache_kafka_producer.repository_url
}

output "spring_apache_kafka_consumer_repository_url" {
  value = aws_ecr_repository.spring_apache_kafka_consumer.repository_url
}