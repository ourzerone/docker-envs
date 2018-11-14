# docker-envs
It is a develper env.include nginx,mysql,php,mangodb,redis....services.

# How To Use
### 1. Install dockertool ###
* Download last version docker-toolbox,from https://mirrors.aliyun.com/docker-toolbox/windows/docker-toolbox/, and install the docker-toolbox.

### 2. Config the dockertool ### 
* Map `C:\Users\Administrator\.docker` to `D:\.docker`
```
rm -rf C:\Users\Administrator\.docker-----gitbash
mkdir /d/.docker-----gitbash

win+r
input 'cmd'
mklink /J C:\Users\Administrator\.docker D:\.docker 
Create default machine.by runing the docker quickstart
```
![image](https://github.com/myzero1/show-time/blob/master/docker-envs/screenshot/101.png)
![image](https://github.com/myzero1/show-time/blob/master/docker-envs/screenshot/100.png)



* Setting the network of default in virtualBox.
```
docker-machine stop
```

![image](https://github.com/myzero1/show-time/blob/master/docker-envs/screenshot/102.png)



* Create `docker-workspace` in `D:\\.docker` and add docker-envs
```
mkdir docker-workspace
git clone -b master_nmp  https://github.com/myzero1/docker-envs.git
The files tree will as follows
D:\.docker
    docker-workspace
        docker-envs
            app
                .gitignore
            env
                services
                bootlocal.sh
                docker-compose.yml
                docker-compose.yml.hub
                docker-compose.yml.hub.app
                docker-compose.yml.hub.app.dis
                docker-compose.yml.hub.nmp
                docker-compose.yml.hub.nmp.dis
            .gitignore
            gitflow-plus-init.sh
            LICENSE
            README.md
```

![image](https://github.com/myzero1/show-time/blob/master/docker-envs/screenshot/103.png)



* Settting `bootlocal.sh` in docker-machine
```
docker-machine start
docker-machine.exe ssh
sudo vi /var/lib/boot2docker/bootlocal.sh
cp the content of D:\.docker\docker-workspace\docker-envs\env\bootlocal.sh to /var/lib/boot2docker/bootlocal.sh
save /var/lib/boot2docker/bootlocal.sh
docker-machine.exe restart
```

![image](https://github.com/myzero1/show-time/blob/master/docker-envs/screenshot/104.png)



* Settting `docker-compose.yml`
```
cd /d/.docker/docker-workspace/docker-envs/env
cp docker-compose.yml.hub.nmp docker-compose.yml
edit the docker-compose.yml
```

![image](https://github.com/myzero1/show-time/blob/master/docker-envs/screenshot/105.png)



* Settting `hosts`
```
cd /c/Windows/System32/drivers/etc
vi hosts
add '127.0.0.1      phpmyadmin.app.test    	advanced.app.test' to hosts
```

![image](https://github.com/myzero1/show-time/blob/master/docker-envs/screenshot/107.png)



* Use `gitflow-plus`
```
cd /d/.docker/docker-workspace/docker-envs
bash gitflow-plus-init.sh
```

![image](https://github.com/myzero1/show-time/blob/master/docker-envs/screenshot/108.png)

### Others ###
```cmd

dockertool和docker-ccompose的使用
    安装dockertool
		下载最新版本 https://mirrors.aliyun.com/docker-toolbox/windows/docker-toolbox/ 按提示进行安装，直接使用docker quickstart，新建default machine.

	设置dockertool
		把用户目录下的 C:\Users\Administrator\.docker 目录映射到 D:\.docker
			win + r（或者在开始菜单中点击“运行”）
			输入cmd
			mklink /J C:\Users\Administrator\.docker D:\.docker

			在default虚拟机的网络设置中的高级里面设置端口映射。


		在D:\.docker目录下创建docker-workspace目录，docker-composer相关项目就直接放在这下面了。
			docker-app 	https://github.com/myzero1/docker-app.git
				app 	app code或app cnf
				env		环境配置文件
					bootlocal.sh			docker-machine的自启动脚本，machine每次启动都会执行。在第一次使用machine时需要配置。
					docker-compose.yml		docker-compose配置文件
					sevices					各种服务的配置文件。
		配置hosts
			127.0.0.1      phpmyadmin.app.test		advanced.app.test
			http://phpmyadmin.app.test/直接访问数据库

```

# License
[MIT](https://github.com/myzero1/docker-envs/blob/master/LICENSE)
