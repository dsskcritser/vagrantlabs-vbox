# Environmental preconfig

# Change root passwo
sudo usermod --password $(echo Dellsvcs1 | openssl passwd -1 -stdin) root

# Allow Root SSH Logins
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd