FROM node:12 as build
WORKDIR /app
ADD . /app

RUN yarn install
RUN yarn run build

FROM nginx

COPY --from=build /app/dist /usr/share/nginx/html/
