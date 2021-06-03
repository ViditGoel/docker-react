FROM node:alpine as builder

WORKDIR "/app"

COPY package.json .


RUN npm install

#RUN ["chmod", "+x", "/usr/local/bin/docker-entrypoint.sh"]
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

