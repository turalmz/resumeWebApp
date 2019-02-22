
$( document ).ready(function() {
    $('#datetimepicker1').datetimepicker({
        format: 'DD/MM/YYYY',
    });

    $('#datetimepicker2').datetimepicker({
        format: 'DD/MM/YYYY',
    });
    $('#datetimepicker3').datetimepicker({
        format: 'DD/MM/YYYY',
    });
});



function clickme(i){
    $("#deleteId").val(i);
    $("#exampleModal").modal();
}

