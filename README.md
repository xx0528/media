###多阶段构建
FROM golang:1.9-alpine as builder

RUN apk --no-cache add git

WORKDIR /go/src/github.com/go/helloworld/

RUN go get -d -v github.com/go-sql-driver/mysql

COPY app.go .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest as prod

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=0 /go/src/github.com/go/helloworld/app .

CMD ["./app"]

FROM golang:1.9-alpine as builder 用as为某一阶段命名
$ docker build --target builder -t username/imagename:tag .  可以单独指定生成某一阶段镜像
COPY --from=0 /go/src/github.com/go/helloworld/app . 从某一阶段复制内容到现阶段 --form=0 0代表阶段索引号 阶段从0开始
$ COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf 也可复制任意镜像中的内容放到当前镜像构建阶段


可以借助前一个镜像生成 将前一个镜像生成的产物 复制到下一个镜像内
由此可看 go微服务可以有两种编译方式
1、本地编译 把编译好的可执行文件复制到镜像里
2、镜像内编译 编译好后复制到要生成的镜像
考虑用第二种 因为之后开发中不一定只有go环境 还可能有node等环境
如果本地编译又要好几步完成 索性放到镜像里编译 可能每次都要复制代码到镜像会有些慢
