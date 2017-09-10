<div class="article-body">
    <p>树(Tree)是一种重要的数据结构。二叉树又是树中最基础最核心的结构。在文件管理,组织关系管理等都会用到树。</p>
    <h5>一.树的定义</h5>
    <p>树是一种由n个结点构成的有限集合。当n=0时,称为空树。<br/>
        对于非空树,树中有一个称为根(root)的特殊结点,其余的结点可分为m个互不相交的有限集,每个集合本身又是一棵树,
        称为原来树的子树。<br/>
        除了根结点外,每个结点有且仅有一个父结点<br/>
        两个结点之间的连接被称为边,除了根结点,每个结点都有住上的一条边, 所以一棵n个结点的树有n-1条边。显然树是一种保证所有结点
        都连通的最小连接方式<br/>
    </p>
    <h5>二.基本术语</h5>
    <p>
        树的一些基本术语:<br/>
        1.结点的度(degree):结点的子树个数<br/>
        2.树的度:树的所有结点中最大的度数<br/>
        3.叶结点(leaf):度为0结点,也就是没有子树的结点<br/>
        4.父结点(parent):有子树的结点A,是其子树的根结点的父结点<br/>
        5.子结点(child):有子树的结点A,其子树的根结点是A的子结点<br/>
        6.兄弟结点(sibling):有相同父结点的各结点彼此是兄弟结点<br/>
        7.路径和路径的长度:从一个结点到另一个结点所经过的结点序列称为路径,路径所包含的边数为路径的长度<br/>
        8.结点的层数:(level):根结点在1层,其它任一结点的层数是其父结的层数加1<br/>
        9.树的深度(depth):树中所有结点中的最大层数是这棵树的深度<br/>
    </p>
    <h5>三.二叉树的定义</h5>
    <p>
        二叉树(BinaryTree)是由根结点和其左子树与右子树的两个不不相交的二叉树组成。也就是每个结点最多只有两个子结点。
        几种特殊的二叉树:<br/>
        1.斜二叉树:每个结点都只有左子结点,或都只有右子结点,相当于一个链表<br/>
        2.完美二叉树(也叫满二叉树):除了叶结点,每个结点都有两个子结点,且所有叶结点都在同一层<br/>
        3.完全二叉树:叶节点只能出现在最下层和次下层，并且最下面一层的结点都集中在该层最左边的若干位置的二叉树。
        有n个结点的二叉数,对树中的结点按从上至下,从左到右的顺序进行编号（1到n）,编号为i的结点与满二叉树中编号为i的
        结点位置相同。也就是,要么是完美二叉树,要么允许完美二叉树丢失掉最右边的若干个叶节点。<br/>
        二叉树的几个重要性质:<br/>
        1.一个二叉树的第i层最多有2的(i-1)次方个结点。<br/>
        2.深度为k的二叉树最多有2的k次方-1个结点。<br/>
        3.叶结点的个数等于度为2(有两个儿子的结点)的非叶结点的个数加1。(根据:总边数=不同类型的结点贡献的边数之和,很容易得出这个结论)
    </p>
    <h5>四.基本操作</h5>
    <p>
        二叉树的基本操作包括:<br/>
        1.BinaryTree createBinaryTree(); 创建一个空二叉树<br/>
        2.boolean isEmpty();判断二叉树是否为空<br/>
        3.void preorderTraversal();先序遍历(根,左子树,右子树)<br/>
        4.void inorderTraversal();中序遍历(左子树,根,右子树)<br/>
        5.void postorderTraversal();后序遍历(左子树,右子树,根)<br/>
        6.void levelorderTraversal();层次遍历(1层,2层....n层)<br/>
    </p>
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

                </code>
            </pre>
        </div>
        <div class="tab-pane fade" id="c++2">
            学习中
        </div>
    </div>
</div>