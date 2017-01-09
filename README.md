# ApkChannelBuild
多渠道打包，纯java生成一个渠道名的空文件，以便在Android App中用代码动态获取渠道名

umeng-analytics-v6.0.7.jar 、utdid4all-1.0.4.jar 这两个jar文件是UMeng统计的，只是为了测试代码添加渠道的方式，在本项目中并没有什么用  

测试时，运行工程，在弹出窗口中，拖入工程下的ProguardPack.apk即可  
如需要测试自己的apk，请配置好签名文件相关的属性，在代码中  

关于zipalign_batch.sh(已加可执行权限)：  
命令行：./zipalign_batch.sh  
看它的代码有， "for file in ./release/*"  表示会从这目录下循环查找任意文件，当然要执行zipalign命令，还是要求扩展名是.apk的  
优化后的文件在release/zipaligned/   目录下  

关于getcertificate.sh(已加可执行权限)，这是一个可打印apk签名的shell脚本，命令行使用时：  
./getcertificate.sh xx.apk

参考：
Android多渠道打包之Python打包 ---- http://www.jianshu.com/p/52a3c3187dcc  
Android批量打包提速 - 1分钟900个市场不是梦 ------ http://www.cnblogs.com/ct2011/p/4152323.html  



