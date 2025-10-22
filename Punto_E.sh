mkdir -p Punto_E
( grep -m1 -E '^MemTotal' /proc/meminfo 2>/dev/null \
  || systeminfo | grep -i "memoria física total\|total physical memory" | head -1 \
  || powershell -NoProfile -Command "(Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory" | awk '{print "MemTotal: "$1" bytes"}' \
) > Punto_E/Filtro_basico.txt
( grep -m1 "model name" /proc/cpuinfo 2>/dev/null \
  || wmic cpu get Name 2>/dev/null | sed -n '2p' \
  || powershell -NoProfile -Command "(Get-CimInstance Win32_Processor).Name" \
) >> Punto_E/Filtro_basico.txt
( grep -m1 "MHz" /proc/cpuinfo 2>/dev/null \
  || wmic cpu get MaxClockSpeed 2>/dev/null | sed -n '2p' | awk '{print "cpu MHz: "$1}' \
  || powershell -NoProfile -Command "(Get-CimInstance Win32_Processor).MaxClockSpeed" | awk '{print "cpu MHz: "$1}' \
) >> Punto_E/Filtro_basico.txt
