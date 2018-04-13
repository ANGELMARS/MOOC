$(function () {
    $('#login').click(function () {
        var name_state = $('#name');
        var psd_state = $('#psd');
        var name = $('#name').val();
        var psd = $('#psd').val();
        if (name == '') {
            name_state.parent().next().next().css("display", "block");
            return false;
        } else if (psd == '') {
            name_state.parent().next().next().css("display", "none");
            psd_state.parent().next().next().css("display", "block");
            return false;
        } else {
            name_state.parent().next().next().css("display", "none");
            psd_state.parent().next().next().css("display", "none");
            $('.login').submit();
        }
    });
    $('#register').click(function () {
        var name_state = $('#name');
        var psd_state = $('#psd');
        var affirm_psd_state = $('#affirm_psd');
        var name = $('#name').val();
        var psd = $('#psd').val();
        var affirm_psd = $('#affirm_psd').val();
        if (name == '') {
            name_state.parent().next().next().css("display", "block");
            return false;
        } else if (psd == '') {
            psd_state.parent().next().next().css("display", "block");
            return false;
        } else if (affirm_psd == '') {
            affirm_psd_state.parent().next().next().css("display", "block");
            return false;
        } else if (psd != affirm_psd) {
            return false;
        }
        else {
            $('.register').submit();
        }
    })
})

function ok_or_errorBylogin(l) {
    var content = $(l).val();
    if (content != "") {
        $(l).parent().next().next().css("display", "none");
    }
}

function ok_or_errorByRegister(r) {
    var affirm_psd = $("#affirm_psd");
    var psd = $("#psd");
    var affirm_psd_v = $("#affirm_psd").val();
    var psd_v = $("#psd").val();
    var content = $(r).val();
    if (content == "") {
        $(r).parent().next().next().css("display", "block");
        return false;
    } else {
        $(r).parent().next().css("display", "block");
        $(r).parent().next().next().css("display", "none");
        if (psd_v == "") {
            $(psd).parent().next().css("display", "none");
            $(psd).parent().next().next().css("display", "none");
            $(psd).parent().next().next().css("display", "block");
            return false;
        }
        if (affirm_psd_v == "") {
            $(affirm_psd_v).parent().next().css("display", "none");
            $(affirm_psd_v).parent().next().next().css("display", "none");
            $(affirm_psd_v).parent().next().next().css("display", "block");
            return false;
        }
        if (psd_v == affirm_psd_v) {
            $(affirm_psd).parent().next().css("display", "none");
            $(affirm_psd).parent().next().next().css("display", "none");
            $(psd).parent().next().css("display", "none");
            $(psd).parent().next().next().css("display", "none");
            $(affirm_psd).parent().next().css("display", "block");
            $(psd).parent().next().css("display", "block");
        } else {
            $(affirm_psd).parent().next().css("display", "none");
            $(affirm_psd).parent().next().next().css("display", "none");
            $(psd).parent().next().css("display", "none");
            $(psd).parent().next().next().css("display", "none");
            $(psd).parent().next().css("display", "block");
            $(affirm_psd).parent().next().next().css("display", "block");
            return false;
        }
    }
}

function barter_btn(bb) {
    $(bb).parent().parent().fadeOut(1000);
    $(bb).parent().parent().siblings().fadeIn(2000);
}
