# Docker Image for Build Android 

GitLab CI image for building Android apps

This code on repo will automatically build on Gitlab Registry : 

https://gitlab.com/showcheap/android-ci/container_registry

## Version
Please specify image version depends on your android project using docker images tag.
* `B` for Build Tools Version
* `T` for Target SDK Version

Example
```
image: registry.gitlab.com/showcheap/android-ci:T24-B25.0.1
``

For android project using `targetSdkVersion` version `24` and `buildToolsVersion` version `25.0.1`

## Example `.gitlab-ci.yml` file
You can specify tag for target SDK Version (If available, if not PR are welcome)
```yml
image: registry.gitlab.com/showcheap/android-ci:T24-B25.0.1

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
