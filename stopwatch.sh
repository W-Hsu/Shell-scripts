#/bin/bash
read -n 1 -p "Press any key to start..."

date1=`date`
starttime=$date1
echo Started at ${starttime:18:8}
echo Enter "ok" to stop

for ((i=1;i==1;));
do
	read -p " > " stopwatchin
	if [ "$stopwatchin" = ok ]; then
		i=0
		date1=`date`
		endtime=$date1
		echo Ended at ${endtime:18:8}
	else
		i=1
	fi
done

#Calculate Seconds

#step1:check if there's 0 before numbers.
#NEED TO BE IMPROVED!!
#i contrls start/end time
#j controls hours
#k mems gotten variable name (starthr...)
for i in 'start' end;
do

	for j in hr mn sc;
	do
		if [ i = 'start' ];then
			if [ j = hr ];then
				l=${starttime:18:2}
			elif [ j = mn ];then
				l=${starttime:21:2}
			elif [ j = sc ];then
				l=${starttime:24:2}
			fi
		else
			if [ j = hr ];then
				l=${endtime:18:2}
			elif [ j = mn ];then
				l=${endtime:21:2}
			elif [ j = sc ];then
				l=${endtime:24:2}
			fi
		fi

		if [  ${l:0:1} = 0 ];then
			l=${l:1:1}
		fi

		k=`eval echo '$'$i$j`
		export `eval echo $k`= $l
	done

done

hr=$((${endtime}-${starttime}))
mn=$((${endtime}-${starttime}))
sc=$((${endtime}-${starttime}))
totaltm=$(( 3600*${hr} + 60*${mn} + ${sc}))

#Apple Style ;)
if [ $totaltm = 1 ]; then
	echo result:${totaltm} sec.
elif [ $totaltm \< 301 ]; then
	echo result:${totaltm} secs.
else
	echo result:$(( ${totaltm} / 60)) mins.
fi
