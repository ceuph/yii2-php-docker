FROM yiisoftware/yii2-php:7.3-apache

RUN apt-get update \
    && apt-get -y install apt-transport-https ca-certificates \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    &&  apt-get update \
    && ACCEPT_EULA=Y apt-get -y install msodbcsql17 unixodbc-dev \
    && pecl install sqlsrv pdo_sqlsrv
COPY sqlsrv.ini $PHP_INI_DIR/conf.d/