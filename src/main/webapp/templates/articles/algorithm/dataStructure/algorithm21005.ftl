<div class="article-body">
    <h5>一.二叉搜索树(Binary Search Tree)的定义</h5>
    <p>二叉搜索树也称二叉排序树或二叉查找树，它是一棵二叉树，可以为空，如果不为空。满足以下性质：<br/>
        1.非空左子树的所有键值小于其根结点的键值。<br/>
        2.非空右子树的所有键值大于其根结点的键值。<br/>
        3.左，右子树都是二叉搜索树。
    </p>
    <h5>二.基本操作</h5>
    <p>
        二叉搜索树树的基本操作包括:<br/>
        1.TreeNode find(String key);根据键值查找元素<br/>
        2.TreeNode findMin();查找键值最小的元素<br/>
        3.TreeNode findMax();查找键值最大的元素<br/>
        4.void inser(TreeNode node);插入一个元素<br/>
        5.void delete(String key);根据键值删除一个元素<br/>
    </p>
    <h5>三.链表实现</h5>
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
public class MyBinarySearchTree {
    private TreeNode root;

    public MyBinarySearchTree(){
        root = null;
    }

    //查找(递归实现)
    public TreeNode find(String key, TreeNode r){
        if(r == null){
            return null;
        }
        if(r.data.compareTo(key) == 0){
            return r;
        }
        if(r.data.compareTo(key) > 0){
            return find(key, r.left);
        }
        if(r.data.compareTo(key) < 0){
            return find(key, r.right);
        }
    }

    //查找(非递归实现)
    public TreeNode find(String key){
        if(root == null){
            return null;
        }
        TreeNode r = root;
        while(true){
            if(r == null){
                break;
            }
            if(r.data.compareTo(key) == 0){
                return r;
            }
            if(r.data.compareTo(key) > 0){
                r = r.left;
            }
            if(r.data.compareTo(key) < 0){
                r = r.right;
            }
        }
        return r;
    }

    public TreeNode findMin(){
        TreeNode r = root;
        while(true){
            if(r.left == null){
                break;
            }
            r = r.left;
        }
        return r;
    }

    public TreeNode findMax(){
        TreeNode r = root;
        while(true){
            if(r.right == null){
                break;
            }
            r = r.right;
        }
        return r;
    }

    public void inser(TreeNode node){
        if(node == null){
            return;
        }
        if(root == null){
            root = node;
            return;
        }
        TreeNode r = root;
        TreeNode parent = r;     //找到要插入位置的父结点
        while(true){
            if(r == null){
                break;
            }
            if(r.data.compareTo(key) == 0){  //已存在相同的键
                return;
            }
            if(r.data.compareTo(node.data) > 0){
                r = r.left;
            }
            if(r.data.compareTo(node.data) < 0){
                r = r.right;
            }
            parent = r;
        }
        if(parent.data.compareTo(node.data) > 0){
            parent.left = node;
        } else {
            parent.right = node;
        }
        return;
    }

    public void delete(String key){
        if(root.left != null){
            inorderTraversal(root.left);
        }
        System.out.print(root.data);
        if(root.right != null){
            norderTraversal(root.right);
        }
    }

                </code>
            </pre>
        </div>
        <div class="tab-pane fade" id="c++">
            学习中
        </div>
    </div>
</div>