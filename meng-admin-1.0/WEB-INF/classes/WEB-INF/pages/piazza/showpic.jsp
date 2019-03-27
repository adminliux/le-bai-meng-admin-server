
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    </style>
    <title>图片展示</title>
    <%@include file="../base/header.jsp"%>
</head>
<body>
   <table>

      <c:forEach items="${address}" var="p" varStatus="s">
        <tr>
          <img src="${p}">
           &nbsp<br>
        </tr>
      </c:forEach>
       </tr>
   </table>
<%@include file="../base/footer.jsp"%>
</body>

</html>
