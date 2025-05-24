# Gunakan Node.js versi 20
FROM node:20

# Install git, ffmpeg, unzip, dan yarn
RUN apt-get update && \
    apt-get install -y git ffmpeg unzip && \
    npm install -g yarn && \
    apt-get clean

# Direktori kerja
WORKDIR /app

# Salin file ZIP ke dalam container
COPY pl.zip .

# Ekstrak ZIP dan install dependensi menggunakan yarn
RUN unzip pl.zip && \
    cd pl && \
    yarn install

# Ganti direktori kerja ke folder hasil ekstrak
WORKDIR /app/pl

# Jalankan aplikasi
CMD ["yarn", "start"]
