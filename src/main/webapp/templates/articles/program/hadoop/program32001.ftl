<div class="article-body">
    <p>
        1.cd /home
        2.wget http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.8.0/hadoop-2.8.0.tar.gz
        3.tar -zxf hadoop-2.8.0.tar.gz
        4.vim /root/.bash_profile
        export JAVA_HOME=/usr/java/jdk1.8.0_92
        export HADOOP_INSTALL=/home/hadoop-2.8.0
        PATH=$PATH:$HOME/bin:$HADOOP_INSTALL/bin:$HADOOP_INSTALL/sbins
        export PATH
        5.source .bash_profile
        6.hadoop version
        Hadoop 2.8.0
        Subversion https://git-wip-us.apache.org/repos/asf/hadoop.git -r 91f2b7a13d1e97be65db92ddabc627cc29ac0009
        Compiled by jdu on 2017-03-17T04:12Z
        Compiled with protoc 2.5.0
        From source with checksum 60125541c2b3e266cbf3becc5bda666
        This command was run using /home/hadoop-2.8.0/share/hadoop/common/hadoop-common-2.8.0.jar

        7.cd hadoop-2.8.0/etc/hadoop
        8.vim core-site.xml
        <configuration>
            <property>
                <name>fs.default.name</name>
                <value>hdfs://localhost:9000/</value>
            </property>
        </configuration>
        9.vim hdfs-site.xml
        <configuration>
            <property>
                <name>dfs.replication</name>
                <value>1</value>
            </property>
        </configuration>

        10.ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
        cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
        chmod 0600 ~/.ssh/authorized_keys

        11.hadoop namenode -format
        /tmp/hadoop-root  /tmp/hsperfdata_root

        12.vim /home/hadoop-2.8.0/libexec/hadoop-config.sh

        export JAVA_HOME=/usr/java/jdk1.8.0_92
        # Attempt to set JAVA_HOME if it is not set
        if [[ -z $JAVA_HOME ]]; then
        # On OSX use java_home (or /Library for older versions)
        if [ "Darwin" == "$(uname -s)" ]; then
        if [ -x /usr/libexec/java_home ]; then
        export JAVA_HOME=($(/usr/libexec/java_home))
        else
        export JAVA_HOME=(/Library/Java/Home)
        fi
        fi

        # Bail if we did not detect it
        if [[ -z $JAVA_HOME ]]; then
        echo "Error: JAVA_HOME is not set and could not be found." 1>&2
        exit 1
        fi
        fi

        JAVA=$JAVA_HOME/bin/java

        13.vim /home/hadoop-2.8.0/etc/hadoop/hadoop-env.sh
        export HADOOP_HEAPSIZE=200

        14.cd /home/hadoop-2.8.0/sbin
        ./start-dfs.sh

    </p>
</div>