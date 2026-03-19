# 1. Donde se guardan los datos cifrados
storage "file" {
  path = "/vault/file"
}

# 2. Configuración de red (Listener)
listener "tcp" {
  address     = "0.0.0.0:8200"

  # Para pruebas iniciales, desactivamos TLS (SSL)
  # IMPORTANTE: En producción esto DEBE ser "false" y usar certificados.
  tls_disable = "true"
}


# --- BLOQUE DE AUTO-UNSEAL ---
seal "awskms" {
  region     = "us-east-1"      # Cambia a tu región
  kms_key_id = "arn:aws:kms:us-east-1:137787521523:key/d041d453-fa86-44ee-b65e-abbcaf1b2a4a" # El ID o ARN que creaste
}


# 3. Configuración de la interfaz de usuario (Opcional pero recomendada)
ui = true

# 4. Dirección para redirecciones internas
api_addr = "http://0.0.0.0:8200"
cluster_addr = "https://0.0.0.0:8201"

