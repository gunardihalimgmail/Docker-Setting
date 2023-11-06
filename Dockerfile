# FROM nginx:alpine

# RUN rm /etc/nginx/conf.d/default.conf

# COPY build /usr/share/nginx/html

# EXPOSE 3000

# CMD ["nginx","-g","daemon off;"]


# FROM node:16.9.1-alpine as build
# WORKDIR /app

# # Copy required files/folders to docker directory
# COPY package.json package-lock.json /app
# # COPY shared /app/shared
# # COPY projects/tt-core /app/projects/tt-core

# # Installing yarn dependicies and biuld the tt-core project
# RUN yarn install --frozen-lockfile --non-interactive --production=false --ignore-scripts \
#     && yarn build:tt-core

# run reactjs with nginx in production

# FROM nginx:alpine

# RUN rm /etc/nginx/conf.d/default.conf

# COPY build /usr/share/nginx/html

# #stage1
# FROM node:17-alpine as builder
# WORKDIR /app
# COPY package.json . 
# RUN npm install --legacy-peer-deps
# COPY . .
# # RUN yarn install

# #stage2
# FROM nginx:1.19.0
# WORKDIR /usr/share/nginx/html
# RUN rm -rf ./*
# # COPY --from=builder /app/build .    
# COPY build .
# ENTRYPOINT ["nginx", "-g", "daemon off;"]

FROM node:17-alpine
 
WORKDIR /app
 
COPY package.json .
 
RUN npm install --legacy-peer-deps
 
COPY . .
 
EXPOSE 3000
 
CMD [ "npm", "start" ]

