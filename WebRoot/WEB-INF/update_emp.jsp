<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/json.js"></script>
    <script type="text/javascript">
        function save() {
               $.ajax({
                   type:"PUT",
                   url:"/SpringRestful/emp/update",
                   data:JSON.stringify($("#myform").serializeObject()),
                   dataType:"json",
                   contentType:"application/json",
                   success:function(data){
                       location.href = "/SpringRestful/emp/find";
                   }
               });
           }         
    </script>
</head>
<body>
    <form action="updateEmp.do" method="post" id="myform">
        <table width="40%" border="1" cellpadding="2" cellspacing="0" align="center">
            <tr>
                <td>EMPNO：</td>
                <td><input type="text" name="empno" value="${emp.empno }"/></td>
            </tr>
            <tr>
                <td>姓名：</td>
                <td><input type="text" name="ename" value="${emp.ename }"/></td>
            </tr>
            <tr>
                <td>岗位：</td>
                <td><input type="text" name="job" value="${emp.job }"/></td>
            </tr>
            <tr>
                <td>工资：</td>
                <td><input type="text" name="sal" value="${emp.sal }"/></td>
            </tr>
            <tr>
                <!-- <td colspan="2"><input type="submit" value="保存"/></td> -->
                <td colspan="2"><input type="button" value="保存" onclick="save();"/></td>
            </tr>
        </table>
    </form>    
</body>
</html>