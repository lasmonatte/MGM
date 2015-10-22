<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="/mgm01/resources/css/style.css" /> -->
<title>MGM Games</title>
<link href="/mgm01/resources/tablecloth2/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/mgm01/resources/tablecloth2/tablecloth.js"></script>
</head>
<body>
	<div class="wrapper">
		<div class="top">
			<tiles:insertAttribute name="top" />
		</div>
		<div class="main">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
</body>
</html>