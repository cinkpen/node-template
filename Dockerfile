FROM node:14.16.1-alpine3.12



# Set user and group
ARG user=app
ARG group=app
ARG uid=1000
ARG gid=1000
RUN addgroup  ${group}
RUN adduser  -g ${group} -S ${user} 

USER ${user}


# Create app directory
WORKDIR /usr/src/app


# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Set Node environment to production
# ENV NODE_ENV production

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

CMD [ "npm", "start" ]