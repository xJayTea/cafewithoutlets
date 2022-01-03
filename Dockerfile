FROM node:16-alpine

WORKDIR /cwo
COPY . .

# install app dependencies
RUN npm install

# add app
COPY snowpack.config.mjs ./

CMD ["npm", "start"]