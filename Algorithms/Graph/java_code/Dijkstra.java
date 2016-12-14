// 最短路的Dijkstra算法

// 这个算法用来解决无向图中任意两点的最短路径，同时输出路径(起点到所有点的)
public class MinPath {

    public static String dijkstra(int[][] W1, int start, int end) {

        System.out.println("起点:" + start + "终点:" + end);
        boolean[] isLabel = new boolean[W1[0].length];// 是否标号
        int[] indexs = new int[W1[0].length];// 所有标号的点的下标集合，以标号的先后顺序进行存储，实际上是一个以数组表示的栈
        int i_count = -1;// 栈的顶点
        int[] distance = W1[start].clone();// v0到各点的最短距离的初始值
        int index = start;// 从初始点开始
        int presentShortest = 0;// 当前临时最短距离
        indexs[++i_count] = index;// 把已经标号的下标存入下标集中
        isLabel[index] = true;
        while (i_count < W1[0].length) {
        // 第一步：得到与原点最近的某个点
            int min = Integer.MAX_VALUE;
            for (int i = 0; i < distance.length; i++) {
                if (!isLabel[i] && distance[i] != -1 && i != index) {
        // 如果到这个点有边,并且没有被标号
                    if (distance[i] < min) {
                        min = distance[i];
                        index = i;// 把下标改为当前下标
                    }
                }
            }
            i_count = i_count + 1;
            if (i_count == W1[0].length) {
                break;
            }
            isLabel[index] = true;// 对点进行标号
            indexs[i_count] = index;// 把已经标号的下标存入下标集中
            if (W1[indexs[i_count - 1]][index] == -1
                    || presentShortest + W1[indexs[i_count - 1]][index] > distance[index]) {
// 如果两个点没有直接相连，或者两个点的路径大于最短路径
                presentShortest = distance[index];
            } else {
                presentShortest += W1[indexs[i_count - 1]][index];
            }
          // 第二步：加入vi后，重新计算distance中的距离
            for (int i = 0; i < distance.length; i++) {
         // 如果vi到那个点有边，则v0到后面点的距离加
                if (distance[i] == -1 && W1[index][i] != -1) {// 如果以前不可达，则现在可达了
                    distance[i] = presentShortest + W1[index][i];
                } else if (W1[index][i] != -1 && presentShortest + W1[index][i] < distance[i]) {
         // 如果以前可达，但现在的路径比以前更短，则更换成更短的路径
                    distance[i] = presentShortest + W1[index][i];
                }
            }
        }
        getRoute(W1, indexs, end);
        return "最短距离是：" + (distance[end] - distance[start]);
    }

    public static void main(String[] args) {
// 建立一个权值矩阵
        int[][] W1 = { // 测试数据1
            {0, 1, 4, -1, -1, -1},
            {1, 0, 2, 7, 5, -1},
            {4, 2, 0, -1, 1, -1},
            {-1, 7, -1, 0, 3, 2},
            {-1, 5, 1, 3, 0, 6},
            {-1, -1, -1, 2, 6, 0}};
// System.out.println("f" + W1[0][4]);
        int[][] W = { // 测试数据2
            {0, 1, 3, 4},
            {1, 0, 2, -1},
            {3, 2, 0, 5},
            {4, -1, 5, 0}};
        System.out.println(dijkstra(W1, 5, 0)); // (int[][] W1, int start, int end)
    }

// indexs:1,0,2,4,3,5 放顶点的顺序
// end:最后要的顶点名称:5
// routeLength:长度:8
    /**
     * seven 输出路径(起点到所有点的)
     */
    public static String getRoute(int[][] WW, int[] indexs, int end) {
        String[] routeArray = new String[indexs.length];
        for (int i = 0; i < routeArray.length; i++) {
            routeArray[i] = "";
        }
//自己的路线
        routeArray[indexs[0]] = indexs[0] + "";
        for (int i = 1; i < indexs.length; i++) {
//看该点与前面所有点的连接线中的最短路径，然后得到该最短路径到底是连接了哪个点，进而此点的route就是找出那点的route+此点
            int[] thePointDis = WW[indexs[i]];
            int prePoint = 0;
            int tmp = 9999;
            for (int j = 0; j < thePointDis.length; j++) {
                boolean chooseFlag = false;
//边的距离最短，而且，所连的点在前面的点当中
                for (int m = 0; m < i; m++) {
                    if (j == indexs[m]) {
                        chooseFlag = true;
                    }
                }
                if (chooseFlag == false) {
                    continue;
                }
                if (thePointDis[j] < tmp && thePointDis[j] > 0) {
                    prePoint = j;
                    tmp = thePointDis[j];
                }
            }
            routeArray[indexs[i]] = routeArray[prePoint] + indexs[i];
        }
        for (int i = 0; i < routeArray.length; i++) {
            System.out.println(routeArray[i]);
        }
        return "";
    }
}



2.	最小生成树的Kruskal算法
/**
 *
 * @author Administrator
 */
public class MinTree {

    /**
     * @param args
     */
    private int[][] List_Graph;//图的邻接矩阵
    private int[] Label;
    private int[] Weight;
    private int[] Index_1;
    private int[] Index_2;
    private String Result;

    public Class_Kruskal()//使用构造函数进行初始化数据
    {
        List_Graph = new int[][]{{0, 1, 4, 5},
            {1, 0, 32768, 2},
            {4, 32768, 0, 3},
            {5, 2, 3, 0}
        };//初始化graphic中点和点的距离，32767表示距离无穷大
        //另外一个测试用例是
    /*
         {0,1,2,32767,32767},
         {1,0,2,4,3},
         {2,2,0,4,4},
         {32767,4,4,0,2},
         {32767,3,4,2,0}*/
        Label = new int[List_Graph.length];
        for (int i = 0; i < Label.length; i++)//初始化标记
        {
            Label[i] = i;
        }
        int j = (int) (Label.length + 1) * Label.length / 2;//这里应该是-1吧,完全图的边数
        Weight = new int[j];//用于存储待排序边的权值，数组长度m＝（n+1）*n*0.5,其中节点个数为n
        Index_1 = new int[j];//用于存储边的两个节点
        Index_2 = new int[j];

        Result = "最小生成树的边是：" + "\n";//记录最小生成树的边
    }

    public String Get_Result()//获得变量Result
    {
        return Result;
    }
    //把边按权排序,graphic是List_Graphic

    public int[] sort() {
        int[] a;
        int index = 0;
        for (int i = 0; i < Label.length; i++) {
            for (int j = i + 1; j < Label.length; j++) {
                if (List_Graph[i][j] < 32767) {
                    Weight[index] = List_Graph[i][j];
                    Index_1[index] = i;
                    Index_2[index] = j;
                    index = index + 1;
                }
            }
        }
        a = new int[index - 1];
        a = Address_Sort(Weight, Weight.length);
        return a;
    }

    public int[] Address_Sort(int[] a, int n)//地址排序
    {
        int[] Res = new int[n];
        for (int i = 0; i < n; i++) {
            Res[i] = i;
        }
        int t;
        int k;
        for (int j = 0; j < n - 1; j++) {
            for (int i = 0; i < n - j - 1; i++) {
                if (a[i] >= a[i + 1]) {//冒泡法
                    k = a[i];
                    a[i] = a[i + 1];
                    a[i + 1] = k;

                    t = Res[i];
                    Res[i] = Res[i + 1];
                    Res[i + 1] = t;
                }
            }
        }
        return Res;
    }

    public void Min_Tree()//求最小生成树
    {

        int[] tag = new int[Weight.length];
        tag = sort();
        int i = 0;
        while (!Judge(Label))//Judge函数判断标记是否都是0
        {
            if (Label[Index_1[tag[i]]] != Label[Index_2[tag[i]]]) {//两个点不同
                Result = Result + Index_1[tag[i]] + "---" + Index_2[tag[i]] + "\n";
                if (Label[Index_1[tag[i]]] < Label[Index_2[tag[i]]]) {
                    for (int k = 0; k < Label.length; k++) {
                        if (Label[k] == Label[Index_2[tag[i]]]) {
                            Label[k] = Label[Index_1[tag[i]]];
                        }
                    }
                } else {
                    for (int k = 0; k < Label.length; k++) {
                        if (Label[k] == Label[Index_1[tag[i]]]) {
                            Label[k] = Label[Index_2[tag[i]]];
                        }
                    }
                }
            } else {
                i = i + 1;
            }
        }

    }

    public boolean Judge(int[] a)//判断标记是否都是0
    {
        for (int i = 0; i < a.length; i++) {
            if (a[i] != 0) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) //主函数
    {
        Class_Kruskal CK = new Class_Kruskal();
        CK.Min_Tree();
        System.out.println(CK.Get_Result());

    }
}
