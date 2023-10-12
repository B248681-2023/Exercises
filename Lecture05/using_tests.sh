#! /bin/bash
head -4 $1
cut -f1,12 $1 | grep -v "#" | while read bn1 bn2; do
	bn2=$(printf %0.f ${bn2})
         [ $bn2 -ge 300 ] && { 
		echo "HSP score ${bn2} is truly excellent"
        	echo -e "${bn1}\t${bn2}" > good.bn 
	} || { 
		echo "HSP score ${bn2} is not excellent"
                echo -e "${bn1}\t${bn2}" > bad.bn
	}
done
