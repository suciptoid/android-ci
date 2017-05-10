#
# GitLab CI: Android v0.2
#
# https://hub.docker.com/r/showcheap/gitlab-ci-android/
#

FROM ubuntu:16.04
MAINTAINER Sucipto <chip@pringstudio.com>

ENV VERSION_SDK_TOOLS "25.2.3"
ENV VERSION_BUILD_TOOLS "23.0.3"
ENV VERSION_TARGET_SDK "23"

# Prepare System
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends curl html2text openjdk-8-jdk libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 unzip && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rm -f /etc/ssl/certs/java/cacerts; \
    /var/lib/dpkg/info/ca-certificates-java.postinst configure

# Download SDK
ADD http://dl.google.com/android/repository/tools_r${VERSION_SDK_TOOLS}-linux.zip /tools.zip
RUN unzip /tools.zip -d /sdk && \
    rm -v /tools.zip

# Configure PATH
ENV ANDROID_HOME "/sdk"
ENV PATH "${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools"

# Accept License
RUN mkdir -p $ANDROID_HOME/licenses/ && \
    echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > $ANDROID_HOME/licenses/android-sdk-license && \
    echo "84831b9409646a918e30573bab4c9c91346d8abd" > $ANDROID_HOME/licenses/android-sdk-preview-license

# Install SDK Package
RUN sdkmanager "platform-tools" --verbose && \
    sdkmanager "platforms;android-${VERSION_TARGET_SDK}" --verbose && \
    sdkmanager "build-tools;${VERSION_BUILD_TOOLS}" --verbose && \
    sdkmanager "extras;android;m2repository" --verbose && \
    sdkmanager "extras;google;m2repository" --verbose && \
    sdkmanager "extras;google;google_play_services" --verbose && \
    sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2" --verbose && \
    sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.1" --verbose
