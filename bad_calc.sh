# Task A: Find the Culprit
ps aux | grep bad_calc.sh      # Locate runaway process and note PID

# Task B: Gentle Termination
kill [PID]                     # Send SIGTERM (15) for graceful shutdown

# Task C: Hard Termination
kill -9 [PID]                  # Send SIGKILL (9) for forced termination
