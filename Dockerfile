FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm config set proxy http://pjsevilla:Septiembre2019@proxy.indra.es:8080
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

