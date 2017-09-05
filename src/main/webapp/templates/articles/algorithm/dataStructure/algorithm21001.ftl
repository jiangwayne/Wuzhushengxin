<div class="article-body">
    <p>线性表(List)是最基本、最简单、也是最常用的一种数据结构</p>
    <h5>一.线性表的定义</h5>
    <p>一个线性表是n个具有相同特性的数据元素的有限序列。<br/>
        n定义为线性表的长度，n=0时称为空表。<br/>
        在非空表中每个数据元素都有一个确定的位置。<br/>
        相邻元素之间存在着序偶关系<br/>
        必存在唯一的一个“第一元素”,称为表头(按逻辑位序是第0个元素,按物理位序是第1个元素,下面的代码实
        现我是按逻辑位序,你也可以按物理位序实现)<br/>
        必存在唯一的一个 “最后元素” 称为表尾。<br/>
        除了表尾,每个元素都有唯一的后继,除了表头,每个元素都有唯一的前驱。
    </p>
    <h5>二.基本操作</h5>
    <p>
        线性表的基本操作包括:<br/>
        1.List makeList():创建一个空线性表<br/>
        2.Node find(int index):查找并返回元素,index为该元素在List中的位置<br/>
        3.int indexOf(Node node):返回一个元素的位置<br/>
        4.void insert(Node node, int index):在指定位置插入一个元素<br/>
        5.void delete(int index):删除指定位置的元素<br/>
        6.int length():返回List的长度<br/>
    </p>
    <h5>三.数组实现</h5>
    <ul id="myTab" class="nav nav-tabs">
        <li class="active">
            <a href="#java" data-toggle="tab">java</a>
        </li>
        <li><a href="#c++" data-toggle="tab">c++</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="java">
            <pre>
                <code class="java">
 public class MyArrayList {
    private Node[] array;
    private int length;

    public MyArrayList() {    //java中我们用构造函数代替makeList()
        array = new Node[16];
        length = 0;
    }

    public Node find(int index){
        if(index < 0 || index >= length){
            return null;   ////位置不合法
        }
        return array[index];
    }

    public int indexOf(Node node){
        if(node == null){
            return -1;   //node为null,不需要遍历全表
        }
        for(int i = 0; i < length; i++){
            if(array[i].equals(node)){  //这里不能用node.equals(array[i]),因为node可能是null
                return i;
            }
        }
        return -1;
    }

    public void insert(Node node, int index){
        if(node == null || length == array.length){
            return;    //node为空或表空间已满
        }
        if(index < 0 || index > length){  //当index=0时,就是在表头前插入,成为新的表头,index=length时,就是在表尾追加成为新的表尾
            return;     //位置不合法
        }
        for(int i = length - 1; i >= index; i--){
            array[i+1] = array[i]; //从最后一个元素开始到第index个（包括第index个）所有元素依次往后移一个位置
        }
        array[index] = node;
        length++;
        return;
    }

    public void delete(int index){
        if(index < 0 || index >= length){
            return;    //位置不合法
        }
        for(int i = index; i < length; i++){
            array[i] = array[i+1]; //从第index个到最后一个元素开始（包括第index个）所有元素依次往前移一个位置
        }
        length--;
    }

    public int length(){
        return length;
    }
}
                </code>
            </pre>
        </div>
        <div class="tab-pane fade" id="c++">
            学习中
        </div>
    </div>
    <h5>四.链表实现</h5>
    <ul id="myTab2" class="nav nav-tabs">
        <li class="active">
            <a href="#java2" data-toggle="tab">java</a>
        </li>
        <li><a href="#c++2" data-toggle="tab">c++</a></li>
    </ul>
    <div id="myTabContent2" class="tab-content">
        <div class="tab-pane fade in active" id="java2">
            <pre>
                <code class="java">
public class MyChainedList {
    private Node head;

    public MyChainedList(){
        head = null;
    }

    public Node find(int index){
        if(index < 0){
            return null;
        }
        int i = 0;
        Node n = head;
        while (i < index && n != null){
            n = n.next;
            i++;
        }
        return n;
    }

    public int indexOf(Node node){
        if(node == null || head == null){
            return -1;
        }
        int i= 0;
        Node n = head;
        while (n != null){
            if(n.equals(node)){
                break;
            }
            n = n.next;
            i++;
        }
        if(n == null) {
            return -1;
        }
        return i;
    }

    public void insert(Node node, int index){
        if(node == null){
            return;
        }
        if(index == 0 && node != null){     //在表头插入需要特殊处理
            if(head == null){
                head = node;
            } else {
                node.next = head.next;
                head = node;
            }
            return;
        }
        int i = 1;
        Node n = head;
        while (i < index && n != null){
            n = n.next;
            i++;
        }
        if(n == null){
            return;   //位置不合法
        }
        node.next = n.next;  //下面这两条语的顺序不能反了
        n.next = node;
        return;
    }

    public void delete(int index){
        if(index == 0){        //删除表头需要特殊处理
            head = head.next;
            return;
        }
        int i = 0;
        Node n = head;
        while (i < index - 1){
            n = n.next;
            i++;
        }
        n.next = n.next.next;
        return;
    }

    public int length(){
        int i = 0;
        Node n = head;
        while (n != null){
            n = n.next;
            i++;
        }
        return i;
    }
}

class Node {
    public Node next;

}
                </code>
            </pre>
        </div>
        <div class="tab-pane fade" id="c++2">
            学习中
        </div>
    </div>
</div>