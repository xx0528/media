##服务端环境搭建

服务器采用本地编译 docker部署
本地编译各个微服务的linux版本
每个微服务一个容器 

go 环境安装
linux：
    获取最新的软件包源，并添加至当前的apt库
    `add-apt-repository ppa:longsleep/golang-backports`
    更新 apt库
    `apt-get update`
    安装go
    `sudo apt-get install golang-go`
    鉴定是否安装成功
    `go version`
    运行 `go env` 查看GOPATH路径

1.安装protoc二进制文件

下载地址：https://github.com/google/protobuf/releases
mv bin/protoc /usr/local/bin/       将可执行文件protoc放到/usr/local/bin目录里
mv include/google /usr/local/include/   将google整个文件夹放到/usr/local/include文件夹内
放入后要改变权限 否则无法读取 
sudo chmod 777 /usr/local/bin/protoc
sudo chmod -R 777 /usr/local/incldue/google

2.安装protobuf库文件

go get -u github.com/golang/protobuf/proto
3.安装goprotobuf插件

go get github.com/golang/protobuf/protoc-gen-go
4.安装gogoprotobuf插件和依赖

//gogo
go get github.com/gogo/protobuf/protoc-gen-gogo

//gofast
go get github.com/gogo/protobuf/protoc-gen-gofast

//依赖
go get github.com/gogo/protobuf/proto
go get github.com/gogo/protobuf/gogoproto
5.安装框架依赖

# grpc (或者git clone https://github.com/grpc/grpc-go 然后复制到google.golang.org/grpc)
go get -u google.golang.org/grpc

# genproto (或者git clone https://github.com/google/go-genproto 然后复制到google.golang.org/genproto)
go get google.golang.org/genproto/...
6.安装kratos tool

go get -u github.com/bilibili/kratos/tool/kratos
cd $GOPATH/src
kratos new kratos-demo --proto
