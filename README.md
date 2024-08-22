# 使Docker交叉编译

## 准备

:walking:鱼香ROS一键安装Docker

:running:因为指令集不同，需要使用 QEMU 模拟器来运行不同架构的二进制文件:

```sh
apt-get install -y qemu-user-static
```



## 使用

:tea:首先导入镜像

```shell
docker load -i <导入文件名>.tar
```

- `-i`：指定输入文件的路径。
- `<导入文件名>.tar`：您之前导出的tar文件的名称。

然后`docker image list`你就可以看到镜像名和标签了，本次的镜像包括了基本的c++环境。



:coffee:随后从镜像运行容器:

```sh
sudo docker run -it --name armcontainer\
    -v /home/asuka2020/1/ccmodel:/home/asuka/ \
    -w /home/asuka\
    armbuild:latest
```

>**--name npcontainer:** 这个选项用来给容器指定一个名称。在这个例子中，容器的名称是npcontainer。
>**-v /home/username:/workspace:** 这个选项用来挂载卷。它将宿主机的/home/username目录挂载到容器内的/workspace目录。
>**-w /workspace:** 这个选项用来设置容器内的工作目录为/workspace。这意味着容器内的任何命令都将从这个目录执行。
>**armbuild:latest:** 这是要运行的Docker镜像名称。

将代码路径挂到`容器`的任意路径下，我们期望数据在本地，docker只是方法。最好路径和板子一样，可能会免去手动添加共享库路径。

然后就可以`cmake`、`make`了，数据都在本地。

容器是留在本地的，下次运行

```sh
docker start -i armcontainer
```





