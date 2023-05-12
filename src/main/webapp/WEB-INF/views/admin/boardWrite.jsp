<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- header  -->
	<%@ include file="../include/header.jsp"%>
	<!-- header  -->
<style type="text/css">

.btn-backlist {
font-weight:bold;
font-size:15px;
border-radius:6px; 
 	width: 300px; 
 	height: 45px;
 background: #C9BA9B;
}
.btn-backlist:active {
 background: #A58C59;
 color: white;
 border: 3px gray inset;
}


.btn-write {
font-weight:bold;
font-size:15px;
border-radius:6px; 
 	width: 300px; 
 	height: 45px;
 background: #C9BA9B;
}
.btn-write:active {
 border: 3px gray inset;
 background: #A58C59;
 color: white;
}
</style>



	<!-- body  -->
	<div style="margin: 45px 0;">
	<div style="padding-left:20px; position: relative;" >
	<hr style="width: 8%;position: absolute; ">
		<h1 style="margin-left: 10%;line-height: inherit;">공지사항 </h1>
	</div>
</div>
	


	<div
		style="width: 100%; height: auto; background: white; display: inline-block; box-sizing: border-box; border: 1px">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<!-- search  -->
					<div style="display: flex; padding-bottom: 30px; margin-left: 31%;" class="search-box">
						<div>
							<h3 class="box-title" style="font-size: x-large;">글작성</h3>
						</div>



					</div>
					<!-- content  -->
					<form role="form">
					<div style="display: flex;">
						<div style="display: block;width: 40%;border: solid 1px gray;padding: 55px;border-radius: 5px; margin: auto;">
							<div style="display: block; width: 100%;">
								<label>글 제목</label>
								<input style="margin-bottom: 30px;border: 1px solid gray;"
									type="text" id="b_title1" name="b_title" placeholder="제목을 입력해주세요.">
							</div>
							<div style="">
								<label>글 내용</label>
								<textarea rows="15" id="b_content1" name="b_content" placeholder=" 내용을 입력해주세요." 
								style="width:100%; overflow: initial"></textarea>
							</div>
							<!-- button   -->
							<div style="display: flex; margin: 30px 0 30px; justify-content: space-between;">
								<div>
									<button type="submit" class="btn-write">작성하기 </button>
								</div>
								<div>
									<button id="backList" class="btn-backlist" > 목록으로 </button>
								</div>
							</div>
							<!-- button   -->
						</div>
						
					</div>
					</form>
					<!-- content  -->
				</div>
			</div>
		</div>
	</div>
	<!-- body  -->
      <script type="text/javascript">
     	 $(document).ready(function(){
		    	 
     		 
     		 // 글번호를 저장한 폼태그
		    	 var formObj = $("form");
		    	 // alert(formObj);
		    	 console.log(formObj);
		    	 
		    	// 글쓰기
				  $(".btn-write").click(function(){
					  var title = document.getElementById("b_title1");
					  var content = document.getElementById("b_content1");
					  if(title.value === ""){
						  alert("글 제목을 입력하여주세요!");
						  title.focus();
						  }
					  else if(content.value === ""){
						  alert("글 내용을 입력하여주세요!");
						  content.focus();
						  
					  }else{
					  
					  formObj.attr("action","/admin/boardWrite");
					  // 폼태그 이동방식 설정 GET
					  formObj.attr("method","post");
					  // 폼태그 정보 저장해서 페이지 이동
					  formObj.submit();			  
					  }
				  });
		    	
		     	 $("#backList").click(function(){
		     		 return window.location.href = "/board/notice";
		     	 })
		  });
      
      </script>
	<!-- footer  -->
	<%@ include file="../include/footer.jsp"%>
	<!-- footer  -->