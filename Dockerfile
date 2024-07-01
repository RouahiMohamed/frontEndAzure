# Étape 1 : Construire l'application Angular
FROM node:latest as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Étape 2 : Utiliser l'image nginx pour servir l'application Angular
FROM nginx:latest   
COPY --from=build /app/dist/azure-pfe-platform /usr/share/nginx/html
EXPOSE 80
