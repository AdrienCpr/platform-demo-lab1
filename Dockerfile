# Image légère officielle Node.js (version LTS)
FROM node:20-alpine

# Répertoire de travail dans le conteneur
WORKDIR /app

# Copie des fichiers de dépendances en premier (optimisation du cache Docker)
COPY package*.json ./

# Installation des dépendances de production uniquement
RUN npm ci --omit=dev

# Copie du reste des sources de l'application
COPY src/ ./src/

# Port d'écoute (ajuste si ton serveur écoute sur un autre port, ex: 8080 ou 3000)
EXPOSE 3000

# Exécution en tant qu'utilisateur non-root pour la sécurité
USER node

# Commande de démarrage (adapter selon le script défini dans package.json, ex: npm start ou node src/index.js)
CMD ["npm", "start"]