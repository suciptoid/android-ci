# Docker Image for Build Android 

GitLab CI image for building Android apps

This code on repo will automatically build on Gitlab Registry : 

https://gitlab.com/showcheap/android-ci/container_registry

## Version
Please specify image version depends on your android project using docker images tag.
* `B` for Build Tools Version
* `T` for Target SDK Version

Example
```yml
image: registry.gitlab.com/showcheap/android-ci:T25-B25.0.3
```

For android project using `targetSdkVersion` version `25` and `buildToolsVersion` version `25.0.3`

You can see available tag on branch section

https://gitlab.com/showcheap/android-ci/branches

## Example `.gitlab-ci.yml` file
You can specify tag for target SDK Version (If available, if not PR are welcome)

```yml
image: registry.gitlab.com/showcheap/android-ci:T25-B25.0.3

before_script:
    - export GRADLE_USER_HOME=`pwd`/.gradle
    - chmod +x ./gradlew

cache:
  key: "$CI_COMMIT_REF_NAME"
  paths:
     - .gradle/

stages:
  - test
  - build

test:
  stage: test
  script:
     - ./gradlew check

build:
  stage: build
  script:
     - ./gradlew assemble

```
