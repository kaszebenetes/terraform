#!/bin/bash

# USER_NAME=test_user
# PASSWORD=test_pass

# useradd $USER_NAME

# echo "$USER_NAME:$PASSWORD" | chpasswd

# usermod -aG sudo $USER_NAME

# sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config+
# sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config.d/*
# systemctl restart sshd

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyhs5yBPfGxW6riERmxx9SU5nZl2NOFuyxcQxQnbPMVUPf1FO5GghUrDG3MX4R1Aiy5hET1FfOHgqer0GTS9+XAAPFOMBOzVyqABinA8QW32fDmN6TIS0rF+vCS1a7DnNVU8sUjlWK6/b5K5ERnweFVzHf7zDHCQDQQo75iTq0hQKeVP5ksj6mccKtM4lBsecoZVek3p7V1UflWkgcT8MSzyAICR3flsOOewijnQi36Lblvyzi/lLZ4HgV/4zENbvCnQDz0kyqC3j8LMVjYwoQg67N8SSIV1bekR9LBqQWS8/E60ffcjR+WOiB6THSFC5jf9vx1+YvlRp9x6Plw8ybX+TcRujG4EOjxvO+P8cB50gr6ByXNT63KfO2b8hhogj6AGN2AzAqBQxsvz9zSP3leqCiRXRoSUzjz9lP8d6NbZ32b3mBCONQipohRT9DxpI61Y4P3R7BXrfuiJNjRfPrfYcgJHAjs0hwSXvWNxB+CYDfz1+mjOYi9t4XzYe7CUE= miotk.mikolaj@gmail.com" > ~adminuser/.ssh/authorized_keys
