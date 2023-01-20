# Q1
```shell
echo $SHELL
```
打印出`SHELL` enviroment variable可以查看当前使用的shell interpreter

# Q2
```shell
mkdir missing
```
为了方便，在当前目录下直接创建`missing`

# Q3
```shell
man touch
```
`touch` 是用来修改文件的access和modification时间的，当文件不存在的时候会用default permission来创建一个文件

# Q4
 ```shell
 touch ./missing/semester
```

# Q5
```shell
echo '#!/bin/sh' > ./missing/semester
echo 'curl --head --silent https://missing.csail.mit.edu' >> ./missing/semester
```
要注意使用单引号(single-quote)`'`来quote，这样字符串不会发生escape，而双引号不行。

# Q6
```shell
$ ./missing/semester
zsh: permission denied: ./missing/semester
$ ls -l missing
-rw-r--r--  1 longjinyu  staff  63 Jan 20 18:41 semester
```
可以发现当前用户对文件没有`x` 权限，不能直接执行文件

# Q7
```shell
$ sh ./missing/semester                             
HTTP/2 200 
server: GitHub.com
content-type: text/html; charset=utf-8
last-modified: Tue, 10 Jan 2023 13:56:01 GMT
access-control-allow-origin: *
etag: "63bd6e71-1f37"
expires: Fri, 20 Jan 2023 11:13:57 GMT
cache-control: max-age=600
x-proxy-cache: MISS
x-github-request-id: 9916:9183:403A0A:4ADACB:63CA751D
accept-ranges: bytes
date: Fri, 20 Jan 2023 11:04:01 GMT
via: 1.1 varnish
age: 4
x-served-by: cache-sjc10021-SJC
x-cache: HIT
x-cache-hits: 1
x-timer: S1674212642.544437,VS0,VE1
vary: Accept-Encoding
x-fastly-request-id: e984e5382deba48ceb01111a0ee72aeed7920157
content-length: 7991
```
it works, 因为我们把文件作为参数运行了`sh`程序，`sh` interpret 文件里的内容，即interpreter执行了script

# Q8

`chmod`可以更改文件的mode或者access control lists(ACL)

# Q9

作为文件的owner，可以为文件添加`x`权限，然后就可以执行了
```shell
chmod +x ./missing/semester
```
shebang(`#!`) 会被program loader mechanism解析为一条interpreter directive，加载器会把文件的路径作为参数传递给指定的interpreter， 就像运行了`sh ./missing/semester`  一样

# Q10
```shell
./missing/semester | grep last-modified > ./missing/last-modified.txt
```