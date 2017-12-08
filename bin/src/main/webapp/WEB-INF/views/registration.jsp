<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="decorator" content="security" />
<title></title>
</head>
<body>
	<div class="row">
		<div class="col-sm-6 col-sm-offset-3 form-box">
			<div class="form-top">
				<div class="form-top-left">
					<h3>Registration Form</h3>
					<p>Add new user to access the system</p>
				</div>
				<div class="form-top-right">
					<i class="fa fa-lock"></i>
				</div>
			</div>
			<div class="form-bottom">
				<form role="form"  th:object="${user}" autocomplete="off" action="#" th:action="@{/registration}"  method="post" class="login-form">
					<div class="form-group">
						
						<input type="text" th:field="*{name}" placeholder="Name" class="form-username form-control" /> 
					</div>
					<div class="form-group">
					
						<input type="text" th:field="*{lastName}"
								placeholder="Last Name" class="form-username form-control" />
					</div>
					<div class="form-group">
					
						<input type="text" th:field="*{email}" placeholder="Email"
								class="form-username form-control" />
					</div>					
					<div class="form-group">
					
						<input type="password" th:field="*{password}"
								placeholder="Password" class="form-username form-control" />
					</div>
					<button type="submit" class="btn">Registration</button><br/>
					<span th:utext="${successMessage}"></span>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
