FROM node:latest

# Install git, ffmpeg, dan unzip
RUN apt-get update && \
    apt-get install -y git ffmpeg unzip curl && \
    apt-get clean

# Install yarn secara resmi dari sumber Yarn
RUN corepack enable && \
    corepack prepare yarn@stable --activate

# Direktori kerja
WORKDIR /app

# Salin file ZIP ke dalam container
COPY pl.zip .

# Ekstrak pl.zip dan install dependensi
RUN unzip pl.zip && \
    cd pl && \
    yarn install

# Set direktori kerja ke folder hasil ekstrak
WORKDIR /app/pl

# Jalankan aplikasi
CMD ["yarn", "start"]
