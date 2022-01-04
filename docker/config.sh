#/bin/sh

# Add user to docker group
sudo usermod -a -G docker $USER

# Enable + start docker service
sudo systemctl enable docker.service
sudo systemctl start docker.service
