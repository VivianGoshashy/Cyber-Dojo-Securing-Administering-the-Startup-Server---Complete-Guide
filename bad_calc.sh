cat > bad_calc.sh << 'EOF'
#!/bin/bash
# ==========================================
# RUNAWAY PROCESS FOR MILESTONE 3
# ==========================================

echo "Starting bad_calc.sh (PID: $$)"
echo "This is a simulated runaway process."
echo "Use 'ps aux | grep bad_calc.sh' to find me."
echo "Use 'kill [PID]' to terminate me gracefully."
echo "Use 'kill -9 [PID]' to force terminate."

COUNT=0
while true; do
    COUNT=$((COUNT + 1))
    if [ $((COUNT % 10)) -eq 0 ]; then
        echo "[$(date)] bad_calc.sh still running... (iteration $COUNT)"
    fi
    sleep 1
done
EOF

chmod +x bad_calc.sh
