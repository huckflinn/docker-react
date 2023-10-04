# BUILD PHASE
FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


# RUN PHASE
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html