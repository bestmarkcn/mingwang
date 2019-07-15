<?php

$root = str_replace("\\","/",dirname(__FILE__));
$document = str_replace($_SERVER['SCRIPT_NAME'],"", $_SERVER['SCRIPT_FILENAME']);

define('HTTP_PATH',str_replace($document,'http://'.$_SERVER['HTTP_HOST'],$root.'/'));

define('ROOT_PATH',dirname(__FILE__).'/');
// HTTP
define('HTTP_SERVER', HTTP_PATH);

// HTTPS
define('HTTPS_SERVER', HTTP_PATH);
define('HTTP_IMAGE', HTTP_PATH.'image/');
define('HTTP_DOWNLOAD', HTTP_PATH.'download/');


// DIR
define('DIR_APPLICATION', ROOT_PATH.'catalog/');
define('DIR_SYSTEM', ROOT_PATH.'system/');
define('DIR_DATABASE', ROOT_PATH.'system/database/');
define('DIR_LANGUAGE', ROOT_PATH.'catalog/language/');
define('DIR_TEMPLATE', ROOT_PATH.'catalog/view/theme/');
define('DIR_CONFIG', ROOT_PATH.'system/config/');
define('DIR_IMAGE', ROOT_PATH.'image/');
define('DIR_CACHE', ROOT_PATH.'system/cache/');
define('DIR_DOWNLOAD', ROOT_PATH.'download/');
define('DIR_LOGS', ROOT_PATH.'system/logs/');

// DB
define('DB_DRIVER', 'mysql');
define('DB_HOSTNAME', 'localhost');
define('DB_PREFIX', '');

if(strpos($_SERVER['HTTP_HOST'],'localhost')!==false) {
	define('DB_USERNAME', 'root');
	define('DB_PASSWORD', '888888');
	define('DB_DATABASE', '15b0335');
}elseif(strpos($_SERVER['HTTP_HOST'],'works.tw')>0) {
	define('DB_USERNAME', 'b15b0335');
	define('DB_PASSWORD', '15b0335');
	define('DB_DATABASE', 'b15b0335');
} else {
	define('DB_USERNAME', 'b15b0335');
	define('DB_PASSWORD', '15b0335');
	define('DB_DATABASE', 'b15b0335');
 
}

?>