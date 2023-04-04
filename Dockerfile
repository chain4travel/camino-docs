FROM node:18 as builder

WORKDIR /opt

COPY package.json . 
COPY yarn.lock . 

RUN yarn install

COPY . . 

RUN yarn build

FROM nginx:stable-alpine
COPY --from=builder /opt/build /usr/share/nginx/html/