<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title></title>
<style type="text/css">
tr th:nth-of-type(1) {
	width: 50px;
}
</style>
</head>

<body>
       <!-- ▼ 마일리지 출금 내역 //-->
				<!-- DataTables Example -->
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  	<th>번호</th>
                    <th>이전 마일리지</th>
                    <th>마일리지 증감량</th>
                    <th>마일리지 증감내용</th>
                    <th>현재 마일리지</th>
                    <th>일자</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                 	<th>번호</th>
                    <th>이전 마일리지</th>
                    <th>마일리지 증감량</th>
                    <th>마일리지 증감내용</th>
                    <th>현재 마일리지</th>
                    <th>일자</th>
                  </tr>
                </tfoot>
                <tbody id="tbody">
					<c:forEach items="${mileage_dto}" var="dto" varStatus="status">
						<tr>
							<td>${status.count}</td>

							<td><fmt:formatNumber value="${dto.m_total-dto.m_list}" pattern="###,###"/> 원</td>
							<c:choose>
								<c:when test="${dto.m_list} > 0"><td>+${dto.m_list}</td></c:when>
								<c:otherwise><td><fmt:formatNumber value="${dto.m_list}" pattern="###,###"/> 원</td></c:otherwise>
							</c:choose>
							<td>${dto.m_content}</td>
							<td><fmt:formatNumber value="${dto.m_total}" pattern="###,###"/> 원</td>
							<td><fmt:formatDate value="${dto.m_day}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
					</c:forEach>
                </tbody>
              </table>
            </div>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

	<!-- ▲ 마일리지 출금 내역 //-->

				
</body>
</html>
