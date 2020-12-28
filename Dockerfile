FROM node:12.9.1-buster-slim

WORKDIR /code

COPY app/package.json .
RUN npm install --no-optional
COPY app .
EXPOSE 3000
CMD exec npm run start