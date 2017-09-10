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
        3.叶结点的个数等于度为2(有两个儿子的结点)的结点的个数加1。(根据:总边数=不同类型的结点贡献的边数之和,很容易得出这个结论)<br/>
          设总结点数为n, 叶结点数为n0, 有1个儿子的结点数为n1, 有2个儿子的结点数为n2, 于是n=n0+n1+n2<br/>
          显然总边数为n-1,从上往下看，每个有2个儿子的结点都贡献了2条边，每个有1个儿子的结点都贡献了1条边，叶结点没有贡献边于是n-1=2*n2+n1<br/>
          所以n0=n2+1;

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
    <h5>五.链表实现</h5>
    <p>
        只有完全二叉树用数组来实现比较方便，按从上到下，从左到右的顺序存入数组，于是根据任意一个结点的位置都能找到其父结点，左儿子，右儿子的位置，但对于一般的二叉树就比较困难了，
        需用空节点补全成一棵完全二叉数，这又势必造成数组的空间浪费，所以通常链表来实现。
    </p>
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
public class MyTree {
    private TreeNode root;

    public MyTree(){
        root = null;
    }

    public boolean isEmpty(){
        return root == null;
    }

    //先序遍历(递归实现)
    public void preorderTraversal(TreeNode root){
        System.out.print(root.data);
        if(root.left != null){
            preorderTraversal(root.left);
        }
        if(root.right != null){
            preorderTraversal(root.right);
        }
    }

     //先序遍历(堆栈实现1)
    public void preorderTraversal(){
        MyArrayStack stack = new MyArrayStack(); //这里我们用到前面数组实现的堆栈,需要将Node换成TreeNode
        stack.push(root);
        while(true){
            TreeNode r = stack.pop();
            if(r == null){
                break;
            }
            System.out.print(r.data);
            if(r.right != null){     //这里要先把右子树压入堆栈
                stack.push(r.right);
            }
            if(r.left != null){
                stack.push(r.left);
            }
        }
    }
    //先序遍历(非递归实现2)
    public void preorderTraversal2(){
        MyChainedStack stack = new MyChainedStack();
        TreeNode r = root;
        while(true){
            if(r == null && stack.isEmpty()){
                break;
            }
            while(true){       //所有左子树入栈
                if(r == null){
                    break;
                }
                System.out.print(r.data);
                stack.push(r);
                r = r.left;
            }
            if(!stack.isEmpty()){    //弹出堆栈，并转向右子树，若右子树为空，下次循环中再次弹出堆栈的就是父结点，若右子树非空，下次循环中会先将右子树的所有左子树入栈....
                r = stack.pop();
                r = r.right;
            }
        }
    }

    //中序遍历(递归实现)
    public void inorderTraversal(TreeNode root){
        if(root.left != null){
            inorderTraversal(root.left);
        }
        System.out.print(root.data);
        if(root.right != null){
            norderTraversal(root.right);
        }
    }

    //中序遍历(非递归实现)
    public void inorderTraversal(){
        MyArrayStack stack = new MyArrayStack();
        TreeNode r = root;
        while(true){
            if(r == null && stack.isEmpty()){
                break;
            }
            while(true){       //所有左子树入栈
                if(r == null){
                    break;
                }
                stack.push(r);
                r = r.left;
            }
            if(!stack.isEmpty()){    //弹出堆栈，并转向右子树，若右子树为空，下次循环中再次弹出堆栈的就是父结点，若右子树非空，下次循环中会先将右子树的所有左子树入栈....
                r = stack.pop();
                System.out.print(r.data);
                r = r.right;
            }
        }
    }

    //后序遍历(递归实现)
    public void postorderTraversal(TreeNode root){
        if(root.left != null){
            postorderTraversal(root.left);
        }
        if(root.right != null){
            postorderTraversal(root.right);
        }
        System.out.print(root.data);
    }

    //后序遍历(非递归实现) 双栈法
    public void postorderTraversal(){
        MyArrayStack s1 = new MyArrayStack();
        MyArrayStack s2 = new MyArrayStack();
        s1.push(root);
        TreeNode curr = null;
        while(true){
            if(s1.isEmpty()){
                break;
            }
            curr = s1.pop();
            s2.push(curr);
            if(curr.left != null) {
                s1.push(curr.left);
            }
            if(curr.right != null){
                s1.push(curr.right);
            }
        }
        while (true){
            if(s2.isEmpty()){
                break;
            }
            System.out.print(s2.pop().data);
        }
    }

    //后序遍历(非递归实现2)
    public void postorderTraversal2(){
        MyArrayStack stack = new MyArrayStack();
        TreeNode pre = null, curr = null;
        stack.push(root);
        while(true){
            if(stack.isEmpty()){
                break;
            }
            curr = stack.top();
            if(pre == null || curr.equals(pre.left) || curr.equals(pre.right)){
                if(curr.left != null){
                    stack.push(curr.left);
                } else if(curr.right != null){
                    stack.push(curr.right);
                }
            }else if(curr.left == pre){
                if(curr.right != null){
                    stack.push(curr.right);
                }
            } else {
                System.out.print(curr.data);
                curr = stack.pop();
            }
            pre = curr;
        }
    }
}

class TreeNode {
    public String data;
    public TreeNode left;
    public TreeNode right;
}
                </code>
            </pre>
        </div>
        <div class="tab-pane fade" id="c++">
            学习中
        </div>
    </div>
</div>