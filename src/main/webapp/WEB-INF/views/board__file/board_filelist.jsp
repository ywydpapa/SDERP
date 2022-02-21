<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="../modal/AttachedFile.jsp"/>
<div class="card-block table-border-style">
	<div class="table-responsive" style="overflow-x: hidden;">
		<!-- <form name="form2" method="post" onsubmit="return false;"> -->
		<table class="table table-sm bst02 filelist">
			<colgroup>
				<col width="25%" />
				<col width="45%" />
				<col width="20%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th class="text-center">일자</th>
					<th class="text-center">파일명</th>
					<th class="text-center">파일설명</th>
					<th class="text-center">작성자</th>
					<th class="text-center">삭제</th>
				</tr>
			</thead>
			<tbody id="ItemFilelist">
				<c:forEach var="row2" items="${board_filedata_detail}">
					<tr class="item1">
						<td class="text-center">${fn:substring(row2.uploadDate, 0, 10)}</td>
						<td><a href="javascript:downloadFile('${row2.fileId}', '${row2.fileName}');">${row2.fileName}</a></td>
						<td>${row2.fileDesc}</td>
						<td>${row2.userName}</td>
						<td style="text-align: center;"><button class="btn btn-sm btn-inverse" onclick="javascript:deleteFile('${row2.fileId}');">삭제</button></td>
					</tr>
					<c:remove var="repName" />
				</c:forEach>
			</tbody>
		</table>
		<!-- </form> -->
	</div>
</div>

<script>

	function fileTableCreate(data) {
		var html = '';
		if(data.length > 0){
			for(var i=0; i<data.length; i++){
				html = html + '<tr class="item1">' +
								'<td>'+data[i].uploadDate+'</td>' +
								'<td><a href="javascript:downloadFile(\''+data[i].fileId+'\');">'+data[i].fileName+'</a></td>' +
								'<td>'+data[i].fileDesc+'</td>' +
								'<td>'+data[i].userName+'</td>' +
								'<td style="text-align: center;"><button class="btn btn-sm btn-inverse" onclick="javascript:deleteFile(\''+data[i].fileId+'\');">삭제</button></td>' +
							  '</tr>';
			}
		}
		return html;
	}

	function uploadFile() {
		var uploadForm = $('#uploadForm')[0];
		var uploadData = new FormData(uploadForm);
		if(!uploadData.get('file').name) {
			alert('파일을 선택해주세요');
		}else {
			uploadData.append('fileDesc', $('#fileDesc').val());
			$.ajax({
				url : "${path}/board__file/uploadfile/"+$("#bf_pk").val(),
				method : "POST",
				data : uploadData,
				contentType : false,
				processData : false,
			}).done(function(result){
				if(result.code == 10001){
					alert('파일 업로드 완료');
					$("#fileUploadModal").modal("hide");
					var html = fileTableCreate(result.data);
					$("#ItemFilelist").empty();
					$("#ItemFilelist").html(html);
				}else {
					alert('파일 업로드 실패');
				}
			}).fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}
	}

	function deleteFile(fileId) {
		if(!confirm("정말 삭제하시겠습니까?")){
			return false;
		}

		var deleteData = {};
		deleteData.bf_pk = $("#bf_pk").val();
		deleteData.fileId = fileId;
		$.ajax({
			url : "${path}/board__file/deleteFile",
			data : deleteData,
			method : "POST",
		}).done(function(result, status, xhr){
			if(result.code == 10001){
				alert('파일 삭제 완료');
				var html = fileTableCreate(result.data);
				$("#ItemFilelist").empty();
				$("#ItemFilelist").html(html);

			}else {
				alert('파일 삭제 실패');
			}
		}).fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}


	function downloadFile(fileId, fileName) {
		var downloadData = {};
		downloadData.bf_pk = $("#bf_pk").val();
		downloadData.fileId = fileId;

		$.ajax({
			url : "${path}/board__file/downloadfile",
			data : downloadData,
			method : "POST",
			xhrFields: {
				responseType: 'blob'
			},
		}).done(function(data, status, xhr){
			/* var fileName = xhr.getResponseHeader('content-disposition'); */
			var link = document.createElement('a');
			link.href = window.URL.createObjectURL(data);
			link.download = fileName;
			link.click();

		}).fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}
</script>