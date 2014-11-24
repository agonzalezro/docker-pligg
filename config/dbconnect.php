<?php
define("EZSQL_DB_USER", "pligguser");
define("EZSQL_DB_PASSWORD", getenv("MYSQL_PASSWORD"));
define("EZSQL_DB_NAME", "dbpligg");
define("EZSQL_DB_HOST", "db");
if (!function_exists('gettext')) {
	function _($s) {return $s;}
}
?>
