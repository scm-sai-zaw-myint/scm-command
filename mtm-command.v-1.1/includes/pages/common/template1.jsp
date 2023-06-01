<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><tiles:getAsString name="title" /></title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
  <tiles:insertAttribute name="header" />

  <section class="body">
    <tiles:insertAttribute name="body" />
  </section>
</body>
</html>