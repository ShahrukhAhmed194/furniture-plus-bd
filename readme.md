# rupaporup.com
rupaporup.com(V-1.0.0) is an Laravel eCommerce Management website developed by [EOMSBD](https://eomsbd.com). This application bield to manage any king of eCommerce website with lite functionality.

# Deployed On
* [rupaporup.com](https://rupaporup.com)

* php8.1 /usr/local/bin/composer update
* brew unlink php@7.4 && brew link php@8.1

sudo chgrp -R www-data public/l-build resources/views/l-build
sudo chmod -R ug+rwx public/l-build resources/views/l-build

c:\xampp-8.1\php\php.exe  c:\ProgramData\ComposerSetup\bin\composer.phar instal
cp .env.example .env
php artisan key:generate
php artisan serve


ALTER TABLE `categories` ADD `home_block` TINYINT NOT NULL DEFAULT '0' AFTER `feature`; 

#db changes
date 25-07-24
php artisan migrate --path=/database/migrations/2019_10_02_191245_create_apps_table.php
php artisan migrate --path=/database/migrations/2022_08_14_082121_create_sms_table.php

ALTER TABLE `products` ADD `nutrition` TEXT NULL DEFAULT NULL AFTER `description`;
ALTER TABLE `categories` ADD `icon` VARCHAR(100) NULL DEFAULT NULL AFTER `meta_tags`;
ALTER TABLE `widgets` ADD `is_show_title` BOOLEAN NOT NULL DEFAULT TRUE AFTER `title`;

php artisan migrate --path=/database/migrations/2021_10_13_100048_create_sitemaps_table.php
php artisan migrate --path=/database/migrations/2021_09_21_075231_create_email_templates_table.php
