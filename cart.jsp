<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/magenda.css">

<title>カート</title>
<script>
	function checkValue(check) {
		var checkList = document.getElementsByClassName("checkList");
		var checkFlg = 0;
		for (var i = 0; i < checkList.length; i++) {
			if (checkFlg == 0) {
				if (checkList[i].checked) {
					checkFlg = 1;
					break;
				}
			}
		}
		if (checkFlg == 1) {
			document.getElementById('delete_btn').disabled = "";
		} else {
			document.getElementById('delete_btn').disabled = "true";
		}
	}
</script>
</head>

<body>
	<jsp:include page="header.jsp" />
	<div id="contents">
		<h1>カート画面</h1>

	<s:if test="!#session.cartInfoDTOList.size() > 0">

			<div class="nomal">

				カート情報はありません。

			</div>
		</s:if>
		<s:else>
			<s:form id="form" action="SettlementConfirmAction">
				<table class="horizontal-list-table">
					<thead>
						<tr>
							<th><s:label value="#" /></th>
							<th><s:label value="商品名" /></th>
							<th><s:label value="商品名ふりがな" /></th>
							<th><s:label value="商品画像" /></th>
							<th><s:label value="値段" /></th>
							<th><s:label value="発売会社名" /></th>
							<th><s:label value="発売年月日" /></th>
							<th><s:label value="購入個数" /></th>
							<th><s:label value="合計金額" /></th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#session.cartInfoDTOList">
							<tr>
								<td><s:checkbox name="checkList" class="checkList"
										value="checked" fieldValue="%{productId}"
										onchange="checkValue(this)" /></td>
								<td><s:property value="productName" /></td>
								<td><s:property value="productNameKana" /></td>
								<td><img
									src='<s:property value="productImageFilePath"/>/<s:property value="productImageFileName"/>'
									width="50px" height="50px" /></td>
								<td><s:property value="price" />円</td>
								<td><s:property value="productReleaseCompany" /></td>
								<td><s:property value="productReleaseDate" /></td>
								<td><s:property value="productCount" /></td>
								<td><s:property value="subtotal" />円</td>
							</tr>

						</s:iterator>
					</tbody>
				</table>

				<h2>
					<s:label value="カート合計金額:" />
					<s:property value="#session.totalPrice" />
					円
				</h2>
				<br>
				<div class="submit_btn_box">
						<s:submit value="決済" class="submit_btn" />
				</div>
				<div class="submit_btn_box">
						<s:submit value="削除" id="delete_btn" class="submit_btn"
							onclick="this.form.action='DeleteCartAction';" disabled="true" />
				</div>
			</s:form>
		</s:else>
	</div>
</body>
</html>