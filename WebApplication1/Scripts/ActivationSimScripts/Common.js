function GetQueryStringByParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function isEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    console.log(regex.test(email))
    return regex.test(email);
}

function isMobile(mobile) {
    var regex1 = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
    if (regex1.test(mobile)) { return true; }
    else { return false; }
}

function IsNumeric(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function GetCarrierColor(carrierName) {

    if (carrierName == 'Verizon') {
        return '#0a0a0a'; //black
    }
    if (carrierName == 'T-Mobile') {
        return '#fb3cce'; // pink
    }
    if (carrierName == 'Lyca Mobile') {
        return '#129723'; // green
    }
    if (carrierName == 'H2O Wireless') {
        return '#ffd800'; //yellow
    }
    if (carrierName == 'Rok Mobile') {
        return '#ff0000';//red
    }
    if (carrierName == 'Rok Mobile Verizon') {
        return '#ff0000';//red
    }
    if (carrierName == 'Rok Mobile ATT') {
        return '#0410fa'; // blue 
    }

    if (carrierName.indexOf('Profit') >= 0) {
        return '#ff6a00';
    }

    //return '#2118f2'; blue

    return randomColor();

}

var safeColors = ['00', '33', '66', '99', 'cc', 'ff'];
var randomColor = function () {
    var r = safeColors[rand()];
    var g = safeColors[rand()];
    var b = safeColors[rand()];
    return "#" + r + g + b;
}

var rand = function () {
    return Math.floor(Math.random() * 6);
};


function AppendLegendItem(color, description) {
    return '<li><span style="background-color:' + color + '"></span>' + description + '</li>'
}

function GetLegend(legendItems) {
    return '<ul class="pie-legend" style="list-style:none">' + legendItems + '</ul>'
}

function showSimDetails(param) {
    $.ajax({
        type: 'GET',
        url: '/Admin/Report/GetSimDetails',
        data: param,
        success: function (data) {
            $('#myModalLabel').text("SIM Details");
            $(".modal-body").empty();
            $(".modal-body").html(data);
            $('#myModal').modal('show');

            $('#table-simdetails').dataTable({
                searching: false,
                paging: false,
                bFilter: false,
                bInfo: false
            });
            $('#my-modal').scrollTop(0);
            $('#myModal .modal-dialog').css('width', '60%');
            $('#table-simdetails').css('width', '100%');
        }
    });

}

function showCompanyDetails(param) {
    $.ajax({
        type: 'GET',
        url: '/Admin/Report/GetCompanyDetails',
        data: param,
        success: function (data) {
            $('#myModalLabel').text("Company Details");
            $(".modal-body").empty();
            $(".modal-body").html(data);
            $('#myModal').modal('show');

            $('#table-companydetails').dataTable({
                searching: false,
                paging: false,
                bFilter: false,
                bInfo: false
            });
            $('#my-modal').scrollTop(0);
            $('#myModal .modal-dialog').css('width', '70%');
            $('#table-companydetails').css('width', '100%');
        }
    });

}

function showErrorAlertMessage(message, timeOut, container = '') {

    showAlertMessage(message, container, 'alert-danger', timeOut);
}

function showSuccessAlertMessage(message, timeOut, container = '') {

    showAlertMessage(message, container, 'alert-success', timeOut);
}

function showAlertMessage(message, container = '', alertType, timeOut = 3000) {

    if (container == undefined || container == '') {
        container = $('.message-alert-container');
    }

    container.html(`<div class="col-md-12 alert ` + alertType + ` text-center" id="dvMsg">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <span id="dvMsgbody"> ` + message + `</span>
    </div>`);

    setTimeout(function () {
        container.empty();
    }, timeOut);
}

function ExportToExcel(table) {
    table.buttons('.buttons-excel').trigger();
}

function CreateDataTable(tableId, sortColumn = 0, excelFileName = "ExcelFile") {

    return $(tableId).DataTable({

        searching: false,
        paging: false,
        bFilter: false,
        bInfo: false,
        "order": [[sortColumn, 'desc']],
        //  "columnDefs": [{
        //      "targets": 1,
        //      "orderable": false
        //}],
        buttons: [{

            extend: 'excelHtml5',
            footer: true,
            filename: excelFileName,

        }]
    });
}
