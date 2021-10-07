# normalising-names
Information to help in normalising names


This is an attempt to aid in normalising names, it is not going to be complete as there are countless languages.
However, this information can help in narrowing names down to avoid duplications.

Filter List - These characters should be removed or ignored when storing or checking for duplicates.

Substitution List - These characters should be substituted when storing or checking for duplicates. 

```
Filter List (v. 20211007-01)
/=================================================\
|code| UTF-8  | HTML  |          info             |
|----|--------|-------|---------------------------|
|    |        |       |*ALL FROM 00 TO 1F         |
|    |        |       |                           |
|  7F|      7F|       |DELETE                     |
|  AD|   C2 AD|&shy;  |SOFT HYPHEN                |
|200B|E2 80 8B|       |ZERO WIDTH SPACE           |
|200C|E2 80 8C|&zwnj; |ZERO WIDTH NON-JOINER      |
|200D|E2 80 8D|&zwj;  |ZERO WIDTH JOINER          |
|3000|E3 80 80|       |IDEOGRAPHIC SPACE          |
|FEFF|EF BB BF|       |ZERO WIDTH NO-BREAK SPACE  |
\=================================================/


Substitution List (v. 20211007-01)
/===================================================================================================\
|                    FROM                         |                     TO                          |
|----|--------|-------|---------------------------|----|--------|-------|---------------------------|
|code| UTF-8  | HTML  |           info            |code| UTF-8  | HTML  |           info            |
|----|--------|-------|---------------------------|----|--------|-------|---------------------------|
|    |        |       |                           |    |        |       |                           |
|  A0|   C2 A0|&nbsp; |NO-BREAK SPACE             |  20|      20|       |SPACE                      |
|2013|E2 80 93|&ndash;|EN DASH                    |  2D|      2D|       |HYPHEN-MINUS               |
|    |        |       |                           |    |        |       |                           |
\===================================================================================================/

```

(c) Ram Narula
You can use this information, do give credit: github rambkk - Ram Narula - pluslab.net
