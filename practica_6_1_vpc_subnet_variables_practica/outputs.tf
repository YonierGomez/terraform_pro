output "ip_public_op" {
  value       = aws_instance.instancia_rn.public_ip
  description = "IP PUBLICA DE INSTANCIA"
}
