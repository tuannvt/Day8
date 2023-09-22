<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href='${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/css/bootstrap.min.css' />
<script type="text/javascript" src="${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring MVC</title>
<style>
    .container {
        width: 1500px;
        margin: 0 auto;
    }
    fieldset .scheduler-border{
     border:1px groove #ddd !important;
     padding: 0 1.4em 1.4em 1.4em !important;
     margin: 0 0 1.5em 0 !important;
     -webkit-box-shadow: 0px 0px 0px 0px #000;
     box-shadow:0px 0px 0px 0px #000;
    }
    legend .scheduler-border{
         font-size:1.2em !important;
         font-weight:bold !important;
         text-align:left !important;
         width: auto;
         padding: 0 10px;
         border-bottom:none;
        }
</style>
</head>
<body>
<header>
  <div class="container">
    <ul class="nav" style="margin-top:10px"; >
        <li class="nav-item">
          <a class="nav-link active" href="#">Spring Web MVC demo</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="newBook">Add book</a>
        </li>
    </ul>
  </div>
</header>
<div class="container" style="margin-top:10px">
    <mvc:form  action="${action}" method ="post" modelAttribute="book">
      <fieldset class="scheduler-border">
        <legend class="scheduler-border">
          <c:out value="${msg}"/>
        </legend>
        <c:if test="${type.equals('update')}">
          <div class="form-group">
            <label class="control-label">ID</label>
            <mvc:input path="id" type="text" class="form-control" placeholder="ID" disabled="true"/>
            <mvc:hidden path="id"/>
            <mvc:hidden path="bookDetails.id"/>
          </div>
        </c:if>
        <div class="form-group">
          <label class="control-label">Name(*)</label>
          <mvc:input path="name" type="text" class="form-control" placeholder="Name" required="true"/>
        </div>
        <div class="form-group">
          <label class="control-label">Author(*)</label>
          <mvc:input path="author" type="text" class="form-control" placeholder="Author" required="true"/>
        </div>
        <div class="form-group">
                  <label class="control-label">ISBN(*)</label>
                  <mvc:input path="bookDetails.isbn" type="text" class="form-control" placeholder="ISBN" required="true"/>
                </div>
        <div class="form-group">
                          <label class="control-label">Price(*)</label>
                          <mvc:input path="bookDetails.price" type="number" step="any" class="form-control" placeholder="Price" required="true" min="1"/>
                        </div>
        <div class="form-group">
                                  <label class="control-label">Number of pages(*)</label>
                                  <mvc:input path="bookDetails.numberOfPage" type="number" class="form-control" placeholder="Number of pages" required="true" min="1"/>
                                </div>
        <div class="form-group">
                          <label class="control-label">Publish Date(*)</label>
                          <mvc:input path="bookDetails.publishDate" type="date" class="form-control" placeholder="Publish Date" required="true"/>
                        </div>
        <div class="form-group">
                          <label class="control-label">Category(*)</label>
                          <mvc:select path="category.id" class="form-control">
                            <mvc:option value="0" label="------ Select-------" />
                            <mvc:options items="${categoryList}" />
                          </mvc:select>
                        </div>
                        <br>
                        <button type"submit" class="btn btn-info">Save</button>
      </fieldset>
      </mvc:form>
  </div>
</main>
</body>
</html>