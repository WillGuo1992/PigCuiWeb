<!DOCTYPE html>  
<html>  
<head>  
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<title>Hello, World</title>  
<style type="text/css">  
html{height:100%}  
body{height:100%;margin:0px;padding:0px}  
#container{height:100%}  
</style>  
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Hax5x1hqeGH5aOQvedsRNfqjGPG69OOj">
</script>
</head>  
 
<body>  
<div id="container"></div> 
<script type="text/javascript"> 
var map = new BMap.Map("container");          // 创建地图实例  
map.enableScrollWheelZoom();
map.addControl(new BMap.NavigationControl());    
map.addControl(new BMap.ScaleControl());    
map.addControl(new BMap.OverviewMapControl());    
map.addControl(new BMap.MapTypeControl());  
map.setCurrentCity("北京");
var point = new BMap.Point(116.404, 39.915);  // 创建点坐标  
map.centerAndZoom(point, 15);                 // 初始化地图，设置中心点坐标和地图级别  


//定义自定义覆盖物的构造函数  
function SquareOverlay(center, length, color){    
 this._center = center;    
 this._length = length;    
 this._color = color;    
}    
// 继承API的BMap.Overlay    
SquareOverlay.prototype = new BMap.Overlay();
//实现初始化方法  
SquareOverlay.prototype.initialize = function(map){    
// 保存map对象实例   
 this._map = map;        
 // 创建div元素，作为自定义覆盖物的容器   
 var div = document.createElement("div");    
 div.style.position = "absolute";        
 // 可以根据参数设置元素外观   
 div.style.width = this._length + "px";    
 div.style.height = this._length + "px";    
 div.style.background = this._color;      
// 将div添加到覆盖物容器中   
 map.getPanes().markerPane.appendChild(div);      
// 保存div实例   
 this._div = div;      
// 需要将div元素作为方法的返回值，当调用该覆盖物的show、   
// hide方法，或者对覆盖物进行移除时，API都将操作此元素。   
 return div;    
}
//实现绘制方法   
SquareOverlay.prototype.draw = function(){    
// 根据地理坐标转换为像素坐标，并设置给容器    
 var position = this._map.pointToOverlayPixel(this._center);    
 this._div.style.left = position.x - this._length / 2 + "px";    
 this._div.style.top = position.y - this._length / 2 + "px";    
}
var mySquare = new SquareOverlay(map.getCenter(), 100, "red");    
map.addOverlay(mySquare);
var tilelayer = new BMap.TileLayer();         // 创建地图层实例    
tilelayer.getTilesUrl=function(){             // 设置图块路径     
          return "layer.gif";      
};      
map.addTileLayer(tilelayer);                // 将图层添加到地图上
</script>  
</body>  
</html>