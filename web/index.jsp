<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/7/10
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <title>Title</title>
    <%-- 引入jquery--%>
    <script type="text/javascript" src="static/js/jquery3.4.1.min.js"></script>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--  引入js样式 --%>
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>

<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input checked type="radio" name="gender" id="gender1_add_input" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <%-- 部门提交--%>
                            <select class="form-control" name="dId" id="emp_add_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<%--员工修改的模态框--%>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input checked type="radio" name="gender" id="gender1_update_input" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <%-- 部门提交--%>
                            <select class="form-control" name="dId" id="emp_update_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<%--搭建显示页面--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">

        <div class="col-md-7 col-md-offset-4">
            <div class="col-md-5 col-md-offset-3">
            </div>
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">全部删除</button>
        </div>

    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emp_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">

        </div>
        <%--分页条信息--%>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
<script type="text/javascript">

    var totalRecord,currentPage;
    // 1、页面加载完成以后，直接去发送一个ajax请求，要到分页数据
    $(function () {
        // 去首页
        to_Page(1)
    });

    // 分页
    function to_Page(pn) {
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                // 1、解析并显示员工数据
                build_emp_table(result);
                // 2、解析并显示分页信息
                build_page_info(result)
                // 3、解析并显示分页条数据
                build_page_nav(result)
            }
        })
    }

    // 1、解析并显示员工数据
    function build_emp_table(result) {
        // 清空
        $("#emp_table tbody").empty()
        var emps = result.map.pageInfo.list;
        $.each(emps,function (index,item) {
            var checkBoxId = $("<td><input type='checkbox' class='check_item'/></td>")
            var empIdId = $("<td></td>").append(index+1);
            var empNameId = $("<td></td>").append(item.empName);
            var empIds = $("<input type='hidden' value='"+item.empId+"'/>").addClass("hidden_ids");
            var gender = item.gender=='M'?"男":"女"
            var genderId = $("<td></td>").append(gender);
            var emailId = $("<td></td>").append(item.email);
            var deptNameId = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            // 为编辑按钮添加一个自定义的属性，来表示当前id
            editBtn.attr("edit-id",item.empId);
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            // 为刹车农户按钮添加一个自定义的属性，来表示当前删除的id
            deleteBtn.attr("del-id",item.empId)
            var btnId = $("<td></td>").append(editBtn).append(" ").append(deleteBtn)
            // append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxId).append(empIdId).append(empNameId)
                .append(empIds).append(genderId)
                .append(emailId)
                .append(deptNameId)
                .append(btnId).appendTo("#emp_table tbody");
        })
    }

    // 解析显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty()
        $("#page_info_area").append("当前 "+result.map.pageInfo.pageNum+" 页，总 "+ result.map.pageInfo.pages+" 页，总 "+result.map.pageInfo.total+" 条记录")
        totalRecord = result.map.pageInfo.total;
        currentPage = result.map.pageInfo.pageNum;
    }

    // 解析分页条
    function build_page_nav(result) {
        $("#page_nav_area").empty()
        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var  firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var  prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));

        // 判断是否有上一页，没有则禁用
        if (result.map.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            // 点击首页来到第一页
            firstPageLi.click(function () {
                to_Page(1)
            })
            // 点击来到上一页
            prePageLi.click(function () {
                to_Page(result.map.pageInfo.pageNum-1)
            })
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        // 末页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        // 判断是否有下一页，没有则禁用
        if (result.map.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else {
            // 点击来到下一页
            nextPageLi.click(function () {
                to_Page(result.map.pageInfo.pageNum+1)
            })
            // 点击来到最后一页
            lastPageLi.click(function () {
                to_Page(result.map.pageInfo.pages)
            })
        }
        // 添加首页和前一页的提示
        ul.append(firstPageLi).append(prePageLi);
        // 页码号
        $.each(result.map.pageInfo.navigatepageNums,function (index,item) {
            var numLi =  $("<li></li>").append($("<a></a>").append(item));
            if (item == result.map.pageInfo.pageNum){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_Page(item)
            })
            // 添加页码号
            ul.append(numLi);
        })
        // 添加末页和后一页的提示
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    // 清空表单样式以及内容
    function reset_form(ele){
        $(ele)[0].reset();
        // 清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
}

    // 点击新增按钮 员工添加的模态框
    $("#emp_add_modal_btn").click(function () {
    // 清除表单数据(表单的数据和表单的样式)
    reset_form("#empAddModal form");
    // 发送ajax请求，查出部门信息，显示在下拉列表中
    getDepts("#emp_add_select")
    // 弹出模态框
    $("#empAddModal").modal({
        backdrop: "static"
    });
});

    // 查出所有的部门信息并显示在下拉列表中
    function getDepts(ele) {
    $.ajax({
        url:"${APP_PATH}/depts",
        type:"GET",
        success:function (result) {
            $(ele).empty()
            // 显示部门信息在下拉列表中
            $.each(result.map.depts,function () {
                var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId)
                optionEle.appendTo(ele)
            });
        }
    })
}

    // 校验表单数据
    function validate_form(name,email){
        // 使用正则表示，拿到要校验的数据
        var empName = $(name).val();
        var regName = /^[a-zA-Z0-9\u2E80-\u9FFF_-]{3,16}$/;
        if(!regName.test(empName)){
            //alert("用户名可以是3-16位数")
            show_validate_msg(name,"error","用户名可以是3-16位数的英文加中文")
            return false;
        }else {
            show_validate_msg(name,"success","")
        }

        var empEmail = $(email).val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(empEmail)){
            // 清空这个元素之前的样式
            show_validate_msg(email,"error","邮箱格式不正确")
            return false;
        }else {
            show_validate_msg(email,"success","")
        }
        return true;
    }

    // 判断邮箱是否合法
    $("#email_add_input").change(function () {
        validate_form(null,$(this))
    })
    $("#email_update_input").change(function () {
        validate_form(null,$(this))
    })

    // 显示校验结果的提示信息
    function show_validate_msg(ele,status,msg){
        // 清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success"==status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if ("error" == status) {
            $(ele).parent().addClass("has-error")
            $(ele).next("span").text(msg)
        }
    }

    // 校验用户名是否可用
    $("#empName_add_input").change(function () {
        // 发送ajax请求校验用户名是否可用
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkuser",
            data:"empName="+empName,
            typt:"POST",
            success:function (result) {
                if (result.code==100){
                    show_validate_msg("#empName_add_input","success","用户名可用")
                    $("#emp_save_btn").attr("ajax-va","success")
                } else{
                    show_validate_msg("#empName_add_input","error",result.map.va_msg)
                    $("#emp_save_btn").attr("ajax-va","error")
                }
            }
        })
    })

    // 点击保存员工
    $("#emp_save_btn").click(function () {
        // 模态框中填写的表单数据提交给服务器进行保存
        // 1.需要给提交到服务器的数据进行校验
        if(!validate_form("#empName_add_input","#email_add_input")){
            return false;
        };
        // 1、判断之前的ajax用户名校验是否成功，如果失败直接false
        if($(this).attr("ajax-va")=="error"){
            return false
        }
        // 2、发送ajax请求保存员工
        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function (result) {
                if(result.code == 100){
                    // 员工保存成功
                    // 1、关闭模态框
                    $("#empAddModal").modal('hide');
                    // 2、来到最后一页，显示刚才保存的数据
                    // 发送ajax请求显示最后一页
                    to_Page(totalRecord)
                }else{
                    // 显示失败信息
                    // 有那个字段的错误信息就显示那个字段的

                    if (undefined != result.map.errorFields.email){
                        // 显示邮箱的错误信息
                        show_validate_msg("#email_add_input","error",result.map.errorFields.email)
                    }
                    if (undefined != result.map.errorFields.empName) {
                        // 显示员工名字的错误信息
                        show_validate_msg("#empName_add_input","error",result.map.errorFields.empName)
                    }
                }
            }
        })
    });

    // 点击删除员工
    $(document).on("click",".delete_btn",function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("del-id");
        if (confirm("确认删除【"+empName+"】吗？")){
            // 确认，发送ajax请求
            $.ajax({
                url:"${APP_PATH}/emp/"+empId,
                type:"DELETE",
                success:function (result) {
                    to_Page(currentPage)
                }
            })
        }
    })

    // 点击修改员工
    // 注意：我们是按钮创建之前就绑定了click事件，所以绑定不上
    // 可以在创建按钮的时候绑定，绑定点击.live()
    // jquery新版没有live，使用on进行替代
    $(document).on("click",".edit_btn",function () {

        // 1、查出部门信息，并显示部门列表
        getDepts("#emp_update_select");
        // 2、查出员工信息，显示员工信息
        getEmp($(this).attr("edit-id"));
        // 3、把员工的id传递给模态框的更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"))

        $("#empUpdateModal").modal({
            backdrop: "static"
        });
    })

    // 更新时回显的数据
    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function (result) {
                var empData = result.map.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender])
                $("#emp_update_select").val([empData.dId])
            }
        })
    }

    // 更新员工
    $("#emp_update_btn").click(function () {
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            // 清空这个元素之前的样式
            show_validate_msg("#email_update_input","error","邮箱格式不正确")
            return false;
        }else {
            show_validate_msg("#email_update_input","success","")
        }

        // 发送ajax请求保存更新的员工
        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function (result) {
                $("#empUpdateModal").modal("hide");
                to_Page(currentPage)
            }
        })
    })

    // 完成全选/全不选
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"))
    })
    // 当不在当前页面全选框不被选中
    $(document).on("click",".pagination li a",function () {
        $("#check_all").prop("checked",false)
    })
    // 当复选框都被选中时全选框也被选中
    $(document).on("click",".check_item",function () {
        var flag = ($(".check_item:checked").length == $(".check_item").length)
        $("#check_all").prop("checked",flag)
    })

    // 点击全部删除，就批量删除
    $("#emp_delete_all_btn").click(function () {
        var empNames = "";
        var del_idstr = "";
        $.each($(".check_item:checked"),function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            // 组装员工id的字符串
            del_idstr += $(this).parents("tr").find(".hidden_ids").val()+"-"
        })
        // 去除名字多余的,
        empNames = empNames.substring(0,empNames.length-1)
        // 去除id多余的-
        del_idstr = del_idstr.substring(0,del_idstr.length-1)
        if (empNames.length>=1){
            if (confirm("确认删除【"+empNames+"】吗？")){
                // 发送ajax请求
                $.ajax({
                    url:"${APP_PATH}/emp/"+del_idstr,
                    type:"DELETE",
                    success:function (result) {
                        to_Page(currentPage)
                    }
                })
            }
        }else {
            alert("请勾选你要删除的员工");
        }
    })

</script>
</body>
</html>
