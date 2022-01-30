<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/stuMypage.css?second">
<style>
	.conhead{
        width: 90%;
	    height: 15%;
        margin: auto;
	}
	.content1, .content2{
	    width: 80%;
	    height: 50%;
	    margin: auto;
	    float: right;
	}
	.conhead>h2{width: 50%; border: 1px solid;}
	.conhead>a{float: right; margin-top: -20px;}
	table{
	    border: 1px solid;
	    width: 90%;
	    margin: auto;
	    text-align: center;
	}
</style>
</head>
<body>
	<div class="content1">
    <div class="conhead">
        <h2>클래스 문의</h2>
        <a href="?page=myClassQnaDetail.jsp">더보기</a>
    </div>
    <table>
        <thead>
            <tr>
                <th>클래스</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>여자의 힘은 여자가 기른다! 샤크코치의 근력 운동!</td>
                <td>수강중</td>
            </tr>
            <tr>
                <td>여자의 힘은 여자가 기른다! 샤크코치의 근력 운동!</td>
                <td>수강중</td>
            </tr>
            <tr>
                <td>여자의 힘은 여자가 기른다! 샤크코치의 근력 운동!</td>
                <td>수강중</td>
            </tr>
        </tbody>
    </table>
</div>  
<div class="content2">
    <div class="conhead">
        <h2>클래스 후기</h2>
        <a href="?page=myClassReviewDetail.jsp">더보기</a>
    </div>
    <table>
        <thead>
            <tr>
                <th>클래스</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>여자의 힘은 여자가 기른다! 샤크코치의 근력 운동!</td>
                <td>수강중</td>
            </tr>
            <tr>
                <td>여자의 힘은 여자가 기른다! 샤크코치의 근력 운동!</td>
                <td>수강중</td>
            </tr>
            <tr>
                <td>여자의 힘은 여자가 기른다! 샤크코치의 근력 운동!</td>
                <td>수강중</td>
            </tr>
        </tbody>
    </table>
</div> 
</body>
</html>