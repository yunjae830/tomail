<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<style>
.itemBox {
    border:solid 1px black;
    width:400px;
    height:50px;
    padding:10px;
    margin-bottom:10px;
}
.itemBoxHighlight {
    border:solid 1px black;
    width:400px;
    height:50px;
    padding:10px;
    margin-bottom:10px;
    background-color:yellow;
}
.deleteBox {
    float:right;
    display:none;
    cursor:pointer;
}
</style>
<style>
#sortable { list-style-type: none; margin: 0; padding: 0; width: 400px; }
#sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
#sortable li span { position: absolute; margin-left: -1.3em; }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<script type="text/javascript">
//<![CDATA[
/** �������� ����Ѵ�. */
function submitItem() {
    if(!validateItem()) {
    	return;
    }
    alert("���");
}

/** ������ üũ */
function validateItem() {
    var items = $("input[type='text'][name='item']");
    if(items.length == 0) {
        alert("�ۼ��� �������� �����ϴ�.");
        return false;
    }

    var flag = true;
    for(var i = 0; i < items.length; i++) {
        if($(items.get(i)).val().trim() == "") {
            flag = false;
            alert("������ �Է����� ���� �׸��� �ֽ��ϴ�.");
            break;
        }
    }

    return flag;
}

/** UI ���� */
$(function() {
    $("#itemBoxWrap").sortable({
        placeholder:"itemBoxHighlight",
        start: function(event, ui) {
            ui.item.data('start_pos', ui.item.index());
        },
        stop: function(event, ui) {
            var spos = ui.item.data('start_pos');
            var epos = ui.item.index();
			      reorder();
        }
    });
    //$("#itemBoxWrap").disableSelection();
    
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
});

/** ������ ���� ���� */
function reorder() {
    $(".itemBox").each(function(i, box) {
        $(box).find(".itemNum").html(i + 1);
    });
}

/** ������ �߰� */
function createItem() {
    $(createBox())
    .appendTo("#itemBoxWrap")
    .hover(
        function() {
            $(this).css('backgroundColor', '#f9f9f5');
            $(this).find('.deleteBox').show();
        },
        function() {
            $(this).css('background', 'none');
            $(this).find('.deleteBox').hide();
        }
    )
		.append("<div class='deleteBox'>[����]</div>")
		.find(".deleteBox").click(function() {
        var valueCheck = false;
        $(this).parent().find('input').each(function() {
            if($(this).attr("name") != "type" && $(this).val() != '') {
                valueCheck = true;
            }
        });

        if(valueCheck) {
            var delCheck = confirm('�Է��Ͻ� ������ �ֽ��ϴ�.\n�����Ͻðڽ��ϱ�?');
        }
        if(!valueCheck || delCheck == true) {
            $(this).parent().remove();
            reorder();
        }
    });
    // ���ڸ� �ٽ� ���δ�.
    reorder();
}

/** ������ �ڽ� �ۼ� */
function createBox() {
    var contents = "<div class='itemBox'>"
                 + "<div style='float:left;'>"
                 + "<span class='itemNum'></span> "
                 + "<input type='text' name='item' style='width:300px;'/>"
                 + "</div>"
                 + "</div>";
    return contents;
}
//]]>
</script>
</head>
<body>

<div>
    <div style="float:left;width:100px;">������ �߰� : </div>
    <div style="clar:both;">
        <input type="button" id="addItem" value="�߰�" onclick="createItem();" />
        <input type="button" id="submitItem" value="����" onclick="submitItem();" />
    </div>
</div>
<br />
<div id="itemBoxWrap"></div>

<br />
<ul id="sortable">
  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
  <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
</ul>
</body>
</html>