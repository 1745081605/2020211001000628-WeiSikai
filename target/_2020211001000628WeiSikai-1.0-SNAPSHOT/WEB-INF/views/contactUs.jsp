<%@include file="/WEB-INF/views/header.jsp" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
	.iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<div id="contact-page" class="container">
	<!-- <div class="bg">
        <div class="row">
            <div class="col-sm-12">
                <h2 class="title text-center">Contact <strong>Us</strong></h2>
                </div>
            </div>
        </div>     -->
	<div class="row">
		<div class="col-sm-8">
			<div  class="contact-map" id="dituContent"></div>
			<!-- <div class="contact-form">
                <h2 class="title text-center">Get In Touch</h2>
                <div class="status alert alert-success" style="display: none"></div>
                <form id="main-contact-form" class="contact-form row" name="contact-form" action="EmailSendingServlet" method="post">
                    <div class="form-group col-md-6">
                        <input type="text" name="name" class="form-control" required="required" placeholder="Name">
                    </div>
                    <div class="form-group col-md-6">
                        <input type="email" name="recipient" class="form-control" required="required" placeholder="Email">
                    </div>
                    <div class="form-group col-md-12">
                        <input type="text" name="subject" class="form-control" required="required" placeholder="Subject">
                    </div>
                    <div class="form-group col-md-12">
                        <textarea name="content" id="message" required="required" class="form-control" rows="8" placeholder="Your Message Here"></textarea>
                    </div>
                    <div class="form-group col-md-12">
                        <input type="submit" name="submit" class="btn btn-primary pull-right" value="Submit">
                    </div>
                </form>
            </div>
 -->		</div>
		<div class="col-sm-4">
			<div class="contact-info">
				<h2 class="title text-center">Contact Info</h2>
				<address>
					<p>ECJTU</p>
					<p> 808, Shuanggang East Street</p>
					<p>Economic and Technological Development Zone</p>
					<p>Nanchang City, Jiangxi Province</p>
					<p>Fax: 1-714-252-0026</p>
					<p>Email: info@e-shopper.com</p>
				</address>
				<div class="social-networks">
					<h2 class="title text-center">Social Networking</h2>
					<ul>
						<li>
							<a href="#"><i class="fa fa-facebook"></i></a>
						</li>
						<li>
							<a href="#"><i class="fa fa-twitter"></i></a>
						</li>
						<li>
							<a href="#"><i class="fa fa-google-plus"></i></a>
						</li>
						<li>
							<a href="#"><i class="fa fa-youtube"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</div><!--/#contact-page-->
<script type="text/javascript">
	function initMap(){
		createMap();
		setMapEvent();
		addMapControl();
		addMarker();
	}
	function createMap(){
		var map = new BMap.Map("dituContent");
		var point = new BMap.Point(115.876018,28.749703);
		map.centerAndZoom(point,17);
		window.map = map;
	}
	function setMapEvent(){
		map.enableDragging();
		map.enableScrollWheelZoom();
		map.enableDoubleClickZoom();
		map.enableKeyboard();
	}
	function addMapControl(){
		var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
		map.addControl(ctrl_nav);
		var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
		map.addControl(ctrl_ove);
		var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
		map.addControl(ctrl_sca);
	}
	var markerArr = [{title:"华东交通大学",content:"华东交通大学<br/>江西省南昌市青山湖区双港东大街808号<br/>(0791)87046576",point:"115.873619|28.750131",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
	];
	function addMarker(){
		for(var i=0;i<markerArr.length;i++){
			var json = markerArr[i];
			var p0 = json.point.split("|")[0];
			var p1 = json.point.split("|")[1];
			var point = new BMap.Point(p0,p1);
			var iconImg = createIcon(json.icon);
			var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
			marker.setLabel(label);
			map.addOverlay(marker);
			label.setStyle({
				borderColor:"#808080",
				color:"#333",
				cursor:"pointer"
			});
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.openInfoWindow(_iw);
				_marker.addEventListener("click",function(){
					this.openInfoWindow(_iw);
				});
				_iw.addEventListener("open",function(){
					_marker.getLabel().hide();
				})
				_iw.addEventListener("close",function(){
					_marker.getLabel().show();
				})
				label.addEventListener("click",function(){
					_marker.openInfoWindow(_iw);
				})
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
		}
	}
	function createInfoWindow(i){
		var json = markerArr[i];
		var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
		return iw;
	}
	function createIcon(json){
		var icon = new BMap.Icon("<%=basePath%>images/home/pin.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
		return icon;
	}
	initMap();
</script>
<%@include file="/WEB-INF/views/footer.jsp" %>