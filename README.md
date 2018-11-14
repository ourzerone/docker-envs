# docker-app

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