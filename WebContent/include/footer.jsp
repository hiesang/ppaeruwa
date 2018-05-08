<div id="footer_nav">
	<div class="container">
		<div class="row" style="margin-bottom:0">
			<div class="col s12">
				<ul class="clearfix">
					<li><a href="${path}/main.do?method=main"><i class="material-icons dp48">home</i></a></li>
					<li>
							<c:choose>
								<c:when test="${not empty member.email}">
									<a href="${path}/timeline.do?method=list&email=${member.email}"><i class="material-icons dp48">chrome_reader_mode</i></a>
								</c:when>
								<c:otherwise>
									<a href="${path}/timeline.do?method=list"><i class="material-icons dp48">chrome_reader_mode</i></a>
								</c:otherwise>
							</c:choose>
					</li>
					<li><a href="${path}/member/searchMem.jsp"><i class="material-icons dp48">search</i></a></li>
					<li><a href="${path}/no/mypage.jsp"><i class="material-icons dp48">account_box</i></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>