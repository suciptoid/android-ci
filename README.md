# Docker Image for Build Android 
[![](https://images.microbadger.com/badges/image/showcheap/gitlab-ci-android.svg)](https://microbadger.com/images/showcheap/gitlab-ci-android "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/showcheap/gitlab-ci-android.svg)](https://microbadger.com/images/showcheap/gitlab-ci-android "Get your own version badge on microbadger.com")

GitLab CI image for building Android apps

This code on repo will automatically build on Gitlab Registry : 

https://gitlab.com/showcheap/android-ci/container_registry

## Example `.gitlab-ci.yml` file
You can specify tag for target SDK Version (If available, if not PR are welcome)
```yml
image: registry.gitlab.com/showcheap/android-ci:latest

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
