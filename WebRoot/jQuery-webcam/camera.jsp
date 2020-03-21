<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="utf-8">
    <title>酒店管理系统</title>
    <script src="./jquery-1.11.3.min.js"></script>
    <script src="./jquery.webcam.js"></script>
    <style type="text/css">
        /* CSS */
        .borderstyle {
            border: 1px solid #b6b6b6;
            width: 320px;
            height: 240px;
        }

        #camera {
            float: left;
            margin: 10px;
        }

        #canvas {
            width: 320px;
            height: 240px;
            margin: 10px;
        }
    </style>
</head>
<!-- index.html -->
<body>
<div>
    <div id="camera" class="borderstyle"></div>
    <canvas id="canvas" class="borderstyle" width="320px" height="240px"></canvas>
    <div id="showImg"></div>
    <button class="play">拍照</button>
</div>
<script src="./camera.js"></script>
</body>
</html>