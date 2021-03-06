/* Example queries to help find special characters in MySQL database 
 * NOTE: using table collation: utf8_unicode_ci
 * NOTE: other collations might work differently 
 * 
 * The HEX codes here are of unicode utf-8 format.
 *
 * This might be one of the easier ways, as there are many other ways.
 * 
 * Tested on: MySQL 8.0.25
 *
 * NOTE: for MariaDB users, replace $1 with \\1 in the query string
 *
 * keyword: normalising, normalizing, normalisation, normalization, normalise, normalize
 * Supplementary reading: https://betterexplained.com/articles/unicode/
 *
 * (c) Ram Narula You can use this information, do give credit: github rambkk - Ram Narula - pluslab.net
 *
 *     Please drop a note if you find this useful.
 */ 

/* (Testing if the database server can run this properly)
 * Just format sample data as strings of utf-8 hex with space in between them
 * The result should be "67-69-74-68-75-62-20-72-61-6D-62-6B-6B"
 */

/* For MySQL 8 */
SELECT REGEXP_REPLACE(HEX('github rambkk'),"([0-9A-F]{2})(?!$)",'$1 ') AS hex

/* For MariaDB 10 (sample) */
SELECT REGEXP_REPLACE(HEX('github rambkk'),"([0-9A-F]{2})(?!$)",'\\1 ') AS hex


/* Steps of the query:
 * 1 - convert the string into hexadecimal digits using HEX()
 * 2 - split the sting into pairs of 2 digits with space using REGEXP_REPLACE ([:xdigit:] matches 0-9,A-F,a-f)
 * 3 - search with REGEXP
 * These  statements do the same thing, just using different styles
 * which is to look for suggested characters which should be filtered
 */

/* assuming MySQL table name is table1 having columns id and column1 */
SELECT id,column1,REGEXP_REPLACE(HEX(column1),"([[:xdigit:]]{2})(?!$)",'$1 ') AS hex FROM table1 WHERE 
REGEXP_REPLACE(HEX(column1),"([[:xdigit:]]{2})(?!$)",'$1 ') REGEXP 
'00|01|02|03|04|05|06|07|08|09|0A|0B|0C|0D|0E|0F|10|11|12|13|14|15|16|17|18|19|1A|1B|1C|1D|1E|1F|7F|C2 AD|E2 80 8B|E2 80 8C|E2 80 8D|E3 80 80|EF BB BF'

SELECT id,column1,REGEXP_REPLACE(HEX(column1),"([[:xdigit:]]{2})(?!$)",'$1 ') AS hex FROM table1 WHERE 
REGEXP_REPLACE(HEX(column1),"([[:xdigit:]]{2})(?!$)",'$1 ') REGEXP '0[:xdigit:]|1[:xdigit:]|7F|C2 AD|E2 80 8B|E2 80 8C|E2 80 8D|E3 80 80|EF BB BF'

SELECT id,column1,REGEXP_REPLACE(HEX(column1),"([0-9A-F]{2})(?!$)",'$1 ') AS hex FROM table1 WHERE 
REGEXP_REPLACE(HEX(column1),"([0-9A-F]{2})(?!$)",'$1 ') REGEXP '0[0-9A-F]|1[0-9A-F]|7F|C2 AD|E2 80 8B|E2 80 8C|E2 80 8D|E3 80 80|EF BB BF' 

SELECT id,column1,REGEXP_REPLACE(HEX(column1),"([0-9A-F]{2})(?!$)",'$1 ') AS hex FROM table1 WHERE 
REGEXP_REPLACE(HEX(column1),"([0-9A-F]{2})(?!$)",'$1 ') REGEXP '[01][0-9A-F]|7F|C2 AD|E2 80 8[BCD]|E3 80 80|EF BB BF' 


