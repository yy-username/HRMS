<%--
  Created by IntelliJ IDEA.
  User: 洋洋
  Date: 2020/2/20
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>Title</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <script type="text/javascript" src="../js/jquery-1.11.2.js"></script>
        <script type="text/javascript" src="../js/bootstrapValidator.js"></script>
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <style type="text/css">
            body{
                width: 1000px;
                height: 800px;
                padding: 20px;
                background-color: black;
                color: white
            }
            table{
                border-color: rgb(0,252,255)
            }
            tr{
                height: 30px;
                text-align: center;
            }
            td{
                width: 180px;
                text-align: center;
            }
            button{
                /*color: darkorange;*/
                background: url("../imag/peak-button.png");
                border: 0px;
            }
            button:hover{
                color: darkorange;
                background: url("../imag/peak-button-active.png");
                border: 0px;
            }
        </style>
        <script type="text/javascript">
            $(function () {
                /*·····试题信息··········*/
                /* 添加试题 */
                $("#testAddBtn").click(function () {
                    if (confirm("确定保存该条信息吗？")) {
                        $.ajax({
                            url : "saveTest",
                            type : "post",
                            dataType : "json",
                            data : {
                                testID : $("input[name=testID]").val(),
                                testType : $("input[name=testType]").val(),
                                testTitle: $("input[name=testTitle]").val(),
                                testAnswer: $("input[name=testAnswer]").val(),
                                standardAnswer: $("input[name=testAnswer]").val()
                            },
                            success : function (data) {
                                if (data != null) {
                                    var tr = "<tr>"+
                                        "<td>"+data.testId+"</td>"+
                                        "<td>"+data.testType+"</td>"+
                                        "<td>"+data.testTitle+"</td>"+
                                        "<td>"+data.testAddTime+"</td>"+
                                        "<td>"+
                                        "<input type='hidden' name='hidden' value='data.testId'/>"+
                                        "<button type='button' class='check' data-toggle='modal' data-target='.bs-example-modal-lg-check'>查看</button>"+
                                        "<button type='button' class='modify' data-toggle='modal' data-target='.bs-example-modal-lg1'>修改</button>"+
                                        "<input type='button' class='delete' name='de1' id='de1' value='删除'/>"+
                                        "</td>"+
                                        "</tr>";
                                    $("#testTable").append(tr);
                                }
                            }
                        });
                    }
                });

                /* 修改试题 */
                $("#testTable").on("click", ".modify", function () {
                    var d=$(this);
                    $.ajax({
                        url : "checkTest",
                        type : "post",
                        dataType : "json",
                        data : {
                            testId : d.parent().children().eq(0).val()
                        },
                        success : function (data) {
                            $("input[name=TestIDM]").val(data.testId);
                            $("input[name=TestTypaM]").val(data.testType);
                            $("input[name=TestTitleM]").val(data.testTitle);
                            $("input[name=TestAnswerM]").val(data.testAnswer);
                            $("input[name=StanAswerM]").val(data.testStandardAnswer);
                            $("input[name=TestCreatTimeM]").val(data.testAddTime);
                        }
                    });
                })
                $("#save").click(function () {
                    if (confirm("请确定是否保存？")) {
                        $.ajax({
                            url : "modifytest.action",
                            type : "post",
                            dataType : "text",
                            data : {
                                testId : $("input[name=TestIDM]").val(),
                                testType : $("input[name=TestTypaM]").val(),
                                testTitle : $("input[name=TestTitleM]").val(),
                                testAnswer : $("input[name=TestAnswerM]").val(),
                                testStandardAnswer : $("input[name=StanAswerM]").val(),
                            },
                            success : function (data) {
                                if (data == "true") {
                                    alert("修改成功，请刷新页面查看");
                                }else {
                                    alert("修改失败");
                                }
                            }
                        });
                    }
                })

                /* 删除试题*/
                $("#testTable").on("click", ".delete", function () {
                    if (confirm("确定删除该条记录吗？")) {
                        var de = $(this)
                        $.ajax({
                            url : "deleteTest",
                            type : "post",
                            dataType : "text",
                            data : {
                                testId : de.parent().children().eq(0).val(),

                            },
                            success : function (data) {
                                if (data == "true") {
                                    de.parent().parent().remove();
                                }else {
                                    alert("删除失败！！")
                                }
                            }
                        });
                    }
                })

                /* 查看试题 */
                $("#testTable").on("click", ".check", function () {
                    var d=$(this);
                    $.ajax({
                        url : "checkTest",
                        type : "post",
                        dataType : "json",
                        data : {
                            testId : d.parent().children().eq(0).val()
                        },
                        success : function (data) {
                            $("input[name=TestID]").val(data.testId);
                            $("input[name=TestTypa]").val(data.testType);
                            $("input[name=TestTitle]").val(data.testTitle);
                            $("input[name=TestAnswer]").val(data.testAnswer);
                            $("input[name=StanAswer]").val(data.testStandardAnswer);
                            $("input[name=TestCreatTime]").val(data.testAddTime);
                        }
                    });
                })

                /*···············场次信息··········*/
                /* 添加场次 */
                $("#sessionAddBtn").click(function () {
                    if (confirm("确定保存该条信息吗？")) {
                        $.ajax({
                            url : "saveSession",
                            type : "post",
                            dataType : "json",
                            data : {
                                sessionId : $("input[name=sessionID]").val(),
                                sessionNum : $("input[name=sessionNum]").val(),
                                sessionStartTime: $("input[name=sessionStartTime]").val(),
                                sessionEndTime: $("input[name=sessionEndTime]").val(),
                            },
                            success : function (data) {
                                if (data != null) {
                                    var tr = "<tr>"+
                                        "<td>"+data.sessionId+"</td>"+
                                        "<td>"+data.sessionNum+"</td>"+
                                        "<td>"+data.sessionStartTime+"</td>"+
                                        "<td>"+data.sessionEndTime+"</td>"+
                                        "<td>"+
                                        "<input type='hidden' name='hidden' value='data.sessionId'/>"+
                                        "<button type='button' class='check' data-toggle='modal' data-target='.bs-example-modal-lg-session-check'>查看</button>"+
                                        "<button type='button' class='modify' data-toggle='modal' data-target='.bs-example-modal-lg-session-test'>修改</button>"+
                                        "<input type='button' class='delete' name='de1' value='删除'/>"+
                                        "</td>"+
                                        "</tr>";
                                    $("#sessionTable").append(tr);
                                }
                            }
                        });
                    }
                });

                /* 修改场次 */
                $("#sessionTable").on("click", ".modify", function () {
                    var d=$(this);
                    $.ajax({
                        url : "checkTest",
                        type : "post",
                        dataType : "json",
                        data : {
                            testId : d.parent().children().eq(0).val()
                        },
                        success : function (data) {
                            $("input[name=SessionIDM]").val(data.sessionId);
                            $("input[name=SessionNumM]").val(data.sessionNum);
                            $("input[name=SessionStartTimeM]").val(data.sessionStartTime);
                            $("input[name=SessionEndTimeM]").val(data.sessionEndTime);
                            $("input[name=SessionFinishM]").val(data.sessionFinish);
                            $("input[name=sessionCreatTimeM]").val(data.sessionCreatTime);
                        }
                    });
                })
                $("#saveSession").click(function () {
                    if (confirm("请确定是否保存？")) {
                        $.ajax({
                            url : "modifytest.action",
                            type : "post",
                            dataType : "text",
                            data : {
                                sessionId : $("input[name=SessionIDM]").val(),
                                sessionNum : $("input[name=SessionNumM]").val(),
                                sessionStartTime : $("input[name=SessionStartTimeM]").val(),
                                sessionEndTime : $("input[name=SessionEndTimeM]").val(),
                                sessionFinish : $("input[name=SessionFinishM]").val(),
                                sessionCreatTime: $("input[name=sessionCreatTimeM]").val()
                            },
                            success : function (data) {
                                if (data == "true") {
                                    alert("修改成功，请刷新页面查看");
                                }else {
                                    alert("修改失败");
                                }
                            }
                        });
                    }
                })

                /* 删除场次*/
                $("#sessionTable").on("click", ".delete", function () {
                    if (confirm("确定删除该条记录吗？")) {
                        var de = $(this)
                        $.ajax({
                            url : "deleteTest",
                            type : "post",
                            dataType : "text",
                            data : {
                                testId : de.parent().children().eq(0).val(),

                            },
                            success : function (data) {
                                if (data == "true") {
                                    de.parent().parent().remove();
                                }else {
                                    alert("删除失败！！")
                                }
                            }
                        });
                    }
                })

                /* 查看场次 */
                $("#sessionTable").on("click", ".check", function () {
                    var d=$(this);
                    $.ajax({
                        url : "checkTest",
                        type : "post",
                        dataType : "json",
                        data : {
                            testId : d.parent().children().eq(0).val()
                        },
                        success : function (data) {
                            $("input[name=TestID]").val(data.testId);
                            $("input[name=TestTypa]").val(data.testType);
                            $("input[name=TestTitle]").val(data.testTitle);
                            $("input[name=TestAnswer]").val(data.testAnswer);
                            $("input[name=StanAswer]").val(data.testStandardAnswer);
                            $("input[name=TestCreatTime]").val(data.testAddTime);
                        }
                    });
                })

                /*········用户信息········*/
                /* 添加用户 */
                $("#testAddBtn").click(function () {
                    if (confirm("确定保存该条信息吗？")) {
                        $.ajax({
                            url : "saveTest",
                            type : "post",
                            dataType : "json",
                            data : {
                                testID : $("input[name=testID]").val(),
                                testType : $("input[name=testType]").val(),
                                testTitle: $("input[name=testTitle]").val(),
                                testAnswer: $("input[name=testAnswer]").val(),
                                standardAnswer: $("input[name=testAnswer]").val()
                            },
                            success : function (data) {
                                if (data != null) {
                                    var tr = "<tr>"+
                                        "<td>"+data.testId+"</td>"+
                                        "<td>"+data.testType+"</td>"+
                                        "<td>"+data.testTitle+"</td>"+
                                        "<td>"+data.testAddTime+"</td>"+
                                        "<td>"+
                                        "<input type='hidden' name='hidden' value='data.testId'/>"+
                                        "<button type='button' class='check' data-toggle='modal' data-target='.bs-example-modal-lg-check'>查看</button>"+
                                        "<button type='button' class='modify' data-toggle='modal' data-target='.bs-example-modal-lg1'>修改</button>"+
                                        "<input type='button' class='delete' name='de1' id='de1' value='删除'/>"+
                                        "</td>"+
                                        "</tr>";
                                    $("#testTable").append(tr);
                                }
                            }
                        });
                    }
                });

                /* 修改用户 */
                $("#testTable").on("click", ".modify", function () {
                    var d=$(this);
                    $.ajax({
                        url : "checkTest",
                        type : "post",
                        dataType : "json",
                        data : {
                            testId : d.parent().children().eq(0).val()
                        },
                        success : function (data) {
                            $("input[name=TestIDM]").val(data.testId);
                            $("input[name=TestTypaM]").val(data.testType);
                            $("input[name=TestTitleM]").val(data.testTitle);
                            $("input[name=TestAnswerM]").val(data.testAnswer);
                            $("input[name=StanAswerM]").val(data.testStandardAnswer);
                            $("input[name=TestCreatTimeM]").val(data.testAddTime);
                        }
                    });
                })
                $("#save").click(function () {
                    if (confirm("请确定是否保存？")) {
                        $.ajax({
                            url : "modifytest.action",
                            type : "post",
                            dataType : "text",
                            data : {
                                testId : $("input[name=TestIDM]").val(),
                                testType : $("input[name=TestTypaM]").val(),
                                testTitle : $("input[name=TestTitleM]").val(),
                                testAnswer : $("input[name=TestAnswerM]").val(),
                                testStandardAnswer : $("input[name=StanAswerM]").val(),
                            },
                            success : function (data) {
                                if (data == "true") {
                                    alert("修改成功，请刷新页面查看");
                                }else {
                                    alert("修改失败");
                                }
                            }
                        });
                    }
                })

                /* 删除用户*/
                $("#testTable").on("click", ".delete", function () {
                    if (confirm("确定删除该条记录吗？")) {
                        var de = $(this)
                        $.ajax({
                            url : "deleteTest",
                            type : "post",
                            dataType : "text",
                            data : {
                                testId : de.parent().children().eq(0).val(),

                            },
                            success : function (data) {
                                if (data == "true") {
                                    de.parent().parent().remove();
                                }else {
                                    alert("删除失败！！")
                                }
                            }
                        });
                    }
                })

                /* 查看用户 */
                $("#testTable").on("click", ".check", function () {
                    var d=$(this);
                    $.ajax({
                        url : "checkTest",
                        type : "post",
                        dataType : "json",
                        data : {
                            testId : d.parent().children().eq(0).val()
                        },
                        success : function (data) {
                            $("input[name=TestID]").val(data.testId);
                            $("input[name=TestTypa]").val(data.testType);
                            $("input[name=TestTitle]").val(data.testTitle);
                            $("input[name=TestAnswer]").val(data.testAnswer);
                            $("input[name=StanAswer]").val(data.testStandardAnswer);
                            $("input[name=TestCreatTime]").val(data.testAddTime);
                        }
                    });
                })


                /*············成绩信息········*/
                /* 删除成绩*/
                $("#testTable").on("click", ".delete", function () {
                    if (confirm("确定删除该条记录吗？")) {
                        var de = $(this)
                        $.ajax({
                            url : "deleteTest",
                            type : "post",
                            dataType : "text",
                            data : {
                                testId : de.parent().children().eq(0).val(),

                            },
                            success : function (data) {
                                if (data == "true") {
                                    de.parent().parent().remove();
                                }else {
                                    alert("删除失败！！")
                                }
                            }
                        });
                    }
                })

                /* 查看成绩 */
                $("#testTable").on("click", ".check", function () {
                    var d=$(this);
                    $.ajax({
                        url : "checkTest",
                        type : "post",
                        dataType : "json",
                        data : {
                            testId : d.parent().children().eq(0).val()
                        },
                        success : function (data) {
                            $("input[name=TestID]").val(data.testId);
                            $("input[name=TestTypa]").val(data.testType);
                            $("input[name=TestTitle]").val(data.testTitle);
                            $("input[name=TestAnswer]").val(data.testAnswer);
                            $("input[name=StanAswer]").val(data.testStandardAnswer);
                            $("input[name=TestCreatTime]").val(data.testAddTime);
                        }
                    });
                })

            })
        </script>
    </head>
    <body style="width: 1000px; height: 700px;">
        <%--存放用户信息--%>
        <div style="margin-top: 10px; margin-left: 800px; color: white">
            <div>
                <span>
                    <span id="font">
                        <a>${userInfo.userId}</a>
                        <a href="exit">退出</a>
                    </span>
                </span>
            </div>
        </div>

        <%--导航栏--%>
        <ul id="myTab" class="nav nav-tabs" style="color: white">
            <li role="presentation" class="col-md-3 active"><a href="#tiku" data-toggle="tab">试题库</a></li>
            <li role="presentation" class="col-md-3"><a href="#changci" data-toggle="tab">考试场次</a></li>
            <li role="presentation" class="col-md-3"><a href="#yonghu" data-toggle="tab">用户</a></li>
            <li role="presentation" class="col-md-3"><a href="#chengji" data-toggle="tab">成绩</a></li>
        </ul>
        <div id="myTabContent" class="tab-content" style="margin: 50px 30px">
            <div class="tab-pane fade in active" id="tiku">

                <div id="testDetail">
                    <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg-test">添加试题</button>--%>

                    <div class="modal fade bs-example-modal-lg-test" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog" role="document" style="position:absolute;left: 30px">
                            <div class="modal-content"><br/>
                                <p>试题编号：<input type="text" name="testID"/></p>
                                <p>试题类型：<input type="text" name="testType"/></p>
                                <p>试题题目：<input type="text" name="testTitle"/></p>
                                <p>试题答案：<input type="text" name="testAnswer"/></p>
                                <p>标准答案：<input type="text" name="standardAnswer"/></p>
                                <p>
                                    <input type="button" class="btn btn-default" id="testAddBtn" data-dismiss="modal" value="保存"/>
                                    <input type="reset" class="btn btn-default" data-dismiss="modal" value="关闭"/>
                                </p>
                            </div>
                        </div>
                    </div>

                    <table border="1" cellspacing="0" id="testTable" style="border-color: rgb(0 252 255)">
                        <tr>
                            <td>试题编号</td>
                            <td>试题类型</td>
                            <td>试题题目</td>
                            <td>创建时间</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${allTest}" var="test1">
                            <tr>
                                <td>${test1.testId}</td>
                                <td>${test1.testType}</td>
                                <td>${test1.testTitle}</td>
                                <td>${test1.testAddTime}</td>
                                <td>
                                    <input type="hidden" name="hidden" value="${test1.testId}"/>
                                    <button type="button" class="check" data-toggle="modal" data-target=".bs-example-modal-lg-test-check">查看</button>
                                    <button type="button" class="modify" data-toggle="modal" data-target=".bs-example-modal-lg-test-update">修改</button>
                                    <input type="button" class="delete" name="de1" id="de1" value="删除"/>
                                </td>
                            </tr>
                        </c:forEach>
                        <div class="modal fade bs-example-modal-lg-test-update" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content"><br>
                                    <p>试题编号：<input id="TestIDM" name="TestIDM" readonly="readonly" disabled="disabled"/></p>
                                    <p>试题类型：<input id="TestTypaM"  type="text" name="TestTypaM" /></p>
                                    <p>试题题目：<input id="TestTitleM" type="text" name="TestTitleM" /></p>
                                    <p>试题答案：<input id="TestAnswerM" type="text" name="TestAnswerM" /></p>
                                    <p>标准答案：<input id="StanAswerM" type="text" name="StanAswerM" /></p>
                                    <p>创建时间：<input id="TestCreatTimeM" type="text" name="TestCreatTimeM" readonly="readonly" disabled="disabled"/></p>
                                    <button  id="save" class="btn btn-default" data-dismiss="modal">保存</button>
                                    <button id="close" name="close" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <br>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade bs-example-modal-lg-test-check" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content"><br>

                                    <p>试题编号：<input id="TestID" name="TestID" readonly="readonly" disabled="disabled"/></p>
                                    <p>试题类型：<input id="TestTypa"  type="text" name="TestTypa" readonly="readonly" disabled="disabled" /></p>
                                    <p>试题题目：<input id="TestTitle" type="text" name="TestTitle" readonly="readonly" disabled="disabled"/></p>
                                    <p>试题答案：<input id="TestAnswer" type="text" name="TestAnswer" readonly="readonly" disabled="disabled"/></p>
                                    <p>标准答案：<input id="StanAswer" type="text" name="StanAswer" readonly="readonly" disabled="disabled"/></p>
                                    <p>创建时间：<input id="TestCreatTime" type="text" name="TestCreatTime" readonly="readonly" disabled="disabled"/></p>
                                    <button id="TestClose" name="close" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </table>
                    <div>
                        <button style="margin-left: 600px" type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg-test">添加试题</button>
                        <h4>备注：题库详情表</h4>
                    </div>
                </div>

            </div>
            <div class="tab-pane fade" id="changci">
                <p>考试场次</p>
                <div id="sessionDetail">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg-session">添加场次</button>

                    <div class="modal fade bs-example-modal-lg-session" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content"><br/>
                                <p>场次编号：<input type="text" name="sessionID"/></p>
                                <p>考生考号：<input type="text" name="sessionNum"/></p>
                                <p>开始时间：<input type="text" name="sessionStartTime"/></p>
                                <p>结束时间：<input type="text" name="sessionEndTime"/></p>
                                <p>
                                    <input type="button" class="btn btn-default" id="sessionAddBtn" data-dismiss="modal" value="保存"/>
                                    <input type="reset" class="btn btn-default" data-dismiss="modal" value="关闭"/>
                                </p>
                            </div>
                        </div>
                    </div>

                    <table border="1" cellspacing="0" id="sessionTable">
                        <tr>
                            <td>场次编号</td>
                            <td>开始时间</td>
                            <td>是否结束</td>
                            <td>操作</td>
                        </tr>
                        <!-- 遍历现有的所有部门 -->
                        <c:forEach items="${allSession}" var="session1">
                            <tr>
                                <td>${session1.sessionId}</td>
                                <td>${session1.sessionStartTime}</td>
                                <td>${session1.sessionFinish}</td>
                                <td>
                                    <input type="hidden" name="hidden" value="${session1.sessionId}"/>
                                    <button type="button" class="check" data-toggle="modal" data-target=".bs-example-modal-lg-session-check">查看</button>
                                    <button type="button" class="modify" data-toggle="modal" data-target=".bs-example-modal-lg-session-test">修改</button>
                                    <input type="button" class="delete" name="de1" id="sessionDele" value="删除"/>
                                </td>
                            </tr>
                        </c:forEach>
                        <div class="modal fade bs-example-modal-lg-session-test" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content"><br>
                                    <p>场次编号：<input id="SessionIDM" name="SessionIDM" readonly="readonly" disabled="disabled"/></p>
                                    <p>考生考号：<input id="SessionNumM"  type="text" name="SessionNumM" /></p>
                                    <p>开始时间：<input id="SessionStartTimeM" type="text" name="SessionStartTimeM" /></p>
                                    <p>结束时间：<input id="SessionEndTimeM" type="text" name="SessionEndTimeM" /></p>
                                    <p>是否结束：<input id="SessionFinishM" type="text" name="SessionFinishM" /></p>
                                    <button id="saveSession" class="btn btn-default" data-dismiss="modal">保存</button>
                                    <button id="closeSession" name="close" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <br>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade bs-example-modal-lg-session-check" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content"><br>
                                    <p>场次编号：<input id="SessionID" name="SessionID" readonly="readonly" disabled="disabled"/></p>
                                    <p>考生考号：<input id="SessionNum"  type="text" name="SessionNum" readonly="readonly" disabled="disabled" /></p>
                                    <p>开始时间：<input id="SessionStartTime" type="text" name="SessionStartTime" readonly="readonly" disabled="disabled"/></p>
                                    <p>结束时间：<input id="SessionEndTime" type="text" name="SessionEndTime" readonly="readonly" disabled="disabled"/></p>
                                    <p>是否结束：<input id="SessionFinish" type="text" name="SessionFinish" readonly="readonly" disabled="disabled"/></p>
                                    <button id="SessionClose" name="close" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </table>
                    <%--</form>--%>
                    <h4>备注：场次详情表</h4>
                </div>
            </div>
            <div class="tab-pane fade" id="yonghu">
                <p>用户</p>
                <div id="userDetail">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg-user">添加试题</button>

                    <div class="modal fade bs-example-modal-lg-user" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog" role="document" style="position:absolute;left: 30px">
                            <div class="modal-content"><br/>
                                <p>账号：<input type="text" name="userId"/></p>
                                <p>密码：<input type="text" name="userPsw"/></p>
                                <p>姓名：<input type="text" name="userName"/></p>
                                <p>权限：<input type="text" name="userRight"/></p>
                                <p>
                                    <input type="button" class="btn btn-default" id="userAddBtn" data-dismiss="modal" value="保存"/>
                                    <input type="reset" class="btn btn-default" data-dismiss="modal" value="关闭"/>
                                </p>
                            </div>
                        </div>
                    </div>

                    <table border="1" cellspacing="0" id="userTable" style="border-color: rgb(0 252 255)">
                        <tr>
                            <td>账号</td>
                            <td>姓名</td>
                            <td>权限</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${allUser}" var="user1">
                            <tr>
                                <td>${user1.userId}</td>
                                <td>${user1.userName}</td>
                                <td>${user1.userRight}</td>
                                <td>
                                    <input type="hidden" name="hidden" value="${user1.userId}"/>
                                    <button type="button" class="check" data-toggle="modal" data-target=".bs-example-modal-lg-user-check">查看</button>
                                    <button type="button" class="modify" data-toggle="modal" data-target=".bs-example-modal-lg-user-update">修改</button>
                                    <input type="button" class="delete" name="de1" id="de1User" value="删除"/>
                                </td>
                            </tr>
                        </c:forEach>
                        <div class="modal fade bs-example-modal-lg-user-update" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content"><br>
                                    <p>账号：<input id="userIdM" name="userIdM" readonly="readonly" disabled="disabled"/></p>
                                    <p>密码：<input id="userPswM"  type="text" name="userPswM" /></p>
                                    <p>姓名：<input id="userNameM" type="text" name="userNameM" /></p>
                                    <p>权限：<input id="userRightM" type="text" name="userRightM" /></p>
                                    <p>是否考试：<input id="isTestM" type="text" name="isTestM" /></p>
                                    <p>创建时间：<input id="creatTimeM" type="text" name="creatTimeM" readonly="readonly" disabled="disabled"/></p>
                                    <button  id="saveUser" class="btn btn-default" data-dismiss="modal">保存</button>
                                    <button id="closeUser" name="close" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <br>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade bs-example-modal-lg-user-check" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content"><br>
                                    <p>账号：<input id="userId" name="userId" readonly="readonly" disabled="disabled"/></p>
                                    <p>密码：<input id="userPsw"  type="text" name="userPsw" readonly="readonly" disabled="disabled" /></p>
                                    <p>姓名：<input id="userName" type="text" name="userName" readonly="readonly" disabled="disabled" /></p>
                                    <p>权限：<input id="userRight" type="text" name="userRight" readonly="readonly" disabled="disabled" /></p>
                                    <p>是否考试：<input id="isTest" type="text" name="isTest" readonly="readonly" disabled="disabled" /></p>
                                    <p>创建时间：<input id="creatTime" type="text" name="creatTime" readonly="readonly" disabled="disabled"/></p>
                                    <button id="UserClose" name="close" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </table>
                    <h4>备注：用户详情表</h4>
                </div>
            </div>
            <div class="tab-pane fade" id="chengji">
                <p>成绩</p>
                <div id="scoreDetail">
                    <table border="1" cellspacing="0" id="scoreTable" style="border-color: rgb(0 252 255)">
                        <tr>
                            <td>账号</td>
                            <td>姓名</td>
                            <td>权限</td>
                            <td>成绩</td>
                            <td>是否合格</td>
                            <td>考试时间</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${allScore}" var="score1">
                            <tr>
                                <td>${score1.userId}</td>
                                <td>${score1.userName}</td>
                                <td>${score1.userRight}</td>
                                <td>${score1.userName}</td>
                                <td>${score1.userRight}</td>
                                <td>${score1.userRight}</td>
                                <td>
                                    <input type="hidden" name="hidden" value="${score1.userId}"/>
                                    <button type="button" class="check" data-toggle="modal" data-target=".bs-example-modal-lg-score-check">查看</button>
                                    <input type="button" class="delete" name="de1" id="de1Score" value="删除"/>
                                </td>
                            </tr>
                        </c:forEach>

                        <div class="modal fade bs-example-modal-lg-score-check" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content"><br>
                                    <p>账号：<input id="scoreId" name="scoreId" readonly="readonly" disabled="disabled"/></p>
                                    <p>姓名：<input id="userNameScore" type="text" name="userNameScore" readonly="readonly" disabled="disabled"/></p>
                                    <p>权限：<input id="userRightScore" type="text" name="userRightScore" readonly="readonly" disabled="disabled"/></p>
                                    <p>成绩：<input id="scoreNum" type="text" name="scoreNum" readonly="readonly" disabled="disabled"/></p>
                                    <p>考试时间：<input id="scoreTime" type="text" name="scoreTime" readonly="readonly" disabled="disabled"/></p>
                                    <button id="ScoreClose" name="close" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </table>
                    <h4>备注：成绩详情表</h4>
                </div>
            </div>
        </div>
    </body>
</html>
