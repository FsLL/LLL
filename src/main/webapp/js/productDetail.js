$(function(){
    //给type绑定点击事件
    $(".type").click(function () {
        var index = $(".type").index(this);
        var obj = $(".type").eq(index);
        $(".type").removeClass("checked");
        obj.addClass("checked");
    });

    $(".color").click(function () {
        var index = $(".color").index(this);
        var obj = $(".color").eq(index);
        $(".color").removeClass("checked");
        obj.addClass("checked");
    });

    $(".n_btn_2").click(function(){
        var value = $("#quantity").val();
        value--;
        if(value == 0){
            value = 1;
        }
        $("#quantity").val(value);
    });
});

function sub(stock){
    var value = $("#quantity").val();
    value++;
    if(value > stock){
        value = stock;
    }
    $("#quantity").val(value);
}

function addCart(id,price){
    var quantity = $("#quantity").val();
    window.location.href="/product/addCart/"+id+"/"+price+"/"+quantity;
}