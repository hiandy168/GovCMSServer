﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./comm_checkuser.jsp" %>
<!DOCTYPE HTML>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" type="text/css" href="../assets/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="../assets/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="../assets/lib/Hui-iconfont/1.0.7/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="../assets/lib/icheck/icheck.css" />
		<link rel="stylesheet" type="text/css" href="../assets/static/h-ui.admin/skin/default/skin.css" id="skin" />
		<link rel="stylesheet" type="text/css" href="../assets/static/h-ui.admin/css/style.css" />
		<link rel="stylesheet" type="text/css" href="../assets/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css">

		<title>产品分类</title>
	</head>

	<body>
		<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 产品分类
			<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<table class="table">
			<tr>
				<td width="200" class="va-t">
					<ul id="treeDemo" class="ztree"></ul>
				</td>
				<td class="va-t">
					<iframe ID="testIframe" Name="testIframe" frameborder=0 scrolling="auto" width=100% height=390px src="web-navi-add.jsp"></iframe>
				</td>
			</tr>
		</table>
		<script type="text/javascript" src="../assets/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="../assets/lib/layer/2.1/layer.js"></script>
		<script type="text/javascript" src="../assets/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
		<script type="text/javascript" src="../assets/static/h-ui/js/H-ui.js"></script>
		<script type="text/javascript" src="../assets/static/h-ui.admin/js/H-ui.admin.js"></script>
		<script type="text/javascript">
			var setting = {
				view: {
					dblClickExpand: false,
					showLine: false,
					selectedMulti: false
				},
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "pId",
						rootPId: ""
					}
				},
				callback: {
					beforeClick: function(treeId, treeNode) {
						var zTree = $.fn.zTree.getZTreeObj("tree");
						if(treeNode.isParent) {
							zTree.expandNode(treeNode);
							return false;
						} else {
							demoIframe.attr("src", treeNode.file + ".html");
							return true;
						}
					}
				}
			};

			var zNodes = [{
				id: 1,
				pId: 0,
				name: "一级分类",
				open: true
			}, {
				id: 11,
				pId: 1,
				name: "二级分类"
			}, {
				id: 111,
				pId: 11,
				name: "三级分类"
			}, {
				id: 112,
				pId: 11,
				name: "三级分类"
			}, {
				id: 113,
				pId: 11,
				name: "三级分类"
			}, {
				id: 114,
				pId: 11,
				name: "三级分类"
			}, {
				id: 115,
				pId: 11,
				name: "三级分类"
			}, {
				id: 12,
				pId: 1,
				name: "二级分类 1-2"
			}, {
				id: 121,
				pId: 12,
				name: "三级分类 1-2-1"
			}, {
				id: 122,
				pId: 12,
				name: "三级分类 1-2-2"
			}, ];

			var code;

			function showCode(str) {
				if(!code) code = $("#code");
				code.empty();
				code.append("<li>" + str + "</li>");
			}

			$(document).ready(function() {
				var t = $("#treeDemo");
				t = $.fn.zTree.init(t, setting, zNodes);
				demoIframe = $("#testIframe");
				demoIframe.bind("load", loadReady);
				var zTree = $.fn.zTree.getZTreeObj("tree");
				zTree.selectNode(zTree.getNodeByParam("id", '11'));
			});
		</script>
	</body>

</html>