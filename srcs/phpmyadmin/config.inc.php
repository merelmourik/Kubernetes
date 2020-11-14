<?php

declare(strict_types=1);

$cfg['blowfish_secret'] = "l5:zqen9o3bNYHXEF[9O3o9x5ypn1lwP";

$i = 1;

// authentication type
$cfg['Servers'][$i]['auth_type'] = 'cookie';

// server parameters
$cfg['Servers'][$i]['host'] = 'mysql';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;
$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['user'] = 'mysql';
$cfg['Servers'][$i]['password'] = 'mysql';

// directories for saving/loading files from server
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
$cfg['PmaAbsoluteUri'] = '/';
$cfg['TempDir'] = './tmp';