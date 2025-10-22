mkdir -p Punto_F
{
  echo "Fecha: $(date)"
  echo "Usuario: ${USERNAME:-$USER}"
  echo "Hostname: $(hostname)"
  echo "IP pública: $(curl -s ifconfig.me)"
} > Punto_F/Filtro_Avanzado.txt
