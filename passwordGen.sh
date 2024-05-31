read -p "Enter the input: " input
length=32

password=$(openssl rand -base64 $length | tr -d '[:space:]' | tr -d '/')
generated_password="${input}_${password}"

echo "Generated Password: $generated_password"
