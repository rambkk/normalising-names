/* Javascript sample function to normalise name
 * using rules from https://github.com/rambkk/normalising-names
 *
 * normaliseName (version 0.11 - initial release)
 * 
 * (c) Ram Narula 
 * You can use this information, do give credit: 
 * github rambkk - Ram Narula - pluslab.net
 */

var myString="hello \u2013\u001F\u200B\u200C\u200D";
var finalString;

finalString=myString.replace(/[\u0000-\u001F\u007f\u00AD\u200B-\u200D\u3000\uFEFF]/g,'');
finalString=finalString.replace(/\u00AD/,' ');
finalString=finalString.replace(/\u2013/,'-');

