if [[ " src/mocks/login.json" =~ ^(" "*)([a-z_\-\s0-9/.]+)\.(txt|gif|pdf|doc|docx|xls|xlsx|js|json|csv)$ ]]; then
    echo "true"
else
    echo "false"
fi