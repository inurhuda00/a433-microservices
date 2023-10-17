#!/bin/bash

# Nama image yang akan dibuat
IMAGE_NAME="karsajob-ui"
# Versi image (tag)
IMAGE_TAG="latest"
# Nama akun GitHub 
GITHUB_USERNAME="inurhuda00"

CR_PAT=$GITHUB_TOKEN
# export CR_PAT=YOUR_TOKEN; 
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin

# Perintah untuk membuat Docker image dari Dockerfile
docker build -t $IMAGE_NAME:$IMAGE_TAG -f Dockerfile .

# Melihat daftar image di lokal
docker images

# Mengubah nama image agar sesuai dengan format GitHub Packages
docker tag $IMAGE_NAME:$IMAGE_TAG  ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG

# Mengunggah image ke GitHub Packages
docker push  ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG
