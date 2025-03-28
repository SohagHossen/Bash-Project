#!/bin/bash

echo "🔥 High CPU & RAM load starting... Press CTRL+C to stop!"

# High CPU load (infinite loop)
for i in {1..10}; do
  while :; do :; done &
done

# High RAM load (allocating memory)
for i in {1..5}; do
  dd if=/dev/zero of=/dev/null bs=1M count=500000 &
done

wait
