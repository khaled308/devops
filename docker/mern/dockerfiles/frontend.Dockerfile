FROM node

WORKDIR /app

COPY ./frontend/package.json /app

RUN npm install

COPY ./frontend /app

CMD ["npm", "run", "dev"]