FROM node:17.1.0-alpine3.13
COPY ./ ./
RUN npm install
EXPOSE 3000
CMD ["npm", "start"]
