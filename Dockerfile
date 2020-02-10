FROM ubuntu:16.04

WORKDIR /garmin

RUN apt-get update -y && apt-get install -y curl unzip

RUN curl -o sdk.zip https://developer.garmin.com/downloads/connect-iq/sdks/connectiq-sdk-lin-3.1.6-2019-10-23-2de4665c6.zip && unzip sdk.zip && rm sdk.zip

RUN apt-get install -qqy openjdk-8-jdk && \
    apt-get install -qqy ca-certificates libusb-1.0 libpng12-0 libwebkitgtk-1.0-0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "export PATH=$PATH:/garmin/bin" >> ~/.bashrc

CMD ["/bin/bash"]
