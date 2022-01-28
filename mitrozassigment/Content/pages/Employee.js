$(document).ready(function () {
    getemployeedetails();
    getdepartmentlist();
    
});
var saveemployee = function () {
    var E_ID = $("#txtempid").val();
    var Name = $("#txtname").val();
    var Address = $("#txtaddress").val();
    var Mobile_No = $("#txtmobile").val();
    var Email = $("#txtemail").val();
    var DeptId = $("#ddldepatment").val();
    var model = {
        Name: Name, Address: Address, Mobile_No: Mobile_No, Email: Email, DeptId: DeptId, E_ID:E_ID
    };
    if (Name == "") {
        alert("Please enter Name");
    }
    else if (Address == "") {
        alert("Please enter  Address ");
    }
    else if (Mobile_No == "") {
        alert("Please enter  Mobile_No ");
    }
    else if (Mobile_No == "((\+*)((0[ -]+)*|(91 )*)(\d{12}+|\d{10}+))|\d{5}([- ]*)\d{6}") {
        alert("Please enter Valid Mobile No");
    }
    else if (Email == "") {
        alert("Please enter EmailID");
    }
    else if (Email == "/^[A-Za-z\d=#$%@_ -]+$/.test(value);") {
        alert("Please enter valid EmailID");
    }

    else if (DeptId == "") {
        alert("Please enter Department ");
    }
    $.ajax({
        url: "/Employee/SaveEmployee",
        method: "post",
        data: JSON.stringify(model),
        contentType: "application/json;charset=utf-8",
        datatype: "json",
        success: function (response) {
            $.alert({
                title: 'alert',
                content: "Submitted successfully",
                type: "blue"
            });
            getemployeedetails();
        }
    });
}
var getemployeedetails = function () {
    $.ajax({
        url: "/Employee/Getemployedetail",
        method: "post",
        //data: JSON.stringify(model),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (response) {
            var html = "";
            $("#TblEmployees tbody").empty();
            $.each(response.model, function (index, elementValue) {
                html += "<tr><td>" + elementValue.E_ID + "</td> <td>" + elementValue.Name + "</td> <td>" + elementValue.Address + "</td><td>" + elementValue.Mobile_No + "</td><td>" + elementValue.Email + "</td><td>" + elementValue.DEPT_NAME + "</td><td><input type = 'submit' value = 'Delete' onClick = 'DeleteEmp(" + elementValue.E_ID + ")'/></td><td> <input type = 'submit' value = 'Edit' onclick='EditEMP(" + elementValue.E_ID + ")' /></td></tr > ";
            });
            $("#TblEmployees").append(html);
            
        }
    })
}
var DeleteEmp = function (ID) {
    var model = { E_ID: ID };
    $.ajax({
    url: "/Employee/DeleteEmp",
    method: "post",
    data: JSON.stringify(model),
    contentType: "application/json;charset=utf-8",
    dataType: "json",
    async: false,
        success: function (response) {
            alert.response(Message),
                DeleteEmp();
            }     
    });
          
       
   


}
var EditEMP = function (id) {
    var model = { E_ID: id };
    $.ajax({

        url: "/Employee/EditEmp ",
        method: "post",
        data: JSON.stringify(model),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (response) {

            $("#txtempid").val(response.model.E_ID);
            $("#txtname").val(response.model.Name);
            $("#txtaddress").val(response.model.Address);
            $("#txtmobile").val(response.model.Mobile_No);
            $("#txtemail").val(response.model.Email);
            $("#ddldepatment").val(response.model.DeptId);
            alert(response.Message);
           
        }
    });
}
var getdepartmentlist = function () {
    $.ajax({
        url: "/Employee/getdepartment",
        method: "post",
        //data: JSON.stringify(model),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (response) {
            var html = "";
            $("#ddldepatment").empty();
            $.each(response.model, function (index, elementValue) {
                html += "<option value='" + elementValue.DeptId + "'>" + elementValue.DEPT_NAME + " </option>"
            });
            $("#ddldepatment").append(html);
        }
    })
}