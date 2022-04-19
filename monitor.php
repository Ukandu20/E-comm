<?php
$host = 'thrayas.myweb.cs.uwindsor.ca/Project/index.html';
if($socket =@ fsockopen($host, 80, $errno, $errstr, 30)) {
echo "<p><font color=\"green\">Online!";
fclose($socket);
} else {
echo "<p><font color=\"red\">Offline :(";
}
?>