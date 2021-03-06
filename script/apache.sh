查看Apache的并发请求数及其TCP连接状态：

　　netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a， S[a]}'
　　
返回结果：
　　LAST_ACK 5
　　SYN_RECV 30
　　ESTABLISHED 1597
　　FIN_WAIT1 51
　　FIN_WAIT2 504
　　TIME_WAIT 1057

　　SYN_RECV表示正在等待处理的请求数；
　　ESTABLISHED表示正常数据传输状态；
　　TIME_WAIT表示处理完毕，等待超时结束的请求数。

注释：
/^tcp/ 
#搜索以tcp开头的行

S[$NF]  
#以$NF为数组下标，建立数组S 

++S[$NF] 
#给数组S赋值，相当于有一个tcp那么这个S数组里的元素就+1

/^tcp/ {++S[$NF]}  
#整个意思应该是 匹配出一个tcp协议的连接 数组S就+一个元素值 

END是前面的/^tcp/ {++S[$NF]} 执行结束后在执行 

{for(a in S) print a, S[a]}  
#将S值代入a 打印a 和这个S[a]数组的值 
比如S是10 那么a就是10  S[a] 就是s这个数组的第10个元素的值


