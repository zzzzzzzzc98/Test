
var resultType = 2; //1:��Ʊ,2:�г�ʱ��
var searchType = 3; //1������������2��վ��������3��վվ����
var currentInput;
var speed = 300;
var TrainJson = "{\"Train\":[{Item:\"T1\"},{Item:\"D3\"},{Item:\"Z4\"},{Item:\"D98\"},{Item:\"C2001\"},{Item:\"Y563\"}]}";
var StationJson = "{\"Station\":[{Item:\"�人\"},{Item:\"������\"},{Item:\"�Ϻ�����\"},{Item:\"����\"},{Item:\"����\"},{Item:\"����\"}]}";

$(document).ready(function() {
    var lcTab = $("#tab_lieche");
    var hcpTab = $("#tab_hcp");
    var tbxStart = $("#start");
    var tbxEnd = $("#end");
    var tbxTrain = $("#train");
    var tbxStation = $("#station");
    var rdS2SSearch = $("#searchStation2Station");
    var rdTrainSearch = $("#searchTrain");
    var rdStationSearch = $("#searchStation");

    lcTab.click(function(e) { switchTab(2); });
    hcpTab.click(function(e) { switchTab(1); });

    rdTrainSearch.click(function(e) { switchSearchType(1); });
    rdStationSearch.click(function(e) { switchSearchType(2); });
    rdS2SSearch.click(function(e) { switchSearchType(3); });

    tbxStart.bind("focus", { iType: 1 }, fillAndShowSmartDiv);
    tbxStart.bind("blur", hideSmartDiv);
    tbxStart.bind("keyup", { iType: 1 }, inputKeyUp);
    //tbxStart.bind("keypress", { iType: 1 }, inputKeyUp);
    //tbxStart.bind("keydown", inputKeyDown);

    tbxEnd.bind("focus", { iType: 1 }, fillAndShowSmartDiv);
    tbxEnd.bind("blur", hideSmartDiv);
    tbxEnd.bind("keyup", { iType: 1 }, inputKeyUp);
    //tbxEnd.bind("keydown", inputKeyDown);

    tbxTrain.bind("focus", { iType: 2 }, fillAndShowSmartDiv);
    tbxTrain.bind("blur", hideSmartDiv);
    tbxTrain.bind("keyup", { iType: 2 }, inputKeyUp);
    //tbxTrain.bind("keydown", inputKeyDown);

    tbxStation.bind("focus", { iType: 1 }, fillAndShowSmartDiv);
    tbxStation.bind("blur", hideSmartDiv);
    tbxStation.bind("keyup", { iType: 1 }, inputKeyUp);
    //tbxStation.bind("keydown", inputKeyDown);

    $("#btnSearch").bind("click", btnSearchClick);
    $("#btnSearchFT").bind("click", btnSearchFTClick);
    $("#btnSearchCC").bind("click", btnSearchCCClick);
    $("#btnSearchCZ").bind("click", btnSearchCZClick);
    

    if (/chezhan/.exec(window.location.href)) {
        rdStationSearch.trigger("click");
    }
    else if (/checi/.exec(window.location.href)) {
        rdTrainSearch.trigger("click");
    }
    else {
        rdS2SSearch.trigger("click");
    }  
});

//�л��������
var switchTab = function(whichTab) {
    var lcTab = $("#tab_lieche");
    var hcpTab = $("#tab_hcp");
    var rdS2SSearch = $("#searchStation2Station");
    var lblStationSearch = $("#lblSearchStation");
    resultType = whichTab;
    if (whichTab == 1) {
        lcTab.removeClass("curtab");
        hcpTab.attr("class", "curtab");
        lblStationSearch.css("display", "none");
        rdS2SSearch.trigger("click");
    }
    else {
        lcTab.attr("class", "curtab");
        hcpTab.removeClass("curtab");
        lblStationSearch.css("display", "");
    }
}

//�л���������
var switchSearchType = function(sType) {
    searchType = sType;
    initSearchInput(sType);
    for (i = 1; i <= 3; i++) {
        if (i == sType) {
            $('#s_box' + i).css("display", "inline");
        }
        else {
            $('#s_box' + i).css("display", "none");
        }
    }
};

var initSearchInput = function(searchType) {
    var tbxStart = $("#start");
    var tbxEnd = $("#end");
    var tbxTrain = $("#train");
    var tbxStation = $("#station");
    if (searchType == 1) {
        tbxTrain.val(tbxTrain.val() == "" ? tbxTrain.attr("defaultvalue") : tbxTrain.val());
        tbxTrain.css("color", tbxTrain.val() == tbxTrain.attr("defaultvalue") ? "#ccc" : "#000");
    }
    if (searchType == 2) {
        tbxStation.val(tbxStation.val() == "" ? tbxStation.attr("defaultvalue") : tbxStation.val());
        tbxStation.css("color", tbxStation.val() == tbxStation.attr("defaultvalue") ? "#ccc" : "#000");
    }
    if (searchType == 3) {
        tbxStart.val(tbxStart.val() == "" ? tbxStart.attr("defaultvalue") : tbxStart.val());
        tbxEnd.val(tbxEnd.val() == "" ? tbxEnd.attr("defaultvalue") : tbxEnd.val());
        tbxStart.css("color", tbxStart.val() == tbxStart.attr("defaultvalue") ? "#ccc" : "#000");
        tbxEnd.css("color", tbxEnd.val() == tbxEnd.attr("defaultvalue") ? "#ccc" : "#000");
    }
}

//��䲢��ʾ������ʾ��iType=1 ��䳵վ��������䳵��
var fillAndShowSmartDiv = function(event) {
    currentInput = event.target;
    if ($(currentInput).val() == $(currentInput).attr("defaultvalue"))
       $(currentInput).val("");
    $(currentInput).css("color", "#000");
    if ($(currentInput).val() == "") {
        if (event.data.iType == 1)
            fillSmartDiv(eval('(' + StationJson + ')').Station);
        else
            fillSmartDiv(eval('(' + TrainJson + ')').Train);
    } else {
        if (event.data.iType == 1) {
            getStations(event);
        }
        else {
            getTrains(event);
        }
    }
    //setFirstColorOver();
    showSmartDiv(event);
}

var inputKeyUp = function(event) {
    var key = event.which;
    if (key != 40 && key != 38 && key != 13) {
        fillAndShowSmartDiv(event);
    } else {
        if (key == 40) {
            move(1);
        }
        if (key == 38) {
            move(-1);
        }
        if (key == 13) {
            if ($("#divSmartList").css("display") != "none") {
                selectColorOverItem();
                hideSmartDiv();
            }
            if (event.target.name == "start") {
                $("#end").focus();
            }
            else {
                //btnSearchClick();
            }
        }
    }
};

//var inputKeyDown = function(envent) {
//var key = event.which;
////var key = window.event ? event.keyCode : event.which;
//    if (key == 13) {
//        if ($("#divSmartList").css("display") != "none") {
//            selectColorOverItem();
//            hideSmartDiv();
//        }
//        else {
//            btnSearchClick();
//        }
//    }
//};

//��ȡվ��
var getStations = function(event) {
    var keyword = $.trim($(event.target).val());
    if (keyword != "") {
        $.ajax({
            url: '/ajax/Get.aspx',
            data: { action: "station", "num": 6, key: escape(keyword) },
            success: function(data) {
                fillSmartDiv(eval('(' + data + ')').Station);
            }
        });
    }
}

//��ȡ����
var getTrains = function(event) {
    var keyword = $.trim($(event.target).val());
    if (keyword != "") {
        $.ajax({
            url: '/get/ajax.aspx',
            data: { action: "train", "num": 6, key: escape(keyword) },
            success: function(data) {
                fillSmartDiv(eval('(' + data + ')').Train);
            }
        });
    }
}

var hideSmartDiv = function() {
    initSearchInput(searchType);
    $("#divSmartList").hide();
};

//json���ݹ���������ʾdiv
var fillSmartDiv = function(json) {
    var title = json.length > 0 ? "<div>���������ѡ��</div>" : "<div>û���ҵ�ƥ����</div>";
    $("#divSmartList").html(title);
    for (var i = 1; i <= json.length; i++) {
        var item = $("<span></span>");
        item.bind("mousedown", { arg: "#item" + i }, selectCurItem);
        item.bind("mouseover", { arg: "#item" + i }, setColorOver);
        item.bind("mouseout", { arg: "#item" + i }, setColorOut);
        item.html(json[i - 1].Item);
        item.attr("id", "item" + i);
        item.attr("title", json[i - 1].Item);
        if (i == 1)
            item.addClass("current");
        $("#divSmartList").append(item);
    }
};

var showSmartDiv = function(event) {
    var offset = $(event.target).offset();
    $("#divSmartList").css({ top: offset.top + 8 + $(event.target).height() + "px", left: offset.left });
    $("#divSmartList").css({ width: $(event.target).width() + 8 + "px" });
    $("#divSmartList").show(speed);
};

//ѡ�е�ǰ��
var selectCurItem = function(arg) {
    if ($(arg.data.arg).html())
        $(currentInput).val($(arg.data.arg).html());
};

//ѡ�������б�����ɫ��ʶ��Ԫ��
var selectColorOverItem = function() {
    if ($("#divSmartList span").size() > 0) {
        var obj = new Object();
        obj.data = new Object();
        obj.data.arg = "#" + $("#divSmartList span.current:eq(0)").attr("id");
        selectCurItem(obj);
    }
}

//��ɫ��ʶ��һ�������б��е�Ԫ��
var setFirstColorOver = function() {
    if ($("#divSmartList").find("span").length < 1) return;
    var obj = new Object();
    obj.data = new Object();
    if ($("#divSmartList span").size() > 0) {
        obj.data.arg = "#" + $("#divSmartList span:eq(0)").attr("id");
        setColorOver(obj);
    }
}

var setColorOver = function(arg) {
    $("#divSmartList span.current:eq(0)").removeClass();
    $(arg.data.arg).addClass("current");
    //alert("wait");
};

var setColorOut = function(arg) {
    $(arg.data.arg).removeClass();
}

var move = function(len) {
    if ($("#divSmartList").find("span").length < 1) return;
    var i = 0;
    var $item = $("#divSmartList span.current:eq(0)");
    var obj = new Object();
    obj.data = new Object();
    if ($("#divSmartList span").size() > 0) {
        if ($item.size() > 0) {
            $item.removeClass();
            if (len == 1 && $item.next("span")) {
                obj.data.arg = "#" + $item.next("span").attr("id");
            } else if (len == -1 && $item.prev("span")) {
                obj.data.arg = "#" + $item.prev("span").attr("id");
            }
        } else {
            obj.data.arg = "#" + $("#divSmartList span:eq(0)").attr("id");
        }
        setColorOver(obj);
        selectCurItem(obj);
    }
}
var btnSearchFTClick = function (event) {
    var start = $("#start").val().trim();
    var end = $("#end").val().trim();
    var url = "";
    url =  "/ShiKe/Search/?fromstation=" + escape(start) + "&tostation=" + escape(end); //encodeURI
    window.location.href = url;
}
var btnSearchCCClick = function (event) {
    var train = $("#train").val().trim();
    var url = "";
    url = "/ShiKe/Search/?checi=" + encodeURI(train);
    window.location.href = url;
}
var btnSearchCZClick = function (event) {
    var station = $("#station").val().trim();
    var url = "";
    url = "/ShiKe/Search/?station=" + escape(station);
    window.location.href = url;
}

var btnSearchClick = function (event) {
    if (checkSearchInput()) {
        var station = $("#station").val().trim();
        var train = $("#train").val().trim();
        var start = $("#start").val().trim();
        var end = $("#end").val().trim();
        var url = "";
        var baseLieCheUrl = "";
        //var baseLieCheUrl = "";
        var baseHCPUrl = "/";
        if (searchType == 1) {
            if (resultType == 2) {
               // alert(encodeURI(train));
                url = baseLieCheUrl + "/ShiKe/Search/?checi=" + encodeURI(train);
            }
            else {
                url = baseHCPUrl + encodeURI(train.replace("\/", "|")) + "/";
            }
        }
        if (searchType == 2) {
            url = baseLieCheUrl + "/ShiKe/Search/?station=" + escape(station);
            // alert(escape(station));
            //url = baseLieCheUrl + "/Module/skb/Search.aspx?station=" + escape(station);
        }
        if (searchType == 3) {
            if (resultType == 2) {
                url = baseLieCheUrl + "/ShiKe/Search/?fromstation=" + escape(start) + "&tostation=" + escape(end); //encodeURI
            }
            else {
                url = baseHCPUrl + encodeURI(start) + "_" + encodeURI(end) + "/";
            }
        }
        window.location.href = url;
    } else {
        return false;
    }
};

var checkSearchInput = function() {
    var station = $("#station").val().trim();
    var train = $("#train").val().trim();
    var start = $("#start").val().trim();
    var end = $("#end").val().trim();
    if (searchType == 1) if (train == "" || train == $("#train").attr("defaultvalue") || !isCheCi(train)) { alert("��������ȷ��ʽ���г�����!"); return false; }
    if (searchType == 2) if (station == "" || station == $("#station").attr("defaultvalue")) { alert("������վ������!"); return false; }
    if (searchType == 3) {
        if (start == "" || start == $("#start").attr("defaultvalue")) { alert("������������л�վ��!"); return false; }
        if (end == "" || end == $("#end").attr("defaultvalue")) { alert("������Ŀ�ĳ��л�վ��!"); return false; }
    }
    return true;
};

//�Ƿ�Ϊ����
var isCheCi = function(checi) {
    var patrn = /^\s*([a-zA-Z]+)?\d+([a-zA-Z])?(\/([a-zA-Z]+)?\d+([a-zA-Z])?)*\s*$/;
    if (!patrn.exec(checi)) return false;
    return true;
}

//ɾ���ַ������˵Ŀո�
String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}