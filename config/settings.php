<?php
$my_base_url = getenv('MY_BASE_URL');
if ($my_base_url === '') {
  $my_base_url = 'http://localhost';
}
$my_pligg_base = '';
$dblang = 'en';
if(!defined('table_prefix')){ define('table_prefix', 'pligg_'); }
include_once mnminclude.'settings_from_db.php';
?>
