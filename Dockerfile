#production setup
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
FROM nginx
COPY --from=0 /app/dist /usr/share/nginx/html
#nginx default cmd starts server, so need to start it
