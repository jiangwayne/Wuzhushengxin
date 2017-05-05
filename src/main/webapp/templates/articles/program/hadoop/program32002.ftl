<div class="article-body">
    <p>hdfs即Hadoop Distributed Filesystem,是Hadoop抽象文件系统的其中一个实现。这里简单学习一下如何用命令与java接口操作hdfs。<br/>
        参考官方文档: <a target="_blank" href="http://hadoop.apache.org/docs/r2.8.0/hadoop-project-dist/hadoop-common/FileSystemShell.html">http://hadoop.apache.org/docs/r2.8.0/hadoop-project-dist/hadoop-common/FileSystemShell.html</a>
    </p>
    <p>准备所需jar包,pom.xml中添加依赖<br/>
        <code>
            &lt;dependency&gt;<br/>
            &nbsp;&nbsp;&lt;groupId&gt;org.apache.hadoop&lt;/groupId&gt;<br/>
            &nbsp;&nbsp;&lt;artifactId&gt;hadoop-common&lt;/artifactId&gt;<br/>
            &nbsp;&nbsp;&lt;version&gt;2.8.0&lt;/version&gt;<br/>
            &lt;/dependency&gt;<br/>
            &lt;dependency&gt;<br/>
            &nbsp;&nbsp;&lt;groupId&gt;org.apache.hadoop&lt;/groupId&gt;<br/>
            &nbsp;&nbsp;&lt;artifactId&gt;hadoop-hdfs&lt;/artifactId&gt;<br/>
            &nbsp;&nbsp;&lt;version&gt;2.8.0&lt;/version&gt;<br/>
            &lt;/dependency&gt;
        </code>
    </p>
    <p>一.创建目录:</p>
    <p><strong>使用命令：</strong><br/>
        hadoop fs -mkdir /user
    </p>
    <p><strong>使用java:</strong><br/></p>
    <pre>
        <code class="java">
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
public class Hdfs {
    public static void main(String[] args) throws Exception {
        createDir("hdfs://localhost:9000/user2");
    }
    public static void createDir(String strPath){
        try{
            Configuration hadoopConfig = new Configuration();
            hadoopConfig.set("fs.hdfs.impl", org.apache.hadoop.hdfs.DistributedFileSystem.class.getName());
            //FileSystem fs = FileSystem.get(hadoopConfig); //这种方式伪分布式下出现“Wrong FS: hdfs://localhost:9000/user2, expected: file:///”错误
            Path path = new Path(strPath);
            FileSystem fs = path.getFileSystem(hadoopConfig);
            fs.mkdirs(path);
        }catch (Exception ex){
            System.out.println(ex);
        }
    }
}
        </code>
    </pre>
    <p>打成hdfs.jar, 上传到hadoop服务器上， 用命令：<br/>
        java -jar hdfs.jar<br/>
        若出现no main manifest attribute。用命令：<br/>
        java -cp hdfs.jar Hdfs <br/>
        或者 上传一个MANIFEST.MF文件指定Main-Class 再用命令：<br/>
        jar -uvfm hdfs.jar MANIFEST.MF<br/>
        来更新hdfs.jar,就可以用java -jar了。
    </p>
    <p>http://localhost:50070/explorer.html或命令：<br/>
        hadoop fs -ls /<br/>
        可以查看hdfs系统的目录</p>

    <p>二.创建文件,写入数据</p>
    <p><strong>使用命令：</strong><br/>
        hadoop fs -touchz /user/a.txt&nbsp;&nbsp;--创建一个空文件<br/>
        hadoop fs -appendToFile a.txt /user/a.txt&nbsp;&nbsp;--将本地文件a.txt的内容append到hdfs的/user/a.txt<br/>
        或者<br/>
        hadoop fs -put a.txt /user/b.txt&nbsp;&nbsp;--将本地文件a.txt上传到hdfs的/user/b.txt<br/>
    </p>
    <p><strong>使用java:</strong><br/></p>
<pre>
        <code class="java">
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import java.io.OutputStream;
public class Hdfs {
    public static void main(String[] args) throws Exception {
        createFile("hdfs://localhost:9000/user2/a.txt");
    }
    public static void createFile(String strPath){
        try{
            Configuration hadoopConfig = new Configuration();
            hadoopConfig.set("fs.hdfs.impl", org.apache.hadoop.hdfs.DistributedFileSystem.class.getName());
            Path path = new Path(strPath);
            FileSystem fs = path.getFileSystem(hadoopConfig);
            OutputStream out = fs.create(path);
            out.write("Hello World!".getBytes("UTF-8"));
            out.flush();
        }catch (Exception ex){
            System.out.println(ex);
        }
    }
}
        </code>
    </pre>
    <p>hdfs被设计成一次写入，多次读取的访问模式，而且写操作总是将数据添加在文件末尾，不支持多用户写入，也不支持在文件的任意位置进行修改</p>
    <p>三.查看文件,读取数据</p>
    <p><strong>使用命令：</strong><br/>
        hadoop fs -ls /user&nbsp;&nbsp;--列出/user下的文件<br/>
        hadoop fs -cat /user/a.txt&nbsp;&nbsp;--显示/user/a.txt的内容<br/>
        hadoop fs -text /user/a.txt&nbsp;&nbsp;--显示/user/a.txt的内容,并解压,如果必要的话<br/>
        hadoop fs -get /user/a.txt /user/&nbsp;&nbsp;--将/user/a.txt下载到本地/user目录下<br/>
        hadoop fs -getmerge /user/a.txt /user/a.txt&nbsp;&nbsp;--将/user/a.txt的内容下载到本地文件/user/a.txt中<br/>
    </p>
    <p><strong>使用java:</strong><br/></p>
<pre>
        <code class="java">
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.FileUtil;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import java.io.InputStream;
import java.io.OutputStream;
public class Hdfs {
    public static void main(String[] args) throws Exception {
        listFile("hdfs://localhost:9000/user2");
        readFile("hdfs://localhost:9000/user2/a.txt");
    }
    public static void listFile(String strPath){
        try{
            Configuration hadoopConfig = new Configuration();
            hadoopConfig.set("fs.hdfs.impl", org.apache.hadoop.hdfs.DistributedFileSystem.class.getName());
            Path path = new Path(strPath);
            FileSystem fs = path.getFileSystem(hadoopConfig);
            FileStatus[] status = fs.listStatus(path);
            Path[] listedPaths = FileUtil.stat2Paths(status);
            for(Path p : listedPaths){
                System.out.println(p);
            }
        }catch (Exception ex){
            System.out.println(ex);
        }
    }

    public static void readFile(String strPath){
        InputStream in = null;
        try{
            Configuration hadoopConfig = new Configuration();
            hadoopConfig.set("fs.hdfs.impl", org.apache.hadoop.hdfs.DistributedFileSystem.class.getName());
            Path path = new Path(strPath);
            FileSystem fs = path.getFileSystem(hadoopConfig);
            in = fs.open(path);
            IOUtils.copyBytes(in, System.out, 4096, false);
        }catch (Exception ex){
            System.out.println(ex);
            IOUtils.closeStream(in);
        }
    }
}
        </code>
    </pre>
    <p>四.删除文件</p>
    <p><strong>使用命令：</strong><br/>
        hadoop fs -rm /user/a.txt&nbsp;&nbsp;--删除文件/user/a.txt<br/>
        hadoop fs -rmdir /user&nbsp;&nbsp;--删除空目录/user<br/>
        hadoop fs -rm -r /user&nbsp;&nbsp;--强制删除目录/user<br/>
    </p>
    <p><strong>使用java:</strong><br/></p>
    <p>FileSystem的delete()方法可以永久删除文件或目录，具体代码不再赘述</p>
</div>