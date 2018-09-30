/**
 * 
 */
$(document).ready(function(){
	$(cartTable).find(":checkbox").click(function() {
		//全选框单击
		if ($(this).hasClass("check-all")) {
			var checked = $(this).prop("checked");
			$(cartTable).find(".check-one").prop("checked", checked);
		}
		
		//如果手工一个一个的点选了所有勾选框，需要自动将“全选”勾上或是取消
		var items = cartTable.find("tr:gt(0)");
		$(cartTable).find(".check-all").prop("checked", items.find(":checkbox:checked").length == items.length);
		
		getTotal();
	});
	
	/*
     * 计算购物车中每一个产品行的金额小计
     *
     * 参数 row 购物车表格中的行元素tr
     *
     */
    function getSubTotal(row) {
	var price = parseFloat($(row).find("span:first").text()); //获取单价
        var qty = parseInt($(row).find(":text").val()); //获取数量
        var result = price * qty; //计算金额小计
        $(row).find(".subtotal").text(result.toFixed(2)); //将计算好的金额小计写入到“小计”栏位中
    };
	
	
});