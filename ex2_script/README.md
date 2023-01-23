# Q1
```shell
ls -lath --color=auto
```
`-l` : List files in the long format
`-a` : 显示所有文件
`-h` : human reable format
`-t`: Sort by descending time modified (most recently modified first).
`--color=auto`: Enable colorized output.  

# Q2
```shell
#!/bin/bash

marco () {
        TWD=$PWD
}

polo () {
        cd $TWD
        echo "move to $TWD"
}
```
`source marco.sh`来将function加载进environment中。

# Q3
```shell
#!/usr/bin/env bash

count=1
./error.sh > output 2>&1  # firstly, redirect STDIN to 'output' file, then redirect STDERR to STDIN.

while [ $? -eq 0 ]
do
((count+=1))  #  Condition Construct:Shell Arithmetic
./error.sh >> output 2>&1
done

echo "it took $count times for the script to fail."
```
`./error.sh > output 2>&1`  必须先将STDIN重定向到文件，再将STDERR定向到STDIN，顺序颠倒会出错。

# Q4
```shell
find html -name "*.html" | xargs -d "\n" zip html 
```
如果`xargs` 的STDIN中有space字符，会导致意外结果，此时我们必须用`-d` flag指定。delimiter。

```shell
find html -name "*.html" -exec zip html.zip {} \;
```
对于`find`的`-exec`功能，每个augment中有space字符也能正确处理。

# Q5
```shell
find . -type f | xargs -d "\n" ls -t | tee
```
`find . -type f` 可以recursively找出目录下的所有regular file，作为augment传递给`ls`后可以很方便地根据文件修改时间排序。