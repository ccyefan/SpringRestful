<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript">
        function delete_emp(id) {
            var r = window.confirm("确定要删除此数据吗？");
            if(r) {
                //location.href = "deleteEmp.do?id="+id;
                $.ajax({
                    type:"DELETE",
                    url:"/SpringRestful/emp/"+id,
                    dataType:"json",
                    success:function(data){
                        location.href = "/SpringRestful/emp/find";
                    }
                }); 
            }
        }
    </script>
</head>
<body>
    <div align="center">
        <!-- <input type="button" value="新增" onclick="location.href='toAddEmp.do'"/> -->
        <input type="button" value="新增" onclick="location.href='toAdd'"/>
    </div>
    <table width="60%" border="1" cellpadding="2" cellspacing="0" align="center">
        <tr>
            <th>EMPNO</th>
            <th>ENAME</th>
            <th>JOB</th>
            <th>MGR</th>
            <th>HIREDATE</th>
            <th>SAL</th>
            <th>COMM</th>
            <th>DEPTNO</th>
            <th></th>
        </tr>
        <c:forEach items="${emps }" var="emp">
            <tr>
                <td>${emp.empno }</td>
                <td>${emp.ename }</td>
                <td>${emp.job }</td>
                <td>${emp.mgr }</td>
                <td>${emp.hiredate }</td>
                <td>${emp.sal }</td>
                <td>${emp.comm }</td>
                <td>${emp.deptno }</td>
                <td>
                    <!-- <input type="button" value="修改" onclick="location.href='toUpdateEmp.do?id=${emp.empno }'"/>
                    <input type="button" value="删除" onclick="delete_emp(${emp.empno });"/> -->
                    <input type="button" value="修改" onclick="location.href='toUpdate/${emp.empno }'"/>
                    <input type="button" value="删除" onclick="delete_emp(${emp.empno });"/>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>