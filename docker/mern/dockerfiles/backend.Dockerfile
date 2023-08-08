FROM node

WORKDIR /app

COPY ./backend/package.json /app

RUN npm install

COPY ./backend /app

EXPOSE 8000

CMD ["npm", "start"]