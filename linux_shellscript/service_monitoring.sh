services=$1
max_retries=2
log_file="/var/log/service_monitor.log"

log(){
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$log_file"
}
monitor_service(){
    local service=$1
    local retries=0
    while [ $retries -lt $max_retries ]; do
        if systemctl is-active --quiet "$services"; then
          log "Ok: $service is running"
        else
          ((retries++))
          log "WARNING: $service is down (Attempt $retries/$max_retries)"
          systemctl restart "$service" && sleep 5
          fi 
      done
}

log "=== Starting service monitoring ==="

for service in "${services[@]}"; do
    monitor_service "$service"
done


log "=== Starting service monitoring ==="
