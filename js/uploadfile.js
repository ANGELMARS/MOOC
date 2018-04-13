/**
 * Created by ZYP on 2016/05/12/012.
 */

var count = 1;
//再次添加一个上传的图片
function addfile() {
    //添加一个<div>
    var divn = document.createElement("div");
    divn.setAttribute("id", "div" + (++count));

    //添加一个文本<div>文件</div>
    var fileiput = document.createElement("input");
    fileiput.setAttribute("type", "file");
    fileiput.setAttribute("name", "doc");
    divn.appendChild(fileiput);

    //添加链接<a href="javascript:delfile()">删除</a>
    var hrefa = document.createElement("a");
    hrefa.setAttribute("href", "javascript:delfile(" + count + ")");
    var hreftext = document.createTextNode("删除");
    hrefa.appendChild(hreftext);
    divn.appendChild(hrefa);

    //form中加入div
    var form1 = document.getElementById("f1");
    form1.appendChild(divn);
}
function delfile(x) {
    //得到form1
    var form1 = document.getElementById("f1");
    //得到div 从form中删除
    var divx = document.getElementById("div" + x);
    form1.removeChild(divx);
}