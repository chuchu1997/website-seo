# Sử dụng Node.js LTS làm base image
FROM node:18-alpine AS base

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy package.json và package-lock.json vào container
COPY package*.json ./

# Cài đặt phụ thuộc
RUN npm install

# Copy toàn bộ mã nguồn vào container
COPY . .

# Build ứng dụng
RUN npm run build

# Expose cổng 3000
EXPOSE 3000

# Lệnh chạy ứng dụng
CMD ["npm", "start"]