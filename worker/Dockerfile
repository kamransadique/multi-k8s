FROM node:alpine
WORKDIR "/app"
COPY ./package.json ./
RUN npm install --no-bin-links
COPY . .
CMD ["npm", "run", "start"]