//作业点击 查看更多和精简
var end;
var oDiv = document.getElementById("layout");
var oText = oDiv.innerHTML;
function suolve(str) {
    var sub_length = 80;
    var temp1 = str.replace(/[^\x00-\xff]/g, "**");
    var temp2 = temp1.substring(0, sub_length);
    var x_length = temp2.split("\*").length - 1;
    var hanzi_num = x_length / 2;
    sub_length = sub_length - hanzi_num;
    var res = str.substring(0, sub_length - 5);
    if (sub_length < str.length) {
        end = res + "……………………";
    } else {
        end = res;
    }
    return end;
}
suolve(oText);
oDiv.innerHTML = end;
var oBtn = document.getElementById("more");
oBtn.onclick = function () {
    if (oBtn.innerHTML == "查看更多") {
        oDiv.innerHTML = oText;
        oBtn.innerHTML = "显示精简";
    } else if (oBtn.innerHTML == "显示精简") {
        oDiv.innerHTML = end;
        oBtn.innerHTML = "查看更多"
    }
}

