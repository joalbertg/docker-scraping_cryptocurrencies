FROM node:13-alpine
LABEL maintainer="Joalbert Andrés González <joalbertgonzalez@gmail.com>"
LABEL version="1.0.0"

# -U, --update-cache    Update the repository cache
RUN apk add --update-cache && \
    rm -rf /var/cache/apk/*

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
ENV INSTALL_PATH /myapp
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY package*.json ./

RUN npm install

COPY . . 

# Start the main process.
CMD ["node", "index.js"]

