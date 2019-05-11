# Base Image - Node Platform
FROM node:current-alpine
LABEL maintainer="Jonathan Hardison <jmh@jonathanhardison.com>"

# Install Firebase CLI
RUN yarn global add firebase-tools

#copy in entrypoint script
COPY ./docker-entry.sh /

#set executable
RUN ["chmod", "+x", "/docker-entry.sh"]

#Launch entrypoint is going to handle the publish command using tokens
ENTRYPOINT [ "/docker-entry.sh" ]