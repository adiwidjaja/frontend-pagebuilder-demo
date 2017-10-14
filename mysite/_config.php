<?php

global $project;
$project = 'mysite';

global $database;

if (SS_ENVIRONMENT_TYPE == "dev") {
    $database = 'fpbdemo';
} else {
}

require_once('conf/ConfigureFromEnv.php');

MySQLDatabase::set_connection_charset('utf8');

SSViewer::set_theme('simple');

GD::set_default_quality(90);

FulltextSearchable::enable();

// Enable nested URLs for this site (e.g. page/sub-page/)
if(class_exists('SiteTree')) SiteTree::enable_nested_urls();
