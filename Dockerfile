FROM ubuntu:18.04

ENV ANDROID_HOME="/opt/android-sdk"
ENV PATH="/opt/android-sdk/tools/bin:/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:$PATH"
ADD build.sh /tmp
RUN /tmp/build.sh
