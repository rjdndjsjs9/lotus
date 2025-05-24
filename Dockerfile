FROM node:19

# Install git dan ffmpeg
RUN apt-get update && \
    apt-get install -y git ffmpeg unzip && \
    apt-get clean

# Buat direktori kerja
WORKDIR /app

# Salin file ZIP ke container
COPY pl.zip .

# Ekstrak pl.zip
RUN unzip pl.zip && \
    cd pl && \
    npm install

# Set direktori kerja ke folder hasil ekstrak
WORKDIR /app/pl

# Jalankan aplikasi
CMD ["npm", "start"]
