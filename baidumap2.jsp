<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset= utf-8" />
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
  <style type="text/css">
    body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
    #allmap{height:90%;width:100%;}
    #r-result{width:100%;}
  </style>
  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Hax5x1hqeGH5aOQvedsRNfqjGPG69OOj"></script>
  <title>GroundOverlay</title>
</head>
<body>
  <div id="allmap"></div>
  <div id="r-result">
    <input type="button" onclick="addGroundOverlay();" value="add" />
    <input type="button" onclick="removeGroundOverlay();" value="delete" />
  </div>
</body>
</html>
<script type="text/javascript">
  var TianAnMen = new BMap.Point(116.35709,39.986691);

  // 创建Map实例
  var map = new BMap.Map("allmap");

  // 居中放大
  map.centerAndZoom(TianAnMen, 16);

  // 启用滚轮放大缩小
  map.enableScrollWheelZoom();

  // 西南角和东北角
  //var SW = new BMap.Point(116.29579,39.837146);
  //var NE = new BMap.Point(116.475451,39.9764);
  var SW = new BMap.Point(116.35709,39.986691);
  var NE = new BMap.Point(116.358392,39.987103);
 

  groundOverlayOptions = {
    opacity: 1,
    displayOnMinLevel: 18,
    displayOnMaxLevel: 19
  }

  // 初始化GroundOverlay
  var groundOverlay = new BMap.GroundOverlay(new BMap.Bounds(SW, NE), groundOverlayOptions);

  // 设置GroundOverlay的图片地址
  groundOverlay.setImageURL('./imgs/g11.png');

  // 单击事件
  groundOverlay.addEventListener('click', function (clickEvent) {
    // console.log('clickEvent', clickEvent);
  });

  // 双击事件
  groundOverlay.addEventListener('dblclick', function (dblclickEvent) {
    // console.log('dblclickEvent', dblclickEvent);
	
  });
  addGroundOverlay();
  function addGroundOverlay() {
    // 添加GroundOverlay
    map.addOverlay(groundOverlay);
  }

  function removeGroundOverlay() {
    // 移除GroundOverlay
    map.removeOverlay(groundOverlay);
  }
</script>
