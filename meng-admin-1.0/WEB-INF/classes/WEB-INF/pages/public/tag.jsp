<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: chengbing Qiu
  Date: 2016/12/27
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="apiHost" value="${config.apiHost}"/>
<c:set var="baseEntityPackage" value="com.rpframework.module.common.bottom.entity."/>
<c:set var="baseEntityPackageSer" value="com.daolezuche.entity."/>
<%@include file="var.jsp" %>