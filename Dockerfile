#build phase
FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN npm install

#copy all the files
COPY . . 

#instead of CMD .. here just run the command
RUN npm run build

#run phase
FROM  nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

# CMD not required. nginx by default starts.