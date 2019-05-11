# Base Image - Node Platform
FROM node:current-alpine
LABEL maintainer="Jonathan Hardison <jmh@jonathanhardison.com>"

# Install Firebase CLI
RUN ["npm", "install", "-g", "firebase-tools"]

#Launch entrypoint is going to handle the publish command using tokens
CMD [ "firebase", "deploy", "--token", "$fb_ci_token", "--project", "$fb_projectid", "--message", "Release: $fb_releasemessage" ]