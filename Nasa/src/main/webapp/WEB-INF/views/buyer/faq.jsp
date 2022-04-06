<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Hero Start-->
	<div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>자주 묻는 질문</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Hero End -->

    <section class="blog_area section-padding">
        <div class="container" style="margin-top: 60px; margin-bottom: 100px;">
            <div onclick="faqopen()"><h1>ㅂ1</h1></div>
            <div id="faqsub" style="display:none;">
                <p>qq</p>
            </div>
        </div>
    </section>

    <script>
        function faqopen() {
            $("#faqsub").toggle(300);
        }
    </script>
</body>
</html>