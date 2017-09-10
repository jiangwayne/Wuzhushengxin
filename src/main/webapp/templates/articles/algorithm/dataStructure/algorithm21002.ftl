<div class="article-body">
    <p>堆栈(Stack)是一种后进先出(LIFO,last in first out)的线性结构, 在函数调用,递归,表达式求值等都会用到堆栈</p>
    <h5>一.堆栈的定义</h5>
    <p>它是一种限定在一端进行插入或删除操作的线性表。这一端被称为栈顶(top)。<br/>
        插入数据被称为入栈:push。<br/>
        删除数据被称为出栈:pop。<br/>
        后进先出:LIFO。
    </p>
    <h5>二.基本操作</h5>
    <p>
        堆栈的基本操作包括:<br/>
        1.Stack createStack():创建一个空的堆栈<br/>
        2.boolean isEmpty():判断堆栈是否为空<br/>
        3.void push(Node node):把一个元素推入堆栈<br/>
        4.Node pop():从堆栈中弹出一个元素<br/>
        5.Node top():返回栈顶的元素<br/>
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
public class MyArrayStack {
    private Node[] array;
    private int top;

    public MyArrayStack() {    //createStack()
        array = new Node[16];
        top = -1;
    }

    public boolean isEmpty(){
        return top == -1;
    }

    public void push(Node node){
        if(node == null || top == array.length -1){
            return;   //node为空或堆栈已满
        }
        array[++top] = node;
    }

    public Node pop(){
        if(top == -1){
            return null;    //堆栈已空
        }

        return array[top--];
    }

    public Node top(){
        if(top == -1){
            return null;    //堆栈已空
        }
        return array[top];
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
public class MyChainedStack {
    private Node stack;

    public MyChainedStack(){
        stack = new Node();    //用链表的第1个（逻辑位序),也就是stack.next做为top,想想为什么? 如果用第0个,pop就不好处理了
    }

    public boolean isEmpty(){
        return stack.next == null;
    }

    public void push(Node node){
        if(stack.next == null || node == null){
            stack.next = node;
            return;
        }
        node.next = stack.next;
        stack.next = node;
    }

    public Node pop(){
        if(stack.next == null){
            return null;    //堆栈已空
        }
        Node n = stack.next;
        stack.next = stack.next.next;
        n.next = null;
        return n;
    }

    public Node pop(){
        if(stack.next == null){
            return null;    //堆栈已空
        }
        Node n = stack.next;
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
    <h5>五.表达式求值</h5>
    <p>思路:将前缀表达式转化为后缀表达式(也叫逆波兰表达式) <br/>
        前缀表达式:1+5*(2+3)-6/2+1<br/>
        后缀表达式:1523+*+62/-1+<br/>
        这里做一个简单的实现(不考虑负数,小数,两位以上的数)来说明堆栈的作用
    </p>
    <ul id="myTab3" class="nav nav-tabs">
        <li class="active">
            <a href="#java3" data-toggle="tab">java</a>
        </li>
        <li><a href="#c++3" data-toggle="tab">c++</a></li>
    </ul>
    <div id="myTabContent3" class="tab-content">
        <div class="tab-pane fade in active" id="java2">
            <pre>
                <code class="java">
public class ExpressionCalculate {
    public static double calculate(String exp){
        double result = 0.00;
        try {
            String reversePolish = reversePolish(exp);
            MyChainedStack stack = new MyChainedStack();
            for(int i = 0; i < reversePolish.length(); i++){
                char c = reversePolish.charAt(i);
                if (c >= 48 && c <= 57){
                    Node n = new Node();
                    n.data = String.valueOf(c);
                    stack.push(n);
                } else{
                    double d1 = Double.parseDouble(stack.pop().data);
                    double d2 = Double.parseDouble(stack.pop().data);
                    Node n = new Node();
                    switch (c) {
                        case 42:   // *
                            result = d1 * d2;
                            break;
                        case 43:   // +
                            result = d1 + d2;
                            break;
                        case 45:   // -
                            result = d2 - d1;
                        break;
                        case 47:   // /
                            result = d2 / d1;
                        break;
                    }
                    n.data = String.format("%.2f",result);
                    result = 0.00;
                    stack.push(n);
                }
            }
            result = Double.parseDouble(stack.pop().data);
        }catch (Exception ex){
            return result;
        }

        return result;
    }

    private static int priority(char c){
        switch (c){
            case 40:          //堆栈中的左括号,优先级会变为最低
               return 0;
            case 42:          // *
            case 47:          // /
               return 2;
            case 43:          // +
            case 45:          // -
               return 1;
        }
        return 0;
    }

    //将前缀表达未转化为后缀表达式
    public static String reversePolish(String exp){
        try {
            MyChainedStack stack = new MyChainedStack();
            StringBuilder reversePolish = new StringBuilder();
            for(int i = 0; i < exp.length(); i++){
                char c = exp.charAt(i);
                if (c >= 48 && c <= 57){       //1.数字直接输出
                    reversePolish.append(c);
                } else{
                    switch (c){
                        case 42:   // *
                        case 43:   // +
                        case 45:   // -
                        case 47:   // /
                            while (true){      //4.栈顶为空,直接压入堆栈,结束
                                                   //  若优先级大于栈顶运算符,则压入堆栈,结束
                                                   //  若优先级小于等于栈顶运算符,将栈顶输出,再比较新的栈顶,重复上一步
                                Node top = stack.pop();
                                if(top == null){
                                    Node newTop = new Node();
                                    newTop.data = String.valueOf(c);
                                    stack.push(newTop);
                                    break;
                                }
                                if(priority(c) > priority(top.data.charAt(0))){
                                    stack.push(top);   //之前pop了一次,这里要重新push一次
                                    Node newTop = new Node();
                                    newTop.data = String.valueOf(c);
                                    stack.push(newTop);
                                    break;
                                }
                                reversePolish.append(top.data);
                            }
                            break;
                        case 40:   // (        2.压入推栈
                            Node n40 = new Node();
                            n40.data = String.valueOf(c);
                            stack.push(n40);
                            break;
                        case 41:   // )        3.将栈顶的运算符弹出并输出,直到遇到左括号(出栈,丢弃)
                            while (true){
                                Node n = stack.pop();
                                if(n == null || n.data.charAt(0) == 40){
                                    break;
                                } else {
                                    reversePolish.append(n.data);
                                }
                            }
                            break;
                    }
                }
            }

            while (true){               //5.将堆栈剩余运算符一并输出
                Node n = stack.pop();
                if(n == null){
                    break;
                }
                reversePolish.append(n.data);
            }
            return reversePolish.toString();
        } catch (Exception ex){
            return "";
        }
    }
}
class Node {
    public String data;
    public Node next;
}
                </code>
            </pre>
        </div>
        <div class="tab-pane fade" id="c++3">
            学习中
        </div>
    </div>
</div>