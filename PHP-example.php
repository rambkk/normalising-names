<?php
/* PHP sample function to normalise name
 * using rules from https://github.com/rambkk/normalising-names
 *
 * normaliseName (version 0.11 - initial release)
 *
 * Requirement:
 * PHP 7, PHP 8 (Unicode codepoint escape syntax)
 *
 * Syntax:
 * normaliseName(STRING)
 * returns (attempted) normalisation of STRING
 *
 * (c) Ram Narula 
 * You can use this information, do give credit: 
 * github rambkk - Ram Narula - pluslab.net
 */

$t="abcd!@#!aaa@#\x0aOK\xe2\x80\x93X\r\n\t\\\"TEST";
$n=normaliseName($t);
echo $n;

function normaliseName($string) {
$match=[];
$replace=[];
$match[0]='/['.
        '\x00-\x1f'.
        "\u{007f}".
        "\u{00ad}".
        "\u{200b}".
        "\u{200c}".
        "\u{200d}".
        "\u{3000}".
        "\u{feff}".
        ']/u';
$replace[0]='';

$match[1]="/\u{00a0}/u";
$replace[1]=' ';

$match[2]="/\u{2013}/u";
$replace[2]='-';

return preg_replace($match,$replace,$string);
}

~                                       
