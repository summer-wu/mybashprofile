#这个文件模仿util-linux中的whereis，在man path 和path下搜索文件
whereis_man_path=$(man -w|tr ":" " ")
whereis_bin_path=$(echo $PATH | tr ":" " ")
whereis_path="$whereis_man_path $whereis_bin_path"

#echo是调试用。本来想在function中调用，但是function中不能访问$1
#echo "find $whereis_path -type f -name $1"
#find $whereis_path ! -readable -prune -type f -name $1 

for i in $whereis_path
do
	#echo find $i -type f -name "*$1*" 2>/dev/null
	find $i -type f -name "*$1*" 2>/dev/null
done
