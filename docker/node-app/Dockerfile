ARG NODE_VERSION=latest

FROM node:${NODE_VERSION}

RUN useradd -ms /bin/bash app

WORKDIR /app

RUN chown -R app:app /app

USER app

COPY . .

ENV PORT=8000

EXPOSE 8000

RUN npm install

CMD ["node", "server.js"]