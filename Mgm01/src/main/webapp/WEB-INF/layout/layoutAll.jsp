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
<link rel="stylesheet" type="text/css" href="/mgm01/resources/css/table-dark-styles.css" />
<style type="text/css">

body{
	background-image: url(/mgm01/resources/images/background_gam.jpg);
	background-repeat: repeat-x;
	background-attachment: fixed;
	color: #FAED7D;
	font: 100%, Arial, Helvetica, sans-serif;
	font-size: medium;
	font-weight:bold;
	 text-shadow: rgba(0, 0, 0, .2) 3px 3px 3px;
     
}
</style>
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