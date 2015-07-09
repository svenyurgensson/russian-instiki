## Introduction

One paragraph summary

## Summary



## Installations

### Local

Для запуска в режиме разработчика

    instiki -e development


#### Deploy setup

Выполняется однократно для настройки проекта.
Выполняем локально в директории проекта:

    bundle install
    mina setup -v
    mina deploy -v
    mina "rake[db:setup]" -v

### Deploy to server

После внесения изменений в проект локально, тестирования и отправки изменений в репозиторий,
выполняем локально в директории проекта:

    mina deploy -v


## Getting started

Explain the steps to install and link to further info
Show usage examples


## FAQs



## Contributors

List of contributors


## README presentation
[Readme Driven Development](http://www.slideshare.net/maetl/readme-driven-development-12783652)
