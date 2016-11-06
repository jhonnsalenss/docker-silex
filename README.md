# Docker-silex
Este repositorio utiliza a su vez la plantilla desarrollado por Fabbian Potencier

[https://github.com/silexphp/Silex-Skeleton.git](https://github.com/silexphp/Silex-Skeleton.git)

1. Clonar el repositorio
```javascript
$ git clone https://github.com/jhonnsalenss/docker-silex.git
```

2. Situarse el el directorio raiz de la aplicacion
```javascript
$ cd docker-silex
```
3. Instalar las dependencias de silex-skeleton
```javascript
$ composer install
```

Tambien se puede utilizar la terminal con

```javascript
    $ docker run -t -i {NOMBRE_IMAGEN} /bin/bash
```
```javascript
$ cd /var/www/html/
$ composer install
```
4. En el navegador web abrir http//:0.0.0.0:80/

La imagen de servidor esta basada en la imagen oficial de docker.

* Version de docker   php:5.6-apache

* Version silex       2.0
