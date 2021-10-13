# normalising-names
Information to help in normalising names


This is an attempt to aid in normalising names, by removing some special characters which are very hard to see or are not actually visible.
This is not going to be complete list as there are countless languages.
However, this information can help in narrowing names down to avoid duplications.

Filter List - These characters should be removed or ignored when storing or checking for duplicates.

Substitution List - These characters should be substituted when storing or checking for duplicates. 

Substituton (optional) - In some cases removal of diacritical marks might be necessary. There are some rules to be followed.
Javascript: 
``` str.normalize("NFD").replace(/\p{Diacritic}/gu, "") ``` seem to do this internally. 
Other programming languages might need to look up a pre-defined list.

```
Filter List (v. 20211007-01) [unicode]
/=================================================\
|code| UTF-8  | HTML  |          info             |
|----|--------|-------|---------------------------|
|    |        |       |*ALL FROM U+0000 TO U+001F |
|    |        |       |                           |
|007F|      7F|       |DELETE                     |
|00AD|   C2 AD|&shy;  |SOFT HYPHEN                |
|200B|E2 80 8B|       |ZERO WIDTH SPACE           |
|200C|E2 80 8C|&zwnj; |ZERO WIDTH NON-JOINER      |
|200D|E2 80 8D|&zwj;  |ZERO WIDTH JOINER          |
|3000|E3 80 80|       |IDEOGRAPHIC SPACE          |
|FEFF|EF BB BF|       |ZERO WIDTH NO-BREAK SPACE  |
\=================================================/




Substitution List (v. 20211007-01) [unicode]
/===================================================================================================\
|                    FROM                         |                     TO                          |
|----|--------|-------|---------------------------|----|--------|-------|---------------------------|
|code| UTF-8  | HTML  |           info            |code| UTF-8  | HTML  |           info            |
|----|--------|-------|---------------------------|----|--------|-------|---------------------------|
|    |        |       |                           |    |        |       |                           |
|00A0|   C2 A0|&nbsp; |NO-BREAK SPACE             |0020|      20|       |SPACE                      |
|2013|E2 80 93|&ndash;|EN DASH                    |002D|      2D|       |HYPHEN-MINUS               |
|    |        |       |                           |    |        |       |                           |
\===================================================================================================/

```
keyword: normalising, normalizing, normalisation, normalization, normalise, normalize 

Supplementary reading: 
https://betterexplained.com/articles/unicode/

(c) Ram Narula
You can use this information, do give credit: github rambkk - Ram Narula - pluslab.net
