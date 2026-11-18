# image de départ
FROM alpine:3.20
# chemin de travail
WORKDIR /app
# installation des paquets système
RUN apk add --no-cache nodejs npm
# ajout utilisateur node et groupe node
RUN addgroup -S node && adduser -S node -G node && chown node:node /app
# downgrade des privilèges
USER node
# copie des fichiers du dépôt
COPY ./ ./
# installation des dépendances avec npm
RUN npm ci
# build avec npm
RUN npm run build
# exécution
CMD [ "node", "dist/index.js" ]