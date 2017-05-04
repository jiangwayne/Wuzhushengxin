<div class="article-body">
    <p>hdfs即Hadoop Distributed Filesystem,是Hadoop抽象文件系统的其中一个实现。这里简单学习一下如何用命令与java接口操作hdfs。<br/>
        参考官方文档: <a href="http://hadoop.apache.org/docs/r2.8.0/hadoop-project-dist/hadoop-common/FileSystemShell.html">http://hadoop.apache.org/docs/r2.8.0/hadoop-project-dist/hadoop-common/FileSystemShell.html</a>
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
        creatDir("hdfs://localhost:9000/user2");
    }
    public static void creatDir(String strPath){
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
    <p>打成hdfs.jar, 上传到hadoop服务器上， 用命令：java -jar hdfs.jar 运行, 若出现no main manifest attribute。
        用命令：java -cp hdfs.jar Hdfs 或者 上传一个MANIFEST.MF文件指定Main-Class 再用：jar -uvfm hdfs.jar MANIFEST.MF
        来更新hdfs.jar,就可以用java -jar hdfs.jar了。
    </p>
    <p>http://localhost:50070/explorer.html或命令：hadoop fs -ls /可以查看hdfs系统的目录</p>

    <p>二.创建文件</p>
</div>