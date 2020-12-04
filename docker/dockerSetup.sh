# Start and enable docker
sudo systemctl enable docker
# perform while loop until docker is enabled
sudo systemctl is-enabled docker
sudo systemctl start docker
# add user to docker group to run docker without sudo
sudo usermod -a -G docker mig