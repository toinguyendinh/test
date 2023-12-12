paste data_out_1.txt data_out_2.txt > out_raw_1.txt
sed -i '1,5d' out_raw_1.txt

awk '{print $3 " " $4 " " $5 " " $8 " " $9 " " $10}' out_raw_1.txt > out_raw_2.txt

awk '{
	if($1=="1.800000e+00")
		$0="1"
	else 
		$1="0"
	print $0}' out_raw_2.txt > data_input_15.txt

#rm out_raw_1.txt
#rm out_raw_2.txt
