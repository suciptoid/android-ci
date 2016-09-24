# Docker Image for Build Android
GitLab CI image for building Android apps

This code on repo will automatically build on Docker Hub : 

https://hub.docker.com/r/showcheap/gitlab-ci-android/

## Example `.gitlab-ci.yml` file
You can specify tag for target SDK Version (If available, if not PR are welcome)
```yml
image: showcheap/gitlab-ci-android:latest

before_script:
    - export GRADLE_USER_HOME=`pwd`/.gradle
    - chmod +x ./gradlew

cache:
  paths:
     - .gradle/wrapper
     - .gradle/caches

build:
  stage: build
  script:
     - ./gradlew assemble

test:
  stage: test
  script:
     - ./gradlew check

```
