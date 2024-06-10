read -p "Ingresa el intervalo de tiempo (en segundos): " N
archivo="recursos.csv"

echo "Fecha,Hora,Memoria (MB),CPU (%)" > "$archivo"

while true; do
	FECHA_HORA=$(date +"%Y-%m-%d,%H:%M:%S")
	MEMORIA=$(free -m | awk '/Mem:/ {print $3}')
	CPU=$(top -bn1 | awk '/%Cpu/ {print $2}')

	echo "$FECHA_HORA,$MEMORIA,$CPU" >> "$archivo"
	sleep "$N"
done &
