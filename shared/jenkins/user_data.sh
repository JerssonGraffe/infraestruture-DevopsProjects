#!/bin/bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

# Atualiza a lista de pacotes
apt-get update -y

# Instala Docker
apt-get install -y docker.io

# Habilita e inicia o Docker
systemctl enable docker
systemctl start docker

# Espera o Docker ficar disponível
until docker info >/dev/null 2>&1; do
  sleep 2
done

# Adiciona o usuário ubuntu ao grupo docker
usermod -aG docker ubuntu

# Cria o volume persistente
docker volume create jenkins_home

# Baixa a imagem
docker pull jenkins/jenkins:lts

# Executa o Jenkins
docker run -d \
  --name jenkins \
  --restart unless-stopped \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts