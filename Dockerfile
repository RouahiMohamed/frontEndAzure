FROM node:latest as build
WORKDIR /app
COPY . .
RUN npm install --legacy-peer-deps
RUN npm run build

FROM nginx:latest
COPY --from=build /app/dist/azure-pfe-platform /usr/share/nginx/html
EXPOSE 80
