<div class="article-body">
    <p>参考官方文档: <a target="_blank" href="http://hadoop.apache.org/docs/r2.8.0/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html">http://hadoop.apache.org/docs/r2.8.0/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html</a></p>
    <p>mapreduce是一种编程模型,在hadoop中开发mapreduce应用程来分析数据。这里做个简单的应用来统计本站每个ip的访问数。<br/>
        每个访问本站的请求，都会记一行日志<br/>
        日志格式为：time|cookieId|ip|......<br/>
        例如：2017-05-07 16:04:31.127|1feb48f2b6314138b4cc8cbdd4247122|140.205.201.43|......
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
            &nbsp;&nbsp;&lt;artifactId&gt;hadoop-mapreduce-client-core&lt;/artifactId&gt;<br/>
            &nbsp;&nbsp;&lt;version&gt;2.8.0&lt;/version&gt;<br/>
            &lt;/dependency&gt;
        </code>
    </p>
    <h5>一.将日志文件写入hdfs文件系统</h5>
    <blockquote>
        1.hadoop fs -mkdir /user2/ip/in<br/>
        2.hadoop fs -put log.txt /user2/ip/in/log.txt<br/>
    </blockquote>
    <h5>二.开发mapreduce程序</h5>
    <pre>
        <code class="java">
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import java.io.IOException;

public class IpCount {
    public static class IpMapper extends Mapper<Object, Text, Text, IntWritable>{
        private final static IntWritable one = new IntWritable(1);
        private Text ip = new Text();
        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
            String[] fields = value.toString().split("\\|"); //map输入的value是log.txt的每一行
            ip.set(fields[2]);
            context.write(ip,one); //map的输出结果将作为reduce的输入，该中间结果会存入本地文件，当reduce任务完成时会被删除
            //输出格式为: (140.205.201.43,[1,1,1....]),ip为key, value为ip出现的次数
        }
    }

    public static class IpReducer extends Reducer<Text,IntWritable,Text,IntWritable> {
        private IntWritable result = new IntWritable();
        public void reduce(Text key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException {
            int sum = 0;
            for (IntWritable val : values) {
                sum += val.get();
            }
            result.set(sum); //将map输出的value累加，便是ip出现的总次数
            context.write(key, result);//reduce的输出会存入hdfs文件系统
            //输出格式为: (140.205.201.43, 8)
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "ip count");
        job.setJarByClass(IpCount.class);

        job.setMapperClass(IpMapper.class);
        job.setReducerClass(IpReducer.class);

        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);

        FileInputFormat.addInputPath(job, new Path("hdfs://localhost:9000/user2/ip/in")); //指定输入目录
        FileOutputFormat.setOutputPath(job, new Path("hdfs://localhost:9000/user2/ip/out"));
        //如果out目录已存在，会出现org.apache.hadoop.mapred.FileAlreadyExistsException
        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}
        </code>
    </pre>
    <h5>三.运行mapreduce程序,并查看reduce输出目录中的结果</h5>
    <blockquote>
        1.hadoop jar IpCount.jar IpCount<br/>
        2.hadoop fs -cat /user2/ip/out/part-r-00000
    </blockquote>
</div>