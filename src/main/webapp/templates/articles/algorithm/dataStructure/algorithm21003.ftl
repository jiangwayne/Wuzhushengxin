<div class="article-body">
    <p>队列(Queue)是一种先进先出(FIFO,first in first out)的线性结构。</p>
    <h5>一.队列的定义</h5>
    <p>它是一种限定只在一端进行插入,且只在另一端进行删除操作的线性表。<br/>
        插入数据被称为入队:put。<br/>
        删除数据被称为出队:take。<br/>
        先进先出:FIFO。
    </p>
    <h5>二.基本操作</h5>
    <p>
        堆栈的基本操作包括:<br/>
        1.Queue createQueue():创建一个空的队列<br/>
        2.boolean isEmpty():判断队列是否为空<br/>
        3.void put(Node node):把一个元素加入队列<br/>
        4.Node take():从队列中取出一个元素<br/>
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
public class MyArrayQueue {
    private Node[] array;
    private int front;  //队列最前面的位置
    private int rear;   //队列最后面的位置

    public MyArrayQueue() {    //createQueue()
        array = new Node[16];
        front = -1;
        rear = -1;
    }

    public boolean isEmpty(){
        return front == rear;
    }

    private boolean isFull(){
        return front == (rear + 1) % array.length;      //为了区分队列是空还是满, 让数组留空一个元素,这里当存够array.length-1个就认为满了
                                                        //这里也可以增加一个size字段来判断队列是否已满,让数组得已存满

    }

    public void put(Node node){
        if(node == null || isFull()){
            return;   //node为空或队列已满
        }
        rear = (rear + 1) % array.length;
        array[rear] = node;z
    }

    public Node take(){
        if(front == rear){
            return null;    //队列已空
        }

        front = (front + 1) % array.length;
        return array[front];
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
public class MyChainedQueue {
    private Node queue;  //用链表的第1个（逻辑位序),也就是queue.next做为front,想想为什么? 如果用第0个,take就不好处理了
    private Node rear;

    public MyChainedQueue(){
        queue = new Node();
        rear = null;
    }

    public boolean isEmpty(){
        return queue.next == null; //也就是front==null;
    }

    public void put(Node node){
        if(node == null || queue.next == null){
           queue.next = node;
           rear = node;
           return;
        }
        rear.next = node;
        rear = node;
    }

    public Node take(){
        if(queue.next == null){
            return null;    //队列已空
        }

        Node n = queue.next;
        queue.next = queue.next.next;
        n.next = null;
        return n;
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