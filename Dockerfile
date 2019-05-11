# Base Image - Node Platform
FROM node:current-alpine
LABEL maintainer="Jonathan Hardison <jmh@jonathanhardison.com>"

# Install Firebase CLI
RUN ["npm", "install", "-g", "firebase-tools"]

WORKDIR /opt/work
#Launch entrypoint is going to handle the publish command using tokens
CMD [ "sh", "-c", "firebase deploy --token $fb_ci_token --project $fb_projectid --message $fb_releasemessage" ]