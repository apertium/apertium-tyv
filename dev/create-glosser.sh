if [[ $# -lt 1 ]]; then
	echo "create-glosser.sh <lexc file>";
	exit;
fi

echo 'DELIMITERS = "<.>" "<!>" "<?>" "<...>" "<¶>" ;
SOFT-DELIMITERS = "<,>" ;

SECTION' ;

cat $1 | grep '! "' | grep -v '""' | cut -f2- -d':' | sed 's/ [A-Z]/ ! &/g' | cut -f1 -d',' | sed 's/N[0-9]/n/g' | sed 's/INTERJ/ij/g' | sed 's/ABBR/abbr/g' | sed 's/V-IV[A-Z-]*/v iv/g'  | sed 's/V-TV[A-Z-]*/v tv/g' | sed 's/VAUX[A-Z-]*/vaux/g' | grep -v 'DIGIT' | sed 's/POST /post /g' | sed 's/CA/cnjadv/g' | sed 's/CS/cnjsub/g' | sed 's/CC/cnjcoo/g'  | grep -v 'LR' | sed 's/DET[A-Z-]*/det/g' | sed 's/PRON[A-Z-]*/prn/g' | sed 's/NUM/num/g' | sed 's/A[0-9]/adj/g' | sed 's/ADV[A-Z-]*/adv/g' | sed 's/V-TD[A-Z-]*/v TD/g' | cut -f1-3 -d'!' | sed 's/;//g' | sed 's/ *! */\t/g' | sed 's/"//g' | awk -F'\t' '{print $3"\t"$1"\t"$2}' | sed 's/([а-я]\+)//g' | sed 's/^/ADD ({rus:/1' | sed 's/\t/}) ("/1' | sed 's/\t/" /1' | sed 's/$/);/g' | sed 's/%//g' | sed 's/: /:/g' | sed 's/ }/}/g'
