python3 tests.py
result=$?
if [ $result == 0 ]; then
    exit 1;
else
    echo "done"
fi