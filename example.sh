#!/usr/bin/env bash
# pipecheck demo script

# Create test CSV file
cat > sample.csv << 'EOF'
id,name,age,status
1,John,32,active
2,Alice,29,inactive
3,Bob,45,active
4,Carol,,pending
5,Dave,38,active
EOF

# Display title
echo "===== pipecheck Demo ====="
echo "Check the status of each step in a pipeline processing a CSV file"
echo

# Demo of a successful pipeline
echo "Successful pipeline:"
echo "cat sample.csv | grep 'active' | sort | wc -l"
./pipecheck "cat sample.csv | grep 'active' | sort | wc -l"

echo
echo "============================"
echo

# Demo of a failing pipeline
echo "Pipeline with partial failure:"
echo "cat sample.csv | grep 'INVALID_STATUS' | sort | wc -l"
./pipecheck "cat sample.csv | grep 'INVALID_STATUS' | sort | wc -l"

echo
echo "============================"
echo

# Demo of running pipecheck with a command that filters records with non-empty age
echo "Running pipecheck with command that filters records with non-empty age:"
./pipecheck "cat sample.csv | grep -v '^id' | awk -F, '\$3 != \"\" {print}' | wc -l"

# Cleanup
rm sample.csv

echo
echo "Demo completed"
