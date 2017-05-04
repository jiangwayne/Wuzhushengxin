<div class="article-body">
    <p>以下是在centos7.2下安装hadoop2.8.0的步骤,安装hadoop之前请确保jdk和ssh已经安装，这里不做详细介绍，参考官方文档: <a target="_blank" href="http://hadoop.apache.org/docs/r2.8.0/index.html">http://hadoop.apache.org/docs/r2.8.0/index.html</a></p>
    <p>一.下载安装包hadoop-2.8.0.tar.gz到/home目录,并解压</p>
    <blockquote>
        1.cd /home <br/>
        2.wget http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.8.0/hadoop-2.8.0.tar.gz<br/>
        3.tar -zxf hadoop-2.8.0.tar.gz
    </blockquote>
    <p>二.修改.bash_profile文件，配置hadoop的环境变量</p>
    <blockquote>
        4.vim /root/.bash_profile<br/>
        export JAVA_HOME=/usr/java/jdk1.8.0_92<br/>
        export HADOOP_INSTALL=/home/hadoop-2.8.0<br/>
        PATH=$PATH:$HOME/bin:$HADOOP_INSTALL/bin:$HADOOP_INSTALL/sbin<br/>
        export PATH<br/>
        5.source /root/.bash_profile
    </blockquote>
    <p>三.查看是否安装成功</p>
    <blockquote>
        6.hadoop version<br/>
    </blockquote>
    <p>
        显示如下信息表示安装成功<br/>
        Hadoop 2.8.0<br/>
        Subversion https://git-wip-us.apache.org/repos/asf/hadoop.git -r 91f2b7a13d1e97be65db92ddabc627cc29ac0009<br/>
        Compiled by jdu on 2017-03-17T04:12Z<br/>
        Compiled with protoc 2.5.0<br/>
        From source with checksum 60125541c2b3e266cbf3becc5bda666<br/>
        This command was run using /home/hadoop-2.8.0/share/hadoop/common/hadoop-common-2.8.0.jar<br/>
    </p>
    <p>四.伪分布式配置</p>
    <blockquote>
        7.cd hadoop-2.8.0/etc/hadoop<br/>
        8.vim core-site.xml<br/>
        <code>
            &lt;configuration&gt;<br/>
            &nbsp;&nbsp;&lt;property&gt;<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&lt;name&gt;fs.default.name&lt;/name&gt;<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&lt;value&gt;hdfs://localhost:9000/&lt;/value&gt;<br/>
            &nbsp;&nbsp;&lt;/property&gt;<br/>
            &lt;/configuration&gt;
        </code><br/>
        9.vim hdfs-site.xml<br/>
        <code>
            &lt;configuration&gt;<br/>
            &nbsp;&nbsp;&lt;property&gt;<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&lt;name&gt;dfs.replication&lt;/name&gt;<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&lt;value&gt;1/&lt;/value&gt;<br/>
            &nbsp;&nbsp;&lt;/property&gt;<br/>
            &lt;/configuration&gt;
        </code><br/>
    </blockquote>
    <p>五.配置ssh无密码登录</p>
    <blockquote>
        10.ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa<br/>
        11.cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys<br/>
        12.chmod 0600 ~/.ssh/authorized_keys<br/>
    </blockquote>
    <p>六.格式化hdfs文件系统</p>
    <blockquote>
        13.hadoop namenode -format
    </blockquote>
    <p>可以看到创建了/tmp/hadoop-root和/tmp/hsperfdata_root这两个目录</p>
    <p>七.设置hadoop内存大小</p>
    <blockquote>
        14.vim /home/hadoop-2.8.0/etc/hadoop/hadoop-env.sh<br/>
        export HADOOP_HEAPSIZE=200
    </blockquote>
    <p>八.启动hadoop</p>
    <blockquote>
        15.cd /home/hadoop-2.8.0/sbin<br/>
        16../start-dfs.sh
    </blockquote>
    <p>如果提示Error: JAVA_HOME is not set and could not be found.修改/home/hadoop-2.8.0/libexec/hadoop-config.sh文件,在
        # Attempt to set JAVA_HOME if it is not set之前加上export JAVA_HOME=/usr/java/jdk1.8.0_92</p>
</div>