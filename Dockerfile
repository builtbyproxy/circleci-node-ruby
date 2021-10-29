# Based on the pre-built CircleCI PHP image.
# See https://circleci.com/docs/2.0/circleci-images/#php
FROM circleci/node:14.11.0
# ARG DEBIAN_FRONTEND=noninteractive

LABEL maintainer="developers@tanda.co"
# Add Ruby.
RUN sudo apt-get update
RUN sudo apt-get install -y gnupg2
RUN command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN command curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
RUN curl -k -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c ". ~/.rvm/scripts/rvm && rvm install 2.6.5"

# Not sure if this is needed in CircleCI
ENTRYPOINT ["/bin/bash", "-l", "-c"]
