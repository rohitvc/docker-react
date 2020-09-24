FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build will have the production build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html